% %%
% %plot the results
% figure(1);
% plot(lambda,Mean_motor_model,'-or','MarkerFaceColor','r')
% hold on
% plot(lambda,Mean_motor_test,'-db','MarkerFaceColor','b')
% hold off
% title('Motor UPDSR')
% xlabel('\lambda (amount of regularization)')
% ylabel('MAE')
% legend('model error','test error')
% 
% figure(2);
% plot(lambda,Mean_total_model,'-or','MarkerFaceColor','r')
% hold on
% plot(lambda,Mean_total_test,'-db','MarkerFaceColor','b')
% hold off
% title('Total UPDSR')
% xlabel('\lambda (amount of regularization)')
% ylabel('MAE')
% legend('model error','test error')