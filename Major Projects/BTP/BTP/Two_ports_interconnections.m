clear all;
clear;
clc;

j=sqrt(-1);
q_A=input('            This program finds equivalent parameter matrix for an interconnections of TWO 2-port Networks.\nPlease input the network type of NETWORK A(Tee:t and Pi:p):','s');

%Input the Impedance types of Network A

k1_A=input('Enter the impedance type of Z1 <r/l/c>:','s');
if(k1_A=='r')
    R1_A=input('Enter the value of Resistance (in ohms) at Z1=','s');
end
if (k1_A=='l')
    R1_A=input('Enter the value of Inductance (in Henry) at Z1=','s');
end
if (k1_A=='c')
    R1_A=input('Enter the value of Capacitance (in Farad) at Z1=','s');
end

k2_A=input('Enter the impedance type of Z2 <r/l/c>:','s');
if(k2_A=='r')
    R2_A=input('Enter the value of Resistance (in ohms) at Z2=','s');
end
if (k2_A=='l')
    R2_A=input('Enter the value of Inductance (in Henry) at Z2=','s');
end
if (k2_A=='c')
    R2_A=input('Enter the value of Capacitance (in Farad) at Z2=','s');
end

k3_A=input('Enter the impedance type of Z3 <r/l/c>:','s');
if(k3_A=='r')
    R3_A=input('Enter the value of Resistance (in ohms) at Z3=','s');
end
if (k3_A=='l')
    R3_A=input('Enter the value of Inductance (in Henry) at Z3=','s');
end
if (k3_A=='c')
    R3_A=input('Enter the value of Capacitance (in Farad) at Z3=','s');
end

R1_A=str2num(R1_A);
R2_A=str2num(R2_A);
R3_A=str2num(R3_A);

%Input Frequency

if (k1_A=='l' || k1_A=='c' || k2_A=='l' || k2_A=='c' || k3_A=='l' || k3_A=='c')
    f_A=input('Enter the frequency of the circuit(in Hertz):','s');
    f_A=str2num(f_A);
end



q_B=input('Please input the network type of NETWORK B(Tee:t and Pi:p):','s');

%Input the Impedance types of NETWORK B

k1_B=input('Enter the impedance type of Z1 <r/l/c>:','s');
if(k1_B=='r')
    R1_B=input('Enter the value of Resistance (in ohms) at Z1=','s');
end
if (k1_B=='l')
    R1_B=input('Enter the value of Inductance (in Henry) at Z1=','s');
end
if (k1_B=='c')
    R1_B=input('Enter the value of Capacitance (in Farad) at Z1=','s');
end

k2_B=input('Enter the impedance type of Z2 <r/l/c>:','s');
if(k2_B=='r')
    R2_B=input('Enter the value of Resistance (in ohms) at Z2=','s');
end
if (k2_B=='l')
    R2_B=input('Enter the value of Inductance (in Henry) at Z2=','s');
end
if (k2_B=='c')
    R2_B=input('Enter the value of Capacitance (in Farad) at Z2=','s');
end

k3_B=input('Enter the impedance type of Z3 <r/l/c>:','s');
if(k3_B=='r')
    R3_B=input('Enter the value of Resistance (in ohms) at Z3=','s');
end
if (k3_B=='l')
    R3_B=input('Enter the value of Inductance (in Henry) at Z3=','s');
end
if (k3_B=='c')
    R3_B=input('Enter the value of Capacitance (in Farad) at Z3=','s');
end

R1_B=str2num(R1_B);
R2_B=str2num(R2_B);
R3_B=str2num(R3_B);

%Input Frequency

if (k1_B=='l' || k1_B=='c' || k2_B=='l' || k2_B=='c' || k3_B=='l' || k3_B=='c')
    f_B=input('Enter the frequency of the circuit(in Hertz):','s');
    f_B=str2num(f_B);
end



%Calculation of Z1,Z2,Z3 AND NETWORK PARAMETERS OF NETWORK A

