%This Program Calculates the Skin-Depth of given materials.

clear all;
clc;

k='y';
while(k=='y')
    clc;
    sigma=input('          This Program Claculates the Skin-Depth of given materials.\nPlease enter the conductivity value of material (X 10^7 S/m):');
    f=input('Enter the frequency at which skin-depth needs to be calculated (in Hz):');
    w=2*pi*f;
    uo=4*pi*power(10,-7);
    display('Skin Depth of the Material (in cm):')
    delta=sqrt(2/(uo*w*sigma*power(10,7)))*100
    k=input('Do you want to continue <y/n>:','s');
end