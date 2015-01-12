clear all;
clc;

Zo=input('Enter the value of characteristic impedance(in Ohms):');
Er=input('Enter the value of dielectric constant:');
h=input('Enter the value of substrate thickness (in mills):');
b=2*h;

x= (30*pi)/(sqrt(Er)*Zo)-0.441;
if((sqrt(Er)*Zo)<120)
    w=x*b;
end
if((sqrt(Er)*Zo)>120)
    w=(0.85-sqrt(0.6-x))*b;
end

disp('The value of w (in mil)=')
disp(w);
