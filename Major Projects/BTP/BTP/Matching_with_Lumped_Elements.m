% Design an L-section matching network to match a series RC load with an
% impedance Zl=Rl-jXl ohms, to a Zo ohms line, at frequency of 500 MHz.

clc;
clear all;

j=sqrt(-1);

Rl=input('Enter the real value of load impedance(in ohms):');
Xl=input('Enter the imaginary value of load impedance(in ohms):');

Zl=Rl+j*Xl;

Zo=input('Enter the value of input impedance(in ohms):');

f=input('Enter the frequency (in MHz):');

if(Rl>Zo)
    B1=(Xl+sqrt((Rl/Zo))*sqrt(Rl*Rl+Xl*Xl-Zo*Rl))/(Rl*Rl+Xl*Xl);b1=B1*Zo;
    B2=(Xl-sqrt((Rl/Zo))*sqrt(Rl*Rl+Xl*Xl-Zo*Rl))/(Rl*Rl+Xl*Xl);b2=B2*Zo;
    X1=(1/B1)+((Xl*Zo)/Rl)-(Zo/(B1*Rl));x1=X1/Zo;
    X2=(1/B2)+((Xl*Zo)/Rl)-(Zo/(B2*Rl));x2=X2/Zo;
end

if(Rl<Zo)
    X1=sqrt(Rl*(Zo-Rl))-Xl;x1=X1/Zo;
    X2=-sqrt(Rl*(Zo-Rl))-Xl;x2=X2/Zo;
    B1=sqrt((Zo-Rl)/Rl)/Zo;b1=B1*Zo;
    B2=-sqrt((Zo-Rl)/Rl)/Zo;b2=B2*Zo;
end

display('The values of first possible network:');
disp('The value of Capacitance(in pF)=')
C1=b1/(2*pi*f*Zo)*power(10,6);
disp(C1);
disp('The value of Inductance(in nH)=')
L1=(x1*Zo)/(2*pi*f)*power(10,3);
disp(L1);
display('The values of second possible network:');
disp('The value of Capacitance(in pF)=')
C2=-1/(2*pi*f*x2*Zo)*power(10,6);
disp(C2);
disp('The value of Inductance(in nH)=')
L2=-Zo/(2*pi*f*b2)*power(10,3);
disp(L2);