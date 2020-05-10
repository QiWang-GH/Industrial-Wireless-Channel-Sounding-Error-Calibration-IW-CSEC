function [s,e] = mainpeak(h1,window_l,window_r)
%   Select data range
p=find(h1==max(h1(1:30)));
s=p-window_l;
e=p+window_r;
end
