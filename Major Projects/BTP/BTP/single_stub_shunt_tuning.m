% For a load impedance Zl, design two single-stub (short circuit) shunt
% tuning networks to match this load to a 50 ohms line. Assuming that the
% load is matched at 2 GHz.

clear all;
clc;

j=sqrt(-1);

Rl=input('Enter the real value of load impedance(in ohms):');
Xl=input('Enter the imaginary value of load impedance(in ohms):');

Zl=Rl+j*Xl;

Zo=input('Enter the value of input impedance(in ohms):');

f=input('Enter the frequency (in GHz):');

if(Rl~=Zo)
    t1=(Xl+sqrt(Rl*(power((Zo-Rl),2)+power(Xl,2))/Zo))/(Rl-Zo); 
    t2=(Xl-sqrt(Rl*(power((Zo-Rl),2)+power(Xl,2))/Zo))/(Rl-Zo);
end

display(t1);
display(t2);

if(Rl==Zo)
    t1=-Xl/2;
    t2=-Xl/2;
end

if(t1>=0)
    d1=atan(t1)/(2*pi);
end
if(t2>=0)
    d2=atan(t2)/(2*pi);
end
if(t1<0)
    d1=(pi+atan(t1))/(2*pi);
end
if(t2<0)
    d2=(pi+atan(t2))/(2*pi);
end

G1=(Rl*(1+t1*t1))/(Rl*Rl+(Xl+Zo*t1)*(Xl+Zo*t1));
B1=(Rl*Rl*t1-(Zo-Xl*t1)*(Xl+Zo*t1))/(Zo*(Rl*Rl+(Xl+Zo*t1)*(Xl+Zo*t1)));
Y1=(G1+j*B1)*Zo;

G2=(Rl*(1+t2*t2))/(Rl*Rl+(Xl+Zo*t2)*(Xl+Zo*t2));
B2=(Rl*Rl*t2-(Zo-Xl*t2)*(Xl+Zo*t2))/(Zo*(Rl*Rl+(Xl+Zo*t2)*(Xl+Zo*t2)));
Y2=(G2+j*B2)*Zo;

display(Y1);
display(Y2);
Bs1=-B1;
Bs2=-B2;
Yo=1/Zo;
lo1=atan(Bs1/Yo)/(2*pi);
lsc1=-atan(Yo/Bs1)/(2*pi);
if(lo1<0)
    lo1=lo1+0.5;
end
if(lsc1<0)
    lsc1=lsc1+0.5;
end

lo2=atan(Bs2/Yo)/(2*pi);
lsc2=-atan(Yo/Bs2)/(2*pi);
if(lo2<0)
    lo2=lo2+0.5;
end
if(lsc2<0)
    lsc2=lsc2+0.5;
end

disp('The two values of d obtained are:');
disp('d1/lambda=')
disp(d1);
disp('d2/lambda=')
disp(d2);

disp('Lengths required in case of Y1 for:');
disp('Open Circuit/lambda:')
disp(lo1);

disp('Short Circuit/lambda:')
disp(lsc1);

disp('Lengths required in case of Y2 for:');
disp('Open Circuit/lambda:')
disp(lo2);

disp('Short Circuit/lambda:')
disp(lsc2);

