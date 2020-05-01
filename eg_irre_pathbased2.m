close all
clear all
load pathbased2.mat
% fcm
[center,U,obj_fun] = FCMCluster(d, 6,2,200,1e-5); 
[~,fcm_label] = max(U);
% k-means
[kmeans_label, losses, iterations] = kMeans(d, 6,100); 
% plot
figure
subplot(1, 3, 1),gscatter(d(:,1),d(:,2),d(:,3)),title('original');
subplot(1, 3, 2),gscatter(d(:,1),d(:,2),fcm_label),title('FCM');
subplot(1, 3, 3),gscatter(d(:,1),d(:,2),kmeans_label),title('Kmeans');
% purity
fcm_purity = purity(d,d(:,3),fcm_label,2);
kmeans_purity = purity(d,d(:,3),kmeans_label,2);
fcm_purity
kmeans_purity
