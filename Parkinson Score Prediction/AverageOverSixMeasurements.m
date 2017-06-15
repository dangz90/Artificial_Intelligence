function [averaged_data] = AverageOverSixMeasurements( data )
%This function takes the data as input and averages for every individual
%the six measurements from the same timepoint to increase consistency in
%the data set
features_classes = {'subject_';'age';'sex';'test_time';'motor_UPDRS';...
    'total_UPDRS';'Jitter___';'Jitter_Abs_';'Jitter_RAP';'Jitter_PPQ5';...
    'Jitter_DDP';'Shimmer';'Shimmer_dB_';'Shimmer_APQ3';'Shimmer_APQ5';...
    'Shimmer_APQ11';'Shimmer_DDA';'NHR';'HNR';'RPDE';'DFA';'PPE'};    

n_subjects = size(unique(data.subject_),1);

raw_data_avg = struct();
for i=1:size(data,2)
    raw_data_avg = setfield(raw_data_avg,features_classes{i},[]);
end

for i=1:n_subjects 
    %Get the different time measures for subject i
    pmeasures_test_time = unique(int32(data.test_time(data.subject_ == i)));
    
    for j=1:size(pmeasures_test_time,1)        
        %Get the indices for test time j for subject i   
        matched_pmeasures_test_time_indexes = int32(data.test_time(data.subject_ == i)) == pmeasures_test_time(j);
        
        for k=1:size(features_classes,1) 
            %extract the kth feature column for subject i
            subject_feature = data.(features_classes{k})(data.subject_ == i);
            
            %consider only values from measurement j
            subject_feat_match_values = subject_feature(matched_pmeasures_test_time_indexes);
            
            %average over them
            raw_data_avg.(features_classes{k})(end+1) = mean(subject_feat_match_values);
         end
     end
end

%Transposing raw_data_avg features 
for k=1:size(features_classes,1) %features and classes
    raw_data_avg.(features_classes{k}) = raw_data_avg.(features_classes{k})';   
end 


averaged_data=table(raw_data_avg.subject_,raw_data_avg.age,raw_data_avg.sex,...
    raw_data_avg.test_time,raw_data_avg.motor_UPDRS, raw_data_avg.total_UPDRS,...
    raw_data_avg.Jitter___,raw_data_avg.Jitter_Abs_,raw_data_avg.Jitter_RAP,...
    raw_data_avg.Jitter_PPQ5,raw_data_avg.Jitter_DDP,raw_data_avg.Shimmer,...
    raw_data_avg.Shimmer_dB_,raw_data_avg.Shimmer_APQ3,raw_data_avg.Shimmer_APQ5,...
    raw_data_avg.Shimmer_APQ11,raw_data_avg.Shimmer_DDA,raw_data_avg.NHR,...
    raw_data_avg.HNR,raw_data_avg.RPDE,raw_data_avg.DFA,raw_data_avg.PPE,...
    'VariableNames',{'subject_';'age';'sex';'test_time';'motor_UPDRS';...
    'total_UPDRS';'Jitter___';'Jitter_Abs_';'Jitter_RAP';'Jitter_PPQ5';...
    'Jitter_DDP';'Shimmer';'Shimmer_dB_';'Shimmer_APQ3';'Shimmer_APQ5';...
    'Shimmer_APQ11';'Shimmer_DDA';'NHR';'HNR';'RPDE';'DFA';'PPE'});
end

