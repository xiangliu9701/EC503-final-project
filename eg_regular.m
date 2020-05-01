close all
clear all
load regular_data.mat
% fcm
[center,U,obj_fun] = FCMCluster(generatedata, 9,2,200,1e-5); 
[~,fcm_label] = max(U);
% k-means
[kmeans_label, losses, iterations] = kMeans(generatedata, 9,100); 
% plot
figure
subplot(1, 3, 1),gscatter(generatedata(:,1),generatedata(:,2),label),title('original');
subplot(1, 3, 2),gscatter(generatedata(:,1),generatedata(:,2),fcm_label),title('FCM');
subplot(1, 3, 3),gscatter(generatedata(:,1),generatedata(:,2),kmeans_label),title('Kmeans');
% purity
fcm_purity = purity(generatedata,label,fcm_label,2);
kmeans_purity = purity(generatedata,label,kmeans_label,2);
fcm_purity
kmeans_purity
