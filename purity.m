function purity = purity(X,y,label,k)
purity=0;
[m]=size(X,1);
 for ii=1:k
            idx=find(label==ii);
            [~,f]=mode(y(idx));
            purity=purity+f;
 end
purity=purity/m;