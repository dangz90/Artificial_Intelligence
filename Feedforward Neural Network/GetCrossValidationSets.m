function [training_data, validation_data]=GetCrossValidationSets( model_data )
%This function computes the 10-fold cross validation sets from the data
%used for model comparison
model_subjects=unique(model_data.subject_);

for i=1:10
   %choose subjects for ith validation set, use remaining for training
   validation_subjects{i}=model_subjects((i-1)*3+1:i*3);
   training_subjects{i}=setdiff(model_subjects,validation_subjects{i});
   
   %construct ith validation set
   validation_data{i}=[];
   for j=1:size(validation_subjects{i},1)
        validation_data{i}=[validation_data{i};...
        model_data( model_data.subject_==validation_subjects{i}(j) , : )];
   end
   
   %construct the ith training set
   training_data{i}=[];
   for j=1:size(training_subjects{i},1)
        training_data{i}=[training_data{i};...
        model_data( model_data.subject_==training_subjects{i}(j) , : )];
   end

end




end

