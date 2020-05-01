function[center,U,obj_fun]=FCMCluster(data,n,m,max_iter,stop_condition)
% input 
% data    matrix
% n       the number of cluster
% output
% center    the center of the cluster
% U         fuzzy matrix
% obj_fun   objective function

if nargin < 5
    error('Not enough input');
end 
if nargin > 5 
    error('Too many input');
end 
data_n=size(data,1);          % the number of data
 obj_fun=zeros(max_iter,1);   % initial objective function
 U=initfcm(n,data_n);     %initialize the fuzzy matrix
 for i=1:max_iter
     [U,center,obj_fun(i)]=updateU(data,U,n,m); % update center
     if i>1
         if abs(obj_fun(i)-obj_fun(i-1))<stop_condition  % Iteration termination condition
             break;
         end 
     end 
 end
   iter_n=i;
   obj_fun(iter_n+1:max_iter)=[];
 end
%% initial fuzzy matrix 
 function U= initfcm(n,data_n)
 U=rand(n,data_n);
 col_sum=sum(U);
 U=U./col_sum(ones(n,1),:);
 end
%% update the center
 function [U_new,center,obj_fun]=updateU(data,U,n,m)
 mf=U.^m;     % m-weighted fuzzy matrix
 center=mf*data./((ones(size(data,2),1)*sum(mf'))');  % update center
 dist=distance(center,data);           %calculate distance
 obj_fun=sum(sum((dist.^2).*mf));     %calculate objective function
 tmp=dist.^(-2/(m-1));
 U_new=tmp./(ones(n,1)*sum(tmp));     % update fuzzy matrix
 end
%% calculate the distance
 function out=distance(center,data)
 out=zeros(size(center,1),size(data,1));
 for k=1:size(center,1)
     out(k,:)=sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
 end 
 end

