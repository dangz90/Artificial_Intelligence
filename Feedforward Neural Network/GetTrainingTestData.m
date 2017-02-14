function [model_data, test_data] = GetTrainingTestData( k, data )

%This function randomly splits the data into training and testing sets
%k is the number of subjects out of 42 reserved for testing

%list all subjects
subjects=1:42;

%draw k subjects for testing and take the remaining for training
test_subjects=sort(datasample(subjects, k, 'Replace', false));
model_subjects=setdiff(subjects,test_subjects);

%split the data into training and testing
test_data=[];
for i=1:size(test_subjects,2)
    test_data=[test_data; data(data.subject_==test_subjects(i),:)];
end

model_data=[];
for i=1:size(model_subjects,2)
    model_data=[model_data; data(data.subject_==model_subjects(i),:)];
end


end

