% pie matching

clc;
clear all;

R0=input('Enter the characteristic impedance of the line:');
K=input('\nEnter the impedance ratio , K :');
RL=input('\nEnter the output load (output char. imped.) , RL:');
a=K*K;
b=K*RL+K*K*RL-R0*K*K-R0*K;
c= -2*RL*R0*K - RL*R0;
D= sqrt(b*b-4*a*c);
R1=(-b+D)/(2*a);
fprintf('\nR1=%d ',R1);
fprintf('\nR2 = %d', (K*R1));