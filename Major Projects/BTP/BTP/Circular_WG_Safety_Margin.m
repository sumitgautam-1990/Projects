% For Circular Waveguide (input a): Calculate the bandwidth of the waveguide,
% assuming : (i) no safety margin and (ii) 20% safety margin. (Air Media)

clear all;
clc;
q='y'
while(q=='y')
clc;
c=3*power(10,10);
a=input('Enter value of a <radius> (in cms):');

% TE(1,1) Mode in air medium.
fc_te_n=(1.841*c)/(2*pi*a);

% TM(0,1) Mode in air medium.
fc_tm_n=(2.405*c)/(2*pi*a);

BW_n=fc_tm_n-fc_te_n;
display('(i) Bandwidth with no safety margin (in Hz):');
disp(BW_n);

fc_te_2=fc_te_n+0.1*fc_te_n;
fc_tm_2=fc_tm_n-0.1*fc_tm_n;
BW_2=fc_tm_2-fc_te_2;
display('(ii) Bandwidth with 20% safety margin (in Hz):');
disp(BW_2);
q=input('Do you want to continue <y/n>:','s');
end