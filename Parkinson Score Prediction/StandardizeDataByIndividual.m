function [standardized_data] = StandardizeDataByIndividual(data)
%This function standardizes the data by individuals, except for gender
%which is not standardized and age is standardized globally from the
%training set later

n_subjects = max(unique(data.subject_));
max_index = 0;
    
for i=1:n_subjects 
    min_index = max_index + 1;
    max_index = max_index + sum(data.subject_ == i);

    data.PPE(min_index:max_index) = (data.PPE(min_index:max_index) - mean(data.PPE(min_index:max_index))) / std(data.PPE(min_index:max_index));
    data.DFA(min_index:max_index) = (data.DFA(min_index:max_index) - mean(data.DFA(min_index:max_index))) / std(data.DFA(min_index:max_index));
    data.HNR(min_index:max_index) = (data.HNR(min_index:max_index) - mean(data.HNR(min_index:max_index))) / std(data.HNR(min_index:max_index));
    data.RPDE(min_index:max_index) = (data.RPDE(min_index:max_index) - mean(data.RPDE(min_index:max_index))) / std(data.RPDE(min_index:max_index));
    data.NHR(min_index:max_index) = (data.NHR(min_index:max_index) - mean(data.NHR(min_index:max_index))) / std(data.NHR(min_index:max_index));
    data.Shimmer_DDA(min_index:max_index) = (data.Shimmer_DDA(min_index:max_index) - mean(data.Shimmer_DDA(min_index:max_index))) / std(data.Shimmer_DDA(min_index:max_index));
    data.Shimmer_APQ11(min_index:max_index) = (data.Shimmer_APQ11(min_index:max_index) - mean(data.Shimmer_APQ11(min_index:max_index))) / std(data.Shimmer_APQ11(min_index:max_index));
    data.Shimmer_APQ5(min_index:max_index) = (data.Shimmer_APQ5(min_index:max_index) - mean(data.Shimmer_APQ5(min_index:max_index))) / std(data.Shimmer_APQ5(min_index:max_index));
    data.Shimmer_APQ3(min_index:max_index) = (data.Shimmer_APQ3(min_index:max_index) - mean(data.Shimmer_APQ3(min_index:max_index))) / std(data.Shimmer_APQ3(min_index:max_index));
    data.Shimmer_dB_(min_index:max_index) = (data.Shimmer_dB_(min_index:max_index) - mean(data.Shimmer_dB_(min_index:max_index))) / std(data.Shimmer_dB_(min_index:max_index));
    data.Shimmer(min_index:max_index) = (data.Shimmer(min_index:max_index) - mean(data.Shimmer(min_index:max_index))) / std(data.Shimmer(min_index:max_index));
    data.Jitter_DDP(min_index:max_index) = (data.Jitter_DDP(min_index:max_index) - mean(data.Jitter_DDP(min_index:max_index))) / std(data.Jitter_DDP(min_index:max_index));
    data.Jitter_PPQ5(min_index:max_index) = (data.Jitter_PPQ5(min_index:max_index) - mean(data.Jitter_PPQ5(min_index:max_index))) / std(data.Jitter_PPQ5(min_index:max_index));
    data.Jitter_RAP(min_index:max_index) = (data.Jitter_RAP(min_index:max_index) - mean(data.Jitter_RAP(min_index:max_index))) / std(data.Jitter_RAP(min_index:max_index));
    data.Jitter_Abs_(min_index:max_index) = (data.Jitter_Abs_(min_index:max_index) - mean(data.Jitter_Abs_(min_index:max_index))) / std(data.Jitter_Abs_(min_index:max_index));
    data.Jitter___(min_index:max_index) = (data.Jitter___(min_index:max_index) - mean(data.Jitter___(min_index:max_index))) / std(data.Jitter___(min_index:max_index)); 
end    
standardized_data=data;

end

