clear all;
clear;
clc;

j=sqrt(-1);
q=input('            This program calulates Z,Y,ABCD and S parameters for a given circuit.\nPlease input the network type(Tee:t and Pi:p):','s');

%Input the Impedance types

k1=input('Enter the impedance type of Z1 <r/l/c>:','s');
if(k1=='r')
    R1=input('Enter the value of Resistance (in ohms) at Z1=','s');
end
if (k1=='l')
    R1=input('Enter the value of Inductance (in Henry) at Z1=','s');
end
if (k1=='c')
    R1=input('Enter the value of Capacitance (in Farad) at Z1=','s');
end

k2=input('Enter the impedance type of Z2 <r/l/c>:','s');
if(k2=='r')
    R2=input('Enter the value of Resistance (in ohms) at Z2=','s');
end
if (k2=='l')
    R2=input('Enter the value of Inductance (in Henry) at Z2=','s');
end
if (k2=='c')
    R2=input('Enter the value of Capacitance (in Farad) at Z2=','s');
end

k3=input('Enter the impedance type of Z3 <r/l/c>:','s');
if(k3=='r')
    R3=input('Enter the value of Resistance (in ohms) at Z3=','s');
end
if (k3=='l')
    R3=input('Enter the value of Inductance (in Henry) at Z3=','s');
end
if (k3=='c')
    R3=input('Enter the value of Capacitance (in Farad) at Z3=','s');
end

R1=str2num(R1);
R2=str2num(R2);
R3=str2num(R3);

%Input Frequency

if (k1=='l' || k1=='c' || k2=='l' || k2=='c' || k3=='l' || k3=='c')
    f=input('Enter the frequency of the circuit(in Hertz):','s');
    f=str2num(f);
end


%Calculation of Z1,Z2 and Z3

if (k1=='r')
    Z1=R1;
end
if (k1=='l')
    Z1=j*2*pi*f*R1;
end
if (k1=='c')
    Z1=-j/2*pi*f*R1;
end

if (k2=='r')
    Z2=R2;
end
if (k2=='l')
    Z2=j*2*pi*f*R2;
end
if (k2=='c')
    Z2=-j/2*pi*f*R2;
end

if (k3=='r')
    Z3=R3;
end
if (k3=='l')
    Z3=j*2*pi*f*R3;
end
if (k3=='c')
    Z3=-j/2*pi*f*R3;
end

%Calculation of parameters
d='y';
while(d=='y')
clc;
l=input('Please select the type of parameters you want to compute.\n1.Impedance parameters (Z-parameters).\n2.Admittance parameters (Y-parameters).\n3.Transmission parameters (ABCD-parameters).\n4.Scattering parameters (S-parameters).\nPlease enter your choice:','s');
l=str2num(l);

if (q=='t')
    Z=[Z1+Z2 Z2 
        Z2 Z2+Z3];
end

if (q=='p')
    Z=[(Z2*(Z1+Z3))/(Z1+Z2+Z3) Z2*Z3/(Z1+Z2+Z3) 
        Z2*Z3/(Z1+Z2+Z3) Z3*(Z1+Z2)/(Z1+Z2+Z3)];
end
if(l==1)
    display('The Impedance Matrix is:');
    display(Z);
    if(Z(2)==Z(3)) 
        display('This is a Reciprocal Network.'); 
    end
    TF=Z(3)/Z(1);
    Zin=Z(1);
    display('Transfer Function of the Network :');
    display(TF);
    display('Input Impedance of the Network :');display(Zin);
end
if(l==2)
    display('The Admittance Matrix is:');
    Y=[ Z(4)/det(Z) -Z(2)/det(Z)
        -Z(3)/det(Z) Z(1)/det(Z)]
    if(Y(2)==Y(3)) 
        display('This is a Reciprocal Network'); 
    end
end
if(l==3)
    display('The Transmission Matrix is:');
    ABCD=[ Z(1)/Z(3) det(Z)/Z(3)
           1/Z(3)    Z(4)/Z(3)]
    if(ABCD(1)*ABCD(4)-ABCD(2)*ABCD(3)==1) 
        display('This is a Reciprocal Network'); 
    end
end
if(l==4)
    Z0=input('Please enter the value of Z0 (in Ohms):');
    display('The Scattering Matrix is:');
    delz=(Z(1)+Z0)*(Z(4)+Z0);
    S=[((Z(1)-Z0)*(Z(4)+Z0)-Z(2)*Z(3))/delz 2*Z(2)*Z0/delz
        2*Z(2)*Z0/delz ((Z(1)+Z0)*(Z(4)-Z0)-Z(2)*Z(3))/delz]
end

d=input('Do you want to continue? <y/n>:','s');
end