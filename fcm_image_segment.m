close all
clear all
load testfcm.jpg
I = imread('testfcm.jpg');
rng('default');
[m, n, p] = size(I);
X = reshape(double(I), m*n, p);
[center,U,obj_fcn] = FCMCluster(X,2,2,200,1e-5); 
[~,label] = max(U);
figure
subplot(1, 2, 1),imshow(I, []),title('original')
subplot(1, 2, 2),imshow(uint8(reshape(center(label, :), m, n, p))),title('fcm')


