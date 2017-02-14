%Boxploting CI - Parkinson's datasets
%Pablo Eliseo Reynoso Aguirre


opt_algorithms = {'CGD','GDM','BR','LM','BFGS'};
DeviceColors = {[1 0.5 0] 'g' 'c' [0.5 0 0.5]};

% 1layer - total
% variable = 'total UPDSR';
%  
% sub_non_avg = [8.3 13.5 8.3 8 9.761028912;9.3 21 10 10.8 8.667979178;8.8 17.25 9.15 9.4 9.356609814;8.9 17 9.15 9.4 12.30983403;9 14 9.15 9.4 8.171954482;9.1 17.2 9.15 9.4 9.653481283;9.2 17.3 9.15 9.4 9.653481283;9.3 17.4 9.15 9.4 9.653481283;9.4 17.5 9.15 9.4 9.653481283;9.5 17.6 9.15 9.4 9.653481283];
% sub_avg = [10.5 19.8 10.6 10.8 10.3144;10.1 13 9.5 9.5 9.6944;10.30 15.70 10.05 10.15 10.0703;10.40 15.80 10.05 10.25 9.9963;10.50 15.90 10.60 10.35 10.0474;10.10 15.70 10.00 9.50 10.0474;10.20 15.80 10.20 9.60 10.0474;10.10 15.90 9.50 9.70 10.0474;10.30 14.00 9.60 10.10 10.0474;10.40 14.10 9.70 10.20 10.0474];
% glo_non_avg = [9.8 15.7 11.4 11.9 13.9827;11 23.2 15.4 15.9 13.6888;10.4 19.45 13.4 13.9 15.5763;10.4 19.45 13.4 13.9 14.9107;10.4 19.45 13.4 13.9 11.6352;10.4 19.45 13.4 13.9 11.6352;10.4 19.45 13.4 13.9 11.6352;10.4 19.45 13.4 13.9 11.6352;10.4 19.45 13.4 13.9 11.6352;10.4 19.45 13.4 13.9 11.6352];
% glo_avg = [13.2 36 27 18 13.9368;12 16 14 14 12.9228;12.6 16 20.5 16 13.8921;12.7 16.1 18.1 16.1 15.0628;12.8 16.2 18.2 16.2 14.6216;12.9 23 18.3 16.3 14.6216;13 23.1 18.4 16.4 14.6216;12.2 23.2 14.5 16.5 14.6216;12.3 20 16 16.6 14.6216;12.4 20.1 17 16.7 14.6216];        

% 1layer - motor
% variable = 'motor UPDSR';
%  
% sub_non_avg = [5.8 6.9 5.8 8 6.5062;6.2 12 9.5 10.8 6.7401;6 9.45 7.65 9.4 7.3291;6 9.45 7.65 9.4 6.4734;6 9.45 7.65 9.4 5.4171;6 9.45 7.65 9.4 6.4734;6 9.45 7.65 9.4 6.4734;6 9.45 7.65 9.4 6.4734;6 9.45 7.65 9.4 6.4734;6 9.45 7.65 9.4 6.4734];
% sub_avg = [8 13.3 7.7 7.5 7.3861; 7.7 10.5 8 6.8 8.0233; 7.85 11.90 7.85 7.15 7.4643; 7.95 12.20 7.95 7.25 7.5655; 7.70 12.30 7.70 7.00 7.5166; 7.80 12.00 7.80 7.10 7.5166; 7.60 11.70 7.90 7.20 7.5166; 7.70 10.50 7.70 6.80 7.5166; 7.80 10.50 7.80 6.90 7.5166; 7.90 10.60 7.90 7.00 7.5166];
% glo_non_avg = [7.2 8.9 7.8 7.8 8.6651;7.8 14 10.8 10.8 9.5364;7.5 11.45 9.3 9.3 9.2627;7.5 11.45 9.3 9.3 9.3748;7.5 11.45 9.3 9.3 8.4016;7.5 11.45 9.3 9.3 8.4016;7.5 11.45 9.3 9.3 8.4016;7.5 11.45 9.3 9.3 8.4016;7.5 11.45 9.3 9.3 8.4016;7.5 11.45 9.3 9.3 8.4016];
% glo_avg = [10 11.2 12 14 8.9473;8.4 13.5 10.8 9.8 9.2696;9.2 12.35 11.4 11.9 9.1261;9.3 12.45 11.5 12 9.5292;9.4 12.55 11.6 12.1 9.1266;9.5 12.65 11.7 12.2 9.1266;9.6 11.7 11.8 12.3 9.1266;9.7 11.9 9.8 12.4 9.1266;9.8 11 9.9 12.5 9.1266;9.9 11.9 10 12.6 9.1266];

% 2layer - total
% variable = 'total UPDSR';

%datasets here!

% 2layer - motor
% variable = 'motor UPDSR';

%datasets here!

GroupedData = {sub_non_avg sub_avg glo_non_avg glo_avg}; 

legendEntries = {'std subject non-avg','std subject avg','std global non-avg','std global avg'};

N = numel(GroupedData);
M = size(opt_algorithms,2);
delta = linspace(-.3,.3,N); %// define offsets to distinguish plots
width = .2; %// small width to avoid overlap
cmap = hsv(N); %// colormap
legWidth = 1.8; %// make room for legend

figure;
hold on;

for ii=1:N
    
    %Center plot: use real labels
    labels = opt_algorithms; 
    %Plotting filled boxes with specified positions, widths, labels
    boxplot(GroupedData{ii},'Color',DeviceColors{ii},'boxstyle','filled','position',(1:M)+delta(ii),'widths',width,'labels',labels);
    %Dummy plot for legend    
    plot(NaN,1,'color',DeviceColors{ii});
    
end

title(variable);
xlabel('Optimization Techniques'); ylabel('MAE'); grid on;

%Adjusting x limits, with room for legend
ylim([8 25]); 
xlim([1+2*delta(1) M+legWidth+2*delta(N)]); 
legend(legendEntries);