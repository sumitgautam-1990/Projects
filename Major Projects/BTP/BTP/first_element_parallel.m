% LUMPED with first element in PARALLEL

clc;
clear all;

R0=input('Enter the characteristic impedance of the line,RO:');
RL=input('\nEnter the real part of output load , RL:');
XL=input('\nEnter the imaginary part of output load , XL:');
if (R0 > RL)
    X1=sqrt(RL*(R0-RL))-XL;
    X2=-sqrt(RL*(R0-RL))-XL;
    B1=sqrt(R0/RL-1)/(R0);
    B2=-sqrt(R0/RL-1)/(R0);
    fprintf('B1=%d , ',B1);
    fprintf('X1=%d \n',X1);
    fprintf('B2=%d ',B2);
    fprintf('X2=%d \n',X2);
end
if (R0<RL)
    fprintf('Characteristic Impedance should be greater than Load Impedance\n');
end