if (k1_A=='r')
    Z1_A=R1_A;
end
if (k1_A=='l')
    Z1_A=j*2*pi*f_A*R1_A;
end
if (k1_A=='c')
    Z1_A=-j/2*pi*f_A*R1_A;
end

if (k2_A=='r')
    Z2_A=R2_A;
end
if (k2_A=='l')
    Z2_A=j*2*pi*f_A*R2_A;
end
if (k2_A=='c')
    Z2_A=-j/2*pi*f_A*R2_A;
end

if (k3_A=='r')
    Z3_A=R3_A;
end
if (k3_A=='l')
    Z3_A=j*2*pi*f_A*R3_A;
end
if (k3_A=='c')
    Z3_A=-j/2*pi*f_A*R3_A;
end

if (q_A=='t')
    Z_A=[Z1_A+Z2_A Z2_A 
        Z2_A Z2_A+Z3_A];
end

if (q_A=='p')
    Z_A=[(Z2_A*(Z1_A+Z3_A))/(Z1_A+Z2_A+Z3_A) Z2_A*Z3_A/(Z1_A+Z2_A+Z3_A) 
        Z2_A*Z3_A/(Z1_A+Z2_A+Z3_A) Z3_A*(Z1_A+Z2_A)/(Z1_A+Z2_A+Z3_A)];
end
    Y_A=[ Z_A(4)/det(Z_A) -Z_A(2)/det(Z_A)
        -Z_A(3)/det(Z_A) Z_A(1)/det(Z_A)];
   
    ABCD_A=[ Z_A(1)/Z_A(3) det(Z_A)/Z_A(3)
           1/Z_A(3)    Z_A(4)/Z_A(3)];

%Calculation of Z1,Z2,Z3 AND NETWORK PARAMETERS OF NETWORK B

if (k1_B=='r')
    Z1_B=R1_B;
end
if (k1_B=='l')
    Z1_B=j*2*pi*f_B*R1_B;
end
if (k1_B=='c')
    Z1_B=-j/2*pi*f_B*R1_B;
end

if (k2_B=='r')
    Z2_B=R2_B;
end
if (k2_B=='l')
    Z2_B=j*2*pi*f_B*R2_B;
end
if (k2_B=='c')
    Z2_B=-j/2*pi*f_B*R2_B;
end

if (k3_B=='r')
    Z3_B=R3_B;
end
if (k3_B=='l')
    Z3_B=j*2*pi*f_B*R3_B;
end
if (k3_B=='c')
    Z3_B=-j/2*pi*f_B*R3_B;
end

if (q_B=='t')
    Z_B=[Z1_B+Z2_B Z2_B 
        Z2_B Z2_B+Z3_B];
end

if (q_B=='p')
    Z_B=[(Z2_B*(Z1_B+Z3_B))/(Z1_B+Z2_B+Z3_B) Z2_B*Z3_B/(Z1_B+Z2_B+Z3_B) 
        Z2_B*Z3_B/(Z1_B+Z2_B+Z3_B) Z3_B*(Z1_B+Z2_B)/(Z1_B+Z2_B+Z3_B)];
end
    Y_B=[ Z_B(4)/det(Z_B) -Z_B(2)/det(Z_B)
        -Z_B(3)/det(Z_B) Z_B(1)/det(Z_B)];
   
    ABCD_B=[ Z_B(1)/Z_B(3) det(Z_B)/Z_B(3)
           1/Z_B(3)    Z_B(4)/Z_B(3)];
u='y';
while(u=='y')
clc;
p=input('Select the interconnection of your type:\n 1.Series Interconnection.\n 2.Parallel Interconnection.\n 3.Cascade Interconnection.\n Your Choice Please:');
display('The Matrix for desired interconnection is:');
if(p==1)
    Zoverall=Z_A+Z_B
end
if(p==2)
    Yoverall=Y_A+Y_B
end
if(p==3)
    ABCDoverall=ABCD_A*ABCD_B
end

u=input('Do you want to continue? <y/n>:','s');
end