function [transformed_training_features,transformed_validation_features,...
           eigenvectors,eigenvalues] = pcaCI(training, validation)

%This function performs PCA on the features used for training and then
%applies the same transformation for the corresponding validation set

training_features = table2array(training);
training_features = training_features(:,[2,3,7:22]);

validation_features = table2array(validation);
validation_features = validation_features(:,[2,3,7:22]);

[eigenvectors, transformed_training_features, eigenvalues] = pca(training_features,'Centered',false);

% apply the transformation from the training set to the validation and test set
transformed_validation_features = validation_features*eigenvectors;

end