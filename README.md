# fMRI_Analysis_AFNI_Unix_Matlab

# AFNI pre-processing, 1st level statistics and ROI analysis:

fMRI_Preprocessing_Statistics_Recon.txt

- Creates afni_proc.py for every subject specified including pre-processing steps (re-alignment, outlier analysis, spatial smoothing, mean scaling, 1st level statistical regression model)
- 


# Automated SUMA controller:

Create_Contrast_ROI_images.txt

- Creates selected fMRI contrasts per subject calls SUMA displays contrast on individual reconstructed brain surface and saves a jpg of left and right hemisphere as lateral and medial view in designated location
- Loads individual ROIs (anatomical and/or functional) per subject calls SUMA displays ROI on individual reconstructed brain surface and saves a jpg of left and right hemisphere as lateral and medial view in designated location


# General regressor files for AFNI

Noisy_Audiovisual_Regressors.m

- Creates regressor files for specified conditions and onsets for two experiments


# Individual regressor files for AFNI

Noisy_Audiovisual_Regressors_Individual_Response.m

- Creates regressor files for specified conditions and onsets for two experiments 
- Takes individual behavior into account and creates regressors for individual subjects
