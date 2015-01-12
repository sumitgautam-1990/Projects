% For a WR90 WG ( a=22.86 mm and b=10.16 mm), calculate the following
% operating parameters at a given input frequency: Guided Wavelength,
% Intrinsic Impedance(Zw),Phase Velocity(Vp) and Group Velocity(Vg)
% Also calculate the Power Flow for TE(1,0) mode

clear all;
clc;
a=2.286; b=1.016;
c=3*power(10,10);
fc=(c/2)*sqrt(1/(a*a));
q='y';
while(q=='y')
clc;
f=input('Enter the desired frequency (in GHz):');
f=f*power(10,9);
w=2*pi*f;
ko=w/c;
kz=sqrt((ko*ko)-((pi*pi)/(a*a)));

lambda_g=2*pi/kz;
Zw=120*pi/sqrt(1-((fc*fc)/(f*f)));
Vp=c/sqrt(1-((fc*fc)/(f*f)));
Vg=c*c/Vp;
P10=((a*b)/4)*power(3*power(10,4),2)/Zw;

display('Guided Wavelength (in cms):');
disp(lambda_g);
display('Intrinsic Impedance(Zw) (in ohms):');
disp(Zw);
display('Phase Velocity(Vp) (in cm/sec):');
disp(Vp);
display('Group Velocity(Vg) (in cm/sec):');
disp(Vg);
display('Power in TE(1,0) mode (in Watts):');
disp(P10);

q=input('Do you want to continue <y/n>:','s');
end
