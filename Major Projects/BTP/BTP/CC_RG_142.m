% Consider a piece of RG-142 Coaxial cable.Calculate 1>Zo 2>Y=a+jB 3>Vp and
% Vg of the cable in its dominant mode ; with all possible inputs

clear all;
clc;

a=input('Enter the value of inner radius (in mil):');
b=input('Enter the value of outer radius (in mil):');
Er=input('Enter the value of Dielectric Constant:');
f=input('Enter the value of frequency (in GHz):');
f=f*power(10,9);
c=3*power(10,8);

Zo=(60/sqrt(Er))*log(b/a);

Y=(2*pi*f*sqrt(Er))/c;

Vp=c/sqrt(Er);
Vg=Vp;

display('The value of Characteristic Impedance Zo (in ohms):')
disp(Zo);

display('Propagation Constant (in rad/m):')
disp(Y);

display('Phase Velocity (in m/sec):')
disp(Vp);

display('Group Velocity (in m/sec):')
disp(Vg);