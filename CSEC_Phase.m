clear
clc
load('Tx2_2G_Boiler_3115Vpol_Cloudat13_run1_pp.mat', 'IQdata');
%% initialization
DATA=IQdata(1:64,:);  % the CIR data
% DATA=IQdata;       
record=40;         % number of per acquisition
acquisition=48;         % acquisition-1
p=1;    % p-norm
T=zeros(1,1);              % the sampling time deviation matrix
data_t(:,1)=DATA(:,1);     % the CIR after compensating for sampling time deviation 
phasediffer_rad=zeros(1,1);   % the phase shifting matrix
data_t_r(:,1)=DATA(:,1);   % the CIR calibrated 
D0=zeros(1,1);          % the distance of uncalibrated CIRs and the referance CIR
D1=zeros(1,1);          % the distance of the CIR after compensating for sampling time deviation and the referance CIR
D2=zeros(1,1);          % the distance of calibrated CIRs and the referance CIR
%% calibration
for j=0:acquisition
h1=DATA(:,j*record+1);     % the referance CIR
data_t(:,j*record+1)=DATA(:,j*record+1);
%main peak of the CIR
window_l=8;   %  Window width to the left of the main peak     Choose according to CIR characteristics, 8 is the best value for Tx2_2G_Boiler dataset.
window_r=8;   %  Window width to the right of the main peak
[s,e]=mainpeak(h1,window_l,window_r);

for i=2:record
h2=DATA(:,i+j*record);     % the CIR to be calibrated
D0(i+j*record,1)=norm((h1-h2),1);
%sampling time deviation estimation and compensation
[td,g1] = calculateT(h1,h2,s,e,p,64);  
T(i+j*record,1)=td;
data_t(:,j*record+i)=g1;
D1(i+j*record,1)=norm((h1-g1),1);
%Phase shifting estimation and compensation
step=-pi/9000;
phasedifferrad = calculateP(h1,g1,step,s,e,p);
phasediffer_rad(i,1+j)=phasedifferrad;
g2=g1.*exp(phasedifferrad*1i);
data_t_r(:,j*record+i)=g2;
D2(i+j*record,1)=norm((h1-g2),p);
end
disp(j);
end

%% Results display
figure
plot(D0);
hold on
plot(D1);
hold on
plot(D2);
figure
plot(T);
figure
plot(rad2deg(phasediffer_rad));

s1=41;
e1=80;
figure
subplot(2,2,1)
plot(data_t_r(1:64,s1:e1));
subplot(2,2,2)
plot(abs(data_t_r(1:64,s1:e1)));
subplot(2,2,3)
plot(DATA(1:64,s1:e1));
subplot(2,2,4)
plot(abs(DATA(1:64,s1:e1)));

