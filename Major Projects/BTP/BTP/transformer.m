% Transformer

clc;
clear all;

R0=input('Enter the characteristic impedance of the line:');
RL=input('\nEnter the load impedance , RL:');
F=input('\nEnter the Frequency:');
V=input('\nEnter the VSWR of the line:');
Z1=sqrt(RL*R0);
Pm = (V-1)/(V+1);
Q = acos((Pm/sqrt(1-Pm*Pm))*(2*sqrt(R0*RL)/abs(RL-R0)));
FB= (2-4*Q/pi)*100;
fprintf('Characteristic impedance of the matching section=%d \n',Z1);
fprintf('Q=%d \n',Q);
fprintf('Fractional Bandwidth=%d\n',FB);