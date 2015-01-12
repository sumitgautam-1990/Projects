clear all;
clc;

display('     This program finds: Zin,Pl,P0,VSWR and First Voltage and First Current Maxima ');
j=sqrt(-1);
Z0=input('Enter value of characteristic Impedance (in Ohms):');
display('Please enter complex value for load impedance:');
Zr=input('Enter real part of Zl(in ohms):');
Zc=input('Enter imaginary part of Zl(in ohms):');
Zl=Zr+j*Zc;
Lbyz=input('Enter the value of electric length:');
BL=2*pi*(Lbyz);
q='y';
while(q=='y')
clc;
display('                 MAIN MENU');
k=input('1. Find Input Impedance (Zin) for the given inputs.\n2. Find Reflection Coefficient  at the load(Pl) for the given inputs.\n3. Find Reflection Coefficient  at the input(Po) for the given inputs.\n4. Find the VSWR for the given inputs.\n5. Find the locations of the first voltage maximum and the first current maximum.\n\n Your Choice Please:');
if(k==1)
    display(' The Value of Input Impedance (Zin):');
    Zin= Z0*(Zl+j*Z0*tan(BL))/(Z0+j*Zl*tan(BL))
end
if(k==2)
    display(' The value of Reflection Coefficient at the load (Pl):');
    Pl=(Zl-Z0)/(Zl+Z0)
end
if(k==3)
    display(' The value of Reflection Coefficient at the input (P0):');
    P0=((Zl-Z0)/(Zl+Z0))*exp(-2*j*BL)
end
if(k==4)
    display(' The value of VSWR:');
    Pl=(Zl-Z0)/(Zl+Z0);
    VSWR=(1+abs(Pl))/(1-abs(Pl))
end
if(k==5)
    display(' The values of locations of the first voltage maximum and the first current maximum:');
    P0=((Zl-Z0)/(Zl+Z0))*exp(-2*j*BL);
    a=angle(P0);
    Xvmax=(2*pi-(a+2*pi))/4*pi;
    Ximax=(3*pi-(a+2*pi))/4*pi;
    display(' The first voltage maximum = lambda * ');display(Xvmax);
    display(' The first current maximum = lambda * ');display(Ximax);
end
q=input('Do you want to continue <y/n> :','s');
end