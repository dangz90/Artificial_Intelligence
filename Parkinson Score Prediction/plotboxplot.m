CGD_SL_TOTAL_IND_NON = [8.3	9.3	8.8	8.9	9	9.1	9.2	9.3	9.4	9.5;];
GDM_SL_TOTAL_IND_NON = [13.5	21	17.25	17	14	17.2	17.3	17.4	17.5	17.6	11.2];

%%
boxplot([MAE_motor_training, MAE_motor_validation], ...
    'Labels',{'CGD [20]', 'GDM [20]'});

title('Total UPDRS');
ylabel('MAE');
xlabel('Neural Network Architecture');