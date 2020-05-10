function [minphasediffer] = calculateP(h1,h2,step,s,e,p)
%   Phase shifting estimation
diff=zeros(1,1);
x=0;
for j=1:1800
a=exp(x*1i);
g=h2.*a;
diff(j,1)=norm((h1(s:e)-g(s:e)),p);
x=0+step*j;
end
for j=1801:3600
a=exp(x*1i);
g=h2.*a;
diff(j,1)=norm((h1(s:e)-g(s:e)),p);
x=0-step*(j-1800);
end
[R]=find(diff==min(diff));
if length(R)>1
    r=R(1);
    disp('minphase is not unique');
else
    r=R;
end

if r<=1800
x1=0+step*r;
else
x1=0-step*(r-1800);
end
% a1=exp(x1*1i);
% g1=h2*a1;
% differ2=norm((h1-g1),p);
minphasediffer=x1;
end

% figure
% subplot(1,2,1)
% plot(h1);
% hold on
% plot(h2);
% subplot(1,2,2)
% plot(h1);
% hold on
% plot(g1);
% 
% disp(rad2deg(minphasediffer))


