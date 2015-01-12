% Circular Waveguide : For TE(1,1) mode; Determine: 1>Cut-off frequency
% 2>Guided Wavelength for an operating frequency 3>Wave Impedance 4>Phase
% Velocity (Vp) 5>Group Velocity (Vg)

clear all;
clc;

c=3*power(10,10);
q='y';
while(q=='y');
display('            Main-Menu');
s=input('Determine: Cut-off frequency,Guided Wavelength for an operating frequency,Wave Impedance,Phase Velocity (Vp) and Group Velocity (Vg) for:\n1. TE(1,1) Mode in air medium.\n2. TE(1,1) Mode in dielectric medium.\n3. TM(0,1) Mode in air medium.\n4. TM(0,1) Mode in dielectric medium.\nYour Choice Please:');
if(s==1)
% TE(1,1) Mode in air medium.

a=input('Enter value of a <radius> (in cms):');
f=input('Enter the value of operating frequency(in GHz):');
f=f*power(10,9);

fc=(1.841*c)/(2*pi*a);
w=2*pi*f;
kz=(2*pi/c)*sqrt(power(f,2)-power(fc,2));
Wg=2*pi/kz;
Zw=120*pi/(sqrt(1-(power((fc/f),2))));
Vp=w/kz;
Vg=c*c/Vp;
end

if(s==2)
% TE(1,1) Mode in a dielectric medium.

a=input('Enter value of a <radius> (in cms):');
Er=input('Enter the value of dielectric constant:');
f=input('Enter the value of operating frequency(in GHz):');
f=f*power(10,9);

fc=(1.841*c)/(2*pi*a*sqrt(Er));
w=2*pi*f;
kz=(2*pi*f/c)*sqrt(Er-power((fc/f),2));
Wg=2*pi/kz;
Zw=120*pi/(sqrt(Er-(power((fc/f),2))));
Vp=w/kz;
Vg=c*c/Vp;
end

if(s==3)
% TM(0,1) Mode in air medium.

a=input('Enter value of a <radius> (in cms):');
f=input('Enter the value of operating frequency(in GHz):');
f=f*power(10,9);

fc=(2.405*c)/(2*pi*a);
w=2*pi*f;
kz=(2*pi/c)*sqrt(power(f,2)-power(fc,2));
Wg=2*pi/kz;
Zw=120*pi*(sqrt(1-(power((fc/f),2))));
Vp=w/kz;
Vg=c*c/Vp;
end

if(s==4)
% TM(0,1) Mode in a dielectric medium.

a=input('Enter value of a <radius> (in cms):');
Er=input('Enter the value of dielectric constant:');
f=input('Enter the value of operating frequency(in GHz):');
f=f*power(10,9);

fc=(2.405*c)/(2*pi*a*sqrt(Er));
w=2*pi*f;
kz=(2*pi*f/c)*sqrt(Er-power((fc/f),2));
Wg=2*pi/kz;
Zw=120*pi*(sqrt(Er-(power((fc/f),2))));
Vp=w/kz;
Vg=c*c/Vp;
end

clc;
display('Cut-off frequency (in Hz):');disp(fc);
display('Guided Wavelength (in cms):');disp(Wg);
display('Wave Impedance (in Ohms):');disp(Zw);
display('Phase Velocity (Vp) (in cm/sec):');disp(Vp);
display('Group Velocity (Vg) (in cm/sec):');disp(Vg);

q=input('Do you want to continue <y/n>:','s');
end