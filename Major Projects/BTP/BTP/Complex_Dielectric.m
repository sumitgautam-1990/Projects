%This Program Calculates the Complex Permittivity ,the Complex
%Dielectric Constant and the Loss-Tangent of the material .

clear all;
clc;

j=sqrt(-1);
f=input('This Program Calculates the Complex Permittivity ,the Complex Dielectric Constant and the Loss-Tangent of the material.\nEnter the value of frequency(in GHz):');
ld=input('Enter the value of wavelenght of propagation inside the material (in cms):');
ad=input('Enter the value at which the rate of field amplitude decay inside the material (in dB/m):');
clc;
display('The value of a (in Np/m) and b (in rad/m):');
a=ad/8.686
b=(2*pi)/(ld/100)
c=3*power(10,8);
Er_1= (a*a-b*b)/-((2*pi*f*power(10,9)/c)*(2*pi*f*power(10,9)/c))
Er_2= (2*a*b)/((2*pi*f*power(10,9)/c)*(2*pi*f*power(10,9)/c))
display('Complex Dielectric Constant of the Material:');
Er=Er_1+j*Er_2
tandel=(Er_2/Er_1);
display('Loss Tangent:');display(tandel);
