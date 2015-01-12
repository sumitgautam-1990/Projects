clc;
clear all;

display('This Program calculates the effective dielectric constant and Characteristic impedance of a microstrip line');

Er=input('Enter the value of dielectric constant:');
h=input('Enter the value of height of the Microstrip line h(in mil):');
w=input('Enter the value of width of the Microstrip Line w(in mil):');
Ereff=((Er+1)/2)+((Er-1)/2)*(1/sqrt(1+12*(h/w)));
if(w/h<=1)
    Zo=(60/sqrt(Ereff))*log(8*(h/w)+(w/(4*h)));
end
if(w/h>1)
    Zo=(120*pi)/(sqrt(Ereff)*((w/h)+1.393+0.667*log((w/h)+1.414)));
end

disp('The value of Effective Dielectric constant:')
display(Ereff);
disp('The value of Characteristic Impedance:')
display(Zo);
