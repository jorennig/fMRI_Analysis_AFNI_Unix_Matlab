clear all
close all
clc

dir_c = pwd;
load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Design/Noisy_Audiovisual_fMRI_Design.mat');

des = fieldnames(designs_exp);
con = {'A' 'V' 'AV' 'AN' 'AVN'}; % Conditions

% Create design txt files    
for i = 1:numel(con)
    
    des_c_con = [];
    for j = 1:numel(des)
        
        des_c = designs_exp.(des{j}).design_tot;
        des_c_con(j,:) = des_c(2,des_c(1,:)==i);
        
    end
    
    des_c_con = num2cell(des_c_con);
    mouth_eye_runs = cell(2,size(des_c_con,2));
    mouth_eye_runs{1,1} = '*';
    mouth_eye_runs{2,1} = '*';
    
    des_c_con = [des_c_con;mouth_eye_runs];
    
    dlmcell([con{i} '.txt'],des_c_con,' ');

end
