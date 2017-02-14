%% read the dataset as a table
data=readtable('parkinson.csv');

%% standardize by individuals (all features except sex and age)
standardized_data = StandardizeDataByIndividual(data);

%% randomly split the data into 12 individuals for testing and 30 for model selection:
[model_data,test_data] = GetTrainingTestData(12, standardized_data);

%% Next we generate the 10-fold cross validation sets:
[training_data, validation_data]=GetCrossValidationSets( model_data );

%% Next we loop through the 10 folds
MAE_motor_training =[];
MAE_motor_validation =[];
MAE_total_training =[];
MAE_total_validation =[];

lambda = 0.01;

for i=1:10
    % compute mean and std for age from training set
    mu_age=mean(training_data{i}.age);
    sigma_age=std(training_data{i}.age);
    training_data{i}.age=(training_data{i}.age-mu_age)/sigma_age;
    validation_data{i}.age=(validation_data{i}.age-mu_age)/sigma_age;
    % ... and apply PCA: 
    
    
    % and record the MAE and std. for each:
    % MOTOR UPDRS
    [mae_training, mae_validation] = trainNeuralNet(training_data{i}, validation_data{i}, lambda, 5);
    MAE_motor_training =[MAE_motor_training; mae_training];
    MAE_motor_validation =[MAE_motor_validation; mae_validation];
    % TOTAL UPDRS
    [mae_training, mae_validation] = trainNeuralNet(training_data{i}, validation_data{i}, lambda, 6);
    MAE_total_training =[MAE_total_training; mae_training];
    MAE_total_validation =[MAE_total_validation; mae_validation];
end
    Mean_motor_training = mean(MAE_motor_training);
    Mean_motor_validation = mean(MAE_motor_validation);

    Mean_total_training = mean(MAE_total_training);
    Mean_total_validation = mean(MAE_total_validation);

    Std_motor_training = std(MAE_motor_training);
    Std_motor_validation = std(MAE_motor_validation);
    
    Std_total_training = std(MAE_total_training);
    Std_total_validation = std(MAE_total_validation);