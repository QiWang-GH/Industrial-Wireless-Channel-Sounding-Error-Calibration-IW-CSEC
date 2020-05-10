function [td,g1] = calculateT(h1,h2,s,e,p,n)
%  sampling time deviation estimation and compensation
diff=zeros(1,1);
for j=1:3
diff(j,1)=norm((h1(s:e)-h2(s+j:e+j)),p);
end
for j=-3:-1
diff(j+7,1)=norm((h1(s:e)-h2(s+j:e+j)),p);
end
diff(7,1)=norm((abs(h1(s:e))-abs(h2(s:e))),p);
[r]=find(diff==min(diff));
if r<=3
td=r;
else
td=r-7;
end
if td==0
    g1(:,1)=h2(1:n);
elseif td<0
    g1(1-td:n,1)=h2(1:n+td);
    g1(1:-td,1)=h2(1:-td);
elseif td>0
    g1(1:n-td,1)=h2(td+1:n);
    g1(n-td+1:n,1)=h2(n-td+1:n);
end
end
% figure
% subplot(1,2,1)
% plot(abs(h1));
% hold on
% plot(abs(h2));
% subplot(1,2,2)
% plot(abs(h1));
% hold on
% plot(abs(g1));

