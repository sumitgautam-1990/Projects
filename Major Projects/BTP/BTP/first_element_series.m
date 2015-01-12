% LUMPED with first element in series

clc;
clear all;

R0=input('Enter the characteristic impedance of the line,RO:');
RL=input('\nEnter the real part of output load , RL:');
XL=input('\nEnter the imaginary part of output load , XL:');
if ((RL*RL + XL*XL) > (R0*RL))
a= RL*RL + XL*XL;
D= sqrt((a-R0*RL)*(RL/R0));
B1=(XL+D)/(a);
B2=(XL-D)/(a);
X1=(1/B1) + (XL*R0)/RL -R0/(B1*RL);
X2=(1/B2) + (XL*R0)/RL -R0/(B2*RL);
fprintf('B1=%d , ',B1);
fprintf('X1=%d \n',X1);
fprintf('B2=%d, ',B2);
fprintf('X2=%d \n',X2);
end