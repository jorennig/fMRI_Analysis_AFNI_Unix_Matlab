clear all
close all
clc

% Behavioral data
load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results/Audiovisual_Noisy_Behav.mat');
data_trial = table2array(data_behav_tot);
sub = unique(data_trial(:,1));

% Design
dir_c = pwd;
load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Design/Noisy_Audiovisual_fMRI_Design.mat');

des = fieldnames(designs_exp);
con = {'A' 'V' 'AV' 'AN' 'AVN'}; % Conditions
sub_code = {'QO' 'QP' 'QQ' 'QR' 'QS' 'QT' 'QU' 'QV' 'QW' 'QX' 'QY' 'QZ' 'RA' 'RB' 'RC' 'RD' 'RE' 'RF' 'RG' 'RH' 'RI' 'RJ'};

% Create design txt files
for s = 1:numel(sub)
    
    data_sub = data_trial(data_trial(:,1)==sub(s),:);
    
    for i = 4:numel(con)
        
        des_c_con_n = cell(numel(des),8);
        des_c_con_s = cell(numel(des),8);
        
        for j = 1:numel(des)
            
            data_run = data_sub(data_sub(:,2)==j,:);
            
            des_c = designs_exp.(des{j}).design_tot;
            
            des_c_nn = des_c(:,des_c(1,:)~=0)'; % Exclude NULL events
            des_c_b = [des_c_nn data_run(:,4)]; % Design, onsets and behavioral response
            
            des_c_n = des_c_b(logical(double(des_c_b(:,1)==i).*double(des_c_b(:,3)==1)),:);
            des_c_s = des_c_b(logical(double(des_c_b(:,1)==i).*double(des_c_b(:,3)~=1)),:);
            
            if isempty(des_c_n)
                des_c_con_n{j,1} = '*';
            else
                des_c_con_n(j,1:numel(des_c_n(:,2))) = num2cell(des_c_n(:,2)');
            end
            
            if isempty(des_c_s)
                des_c_con_s{j,1} = '*';                
            else
                des_c_con_s(j,1:numel(des_c_s(:,2))) = num2cell(des_c_s(:,2)');
            end   
                
        end

        mouth_eye_runs = cell(2,8);
        mouth_eye_runs{1,1} = '*';
        mouth_eye_runs{2,1} = '*';
        
        des_c_con_n = [des_c_con_n;mouth_eye_runs];
        des_c_con_s = [des_c_con_s;mouth_eye_runs];
        
        dlmcell([sub_code{s} '_' con{i} '_NP.txt'],des_c_con_n,' ');
        dlmcell([sub_code{s} '_' con{i} '_SP.txt'],des_c_con_s,' ');

        copyfile([sub_code{s} '*'],['/Volumes/data/BCM/' sub_code{s} '/afni/' sub_code{s} '.results/stimuli']);

    end
    
end
