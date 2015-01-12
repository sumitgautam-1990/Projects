%Stub connection in PARALLEL

clc;
clear all;

R0=input('Enter the characteristic impedance of the line,RO:');
Y0=1/R0;
RL=input('\nEnter the real part of output load , RL:');
XL=input('\nEnter the imaginary part of output load , XL:');
F=input('\nEnter the FREQUENCY , F(in GHz):');
OC=input('Select stub type(0/1)\n(0)Open circuited\n(1)Short circuited\n');

LAM=0.3/F;

A= R0*(RL-R0);
B=-2*XL*R0;
C=R0*RL-RL*RL-XL*XL;

T1=(-B+sqrt(B*B-4*A*C))/(2*A);
T2=(-B-sqrt(B*B-4*A*C))/(2*A);

D1=LAM/(2*pi)*atan(T1);
D2=LAM/(2*pi)*atan(T2);

if D1<0
D1=D1+ LAM/2;
end

if D2<0
D2=D2+ LAM/2;
end

B1=(T1*RL*RL-(R0-XL*T1)*(XL+R0*T1)) / (R0*(RL*RL + power((XL+R0*T1),2)));
B2= (T2*RL*RL-(R0-XL*T2)*(XL+R0*T2)) / (R0*(RL*RL + power((XL+R0*T2),2)));
B_STUB1=-B1;
B_STUB2=-B2;

L1=(2*OC-1)*LAM/(2*pi)*atan(power((Y0/B1),(2*OC-1)));
L2=(2*OC-1)*LAM/(2*pi)*atan(power((Y0/B2),(2*OC-1)));

if L1<0
L1=L1+ LAM/2;
end

if L2<0
L2=L2+ LAM/2;
end

fprintf('D1=%d m , ',D1);
fprintf('T1=%d \n',T1);

fprintf('D2=%d m',D2);
fprintf('T2=%d \n',T2);

fprintf('B_STUB1=%d mho , ',-B1);
fprintf('L1=%d m\n',L1);

fprintf('B_STUB2=%d mho',-B2);
fprintf('L2=%d m\n',L2);

fprintf('\n ALL UNITS IN S.I. \n');