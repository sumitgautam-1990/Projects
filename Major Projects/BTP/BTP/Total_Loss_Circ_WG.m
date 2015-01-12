% Overall Loss in a Circular Waveguide

clear all;
clc;

Er=input('Enter the value of dielectric constant:');
a=input('Enter the value of radius <a> (in cms):');
f=input('Enter the value of operating frequency (in GHz):');
L=input('Enter the value of the length of the waveguide (in cms):');
tandel=input('Enter the value of loss tangent <tan (delta)> :');
sigma=input('Enter the value of conductivity of the material (X10^7 S/m):');
sigma=sigma*power(10,7);

%Definitions
f=f*power(10,9); 
c=3*power(10,10);
w=2*pi*f;
uo=4*pi*power(10,-7);

%Calculations
Rs=sqrt((w*uo)/(2*sigma));
k=w*sqrt(Er)/c;
kc=1.8412/a;
kz=sqrt(power(k,2)-power(kc,2));
n=120*pi/sqrt(Er);

ac=(Rs/(a*k*n*kz))*(power(kc,2)+(power(k,2)/(power(1.8412,2)-1)));

ad=(power(k,2)*tandel)/(2*kz);

alpha=(ac+ad)*L;

display('Total loss in Nepers:');disp(alpha);
alpha_dB=alpha*8.686;
display('Total loss in dB:');disp(alpha_dB);