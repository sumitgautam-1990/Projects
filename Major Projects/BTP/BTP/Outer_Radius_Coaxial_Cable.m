% To calculate the outer radius of the coaxial cable

clear all;
clc;

k=input('            Main-Menu\nCalculate the outer radius of coaxial line:\n1.Without Dielectric Mediun.\n2.With Lossless Dielectric Medium.\nYour Choice Please:');
display('            Output');
if(k==1)
    Zo=input('Enter the value of characteristic impedance (in ohms):');
    a=input('Enter the value of inner radius a (in cms):');
    b=exp(Zo/60)*a;
end
if(k==2)
    Zo=input('Enter the value of characteristic impedance (in ohms):');
    Er=input('Enter the value of Lossless Dielectric Constant:');
    a=input('Enter the value of inner radius a (in cms):');
    b=exp((Zo*sqrt(Er))/60)*a;
end

display('Value of outer radius of the coaxial cable (in cms):')
disp(b);

b=b*1000/2.54;
display('Value of outer radius of the coaxial cable (in mil):')
disp(b);
