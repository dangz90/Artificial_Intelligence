function [mae_training, mae_validation] = trainNeuralNet(inputs_training,...
    inputs_validation,targets_training,targets_validation,lambda)
    %% Get Inputs and Outputs
    n_training = size(inputs_training,2);
    n_validation = size(inputs_validation,2);    
    %% Epochs
    %net.trainParam.epochs = 2000;

    %% Fitting Function
    trainFcn = 'trainbr';
%     net.layers.transferFcn = 'radbas';

    % hidden layer(s) transfer function
    net.layers.transferFcn = 'tansig';

    %% Create a Fitting Network
    % Size of the hidden layers. The length of the vector determines the number of hidden layers in the network
    hiddenLayerSize = [15];
%     net = fitnet(hiddenLayerSize,trainFcn);
    net = newrb(inputs_training, targets_training);

    %% Performance Function
    net.performFcn='mae';
    
    %% Regularization Parameter
    net.performParam.regularization = lambda;

    %% Set up Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 100/100;

    %% Train the Network
    [net,tr] = train(net, inputs_training, targets_training);

    %% Test the Network   
    
    % Training
    outputs_training = net(inputs_training);
    errors_training = abs(gsubtract(targets_training, outputs_training));
    mae_training = sum(errors_training(:))/ n_training;
    
    % Validation
    outputs_validation = net(inputs_validation);
    errors_validation = abs(gsubtract(targets_validation, outputs_validation));
    mae_validation = sum(errors_validation(:))/ n_validation;
    
%     jframe = view(net);
% 
% %# create it in a MATLAB figure
% hFig = figure('Menubar','none', 'Position',[100 100 380 120]);
% jpanel = get(jframe,'ContentPane');
% [~,h] = javacomponent(jpanel);
% set(h, 'units','normalized', 'position',[0 0 1 1])
% 
% %# close java window
% jframe.setVisible(false);
% jframe.dispose();
% 
% %# print to file
% set(hFig, 'PaperPositionMode', 'auto')
% saveas(hFig, 'out.eps')
% 
% %# close figure
% close(hFig)

end 


%% Fitting functions
% 'trainlm'     Levenberg-Marquardt
% 'trainbr'     Bayesian Regularization
% 'trainbfg'	BFGS Quasi-Newton
% 'trainrp'     Resilient Backpropagation
% 'trainscg'	Scaled Conjugate Gradient
% 'traincgb'	Conjugate Gradient with Powell/Beale Restarts
% 'traincgf'	Fletcher-Powell Conjugate Gradient
% 'traincgp'	Polak-Ribiére Conjugate Gradient
% 'trainoss'	One Step Secant
% 'traingdx'	Variable Learning Rate Gradient Descent
% 'traingdm'	Gradient Descent with Momentum
% 'traingd'     Gradient Descent