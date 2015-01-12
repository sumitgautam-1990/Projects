clc;
clear all;

Er=input('Enter the value of dielcetric constant:');
Zo=input('Enter the value of characteristic impedance (in ohms):');
h=input('Enter the height of the Microstrip line (in mil):');

A=(Zo/60)*sqrt((Er+1)/2) + ((Er-1)/(Er+1))*(0.23+(0.11/Er));
B=(377*pi)/(2*Zo*sqrt(Er));

AR1=(8*exp(A))/(exp(2*A)-2);
AR2=(2/pi)*(B-1-log(2*B-1)+((Er-1)/(2*Er))*(log(B-1)+0.39-(0.61/Er)));
if(AR1<=2)
    w=AR1*h;
end

if(AR2>2)
    w=AR2*h;
end

disp('The width of the Microstrip line (in mil):')
disp(w);
