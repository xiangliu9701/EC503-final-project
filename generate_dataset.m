x1 = rand(1,1000);  
y1 =  rand(1,1000);
x2 = 1.5+rand(1,1000);   
y2 = rand(1,1000);
x3 = 3+rand(1,1000);
y3 = rand(1,1000);

x4 = rand(1,1000);  
y4 = 1.5+rand(1,1000);
x5 = 1.5+rand(1,1000);    
y5 = 1.5+rand(1,1000);
x6 = 3+rand(1,1000);
y6 = 1.5+rand(1,1000);

x7 = rand(1,1000);  
y7 = 3+rand(1,1000);
x8 = 1.5+rand(1,1000);  
y8 = 3+rand(1,1000);
x9 = 3+rand(1,1000);
y9 = 3+rand(1,1000);
x = [x1 x2 x3 x4 x5 x6 x7 x8 x9];
y = [y1 y2 y3 y4 y5 y6 y7 y8 y9];
generatedata = [x;y]'
label=[ones(1,1000) 2*ones(1,1000) 3*ones(1,1000) 4*ones(1,1000) 5*ones(1,1000) 6*ones(1,1000) 7*ones(1,1000) 8*ones(1,1000) 9*ones(1,1000)]
regular_data = [x;y;label]';
save regular_data.mat
gscatter(x,y,label)