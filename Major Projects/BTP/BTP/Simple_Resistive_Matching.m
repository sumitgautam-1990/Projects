clc;
clear all;

R0=input('Enter the characteristic impedance of the line\n');
RL=input('Enter the load impedance , RL\n');
if R0>RL
RM=R0-RL;
Effic=RL/R0;
fprintf('RM=%d ',RM);
fprintf('Efficiency=%d\n',Effic);
fprintf('Reflection coefficient =0 , this was our aim..!!!!\n\n\n');
else
fprintf('R0 should be greater than RL');
end