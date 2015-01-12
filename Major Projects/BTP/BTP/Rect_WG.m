clear all;
clc;

display('        This program calculates the cut-off frequencies at different modes');
i=[0 0 1 1 2 2 0 1 2 3 3 3 0 1 2 3];
j=[0 1 0 1 0 1 2 2 2 0 1 2 3 3 3 3];
a=input('Enter the value of a (in inches):');
b=input('Enter the value of b (in inches):');
c=3*power(10,10);
a=2.54*a;b=2.54*b;
for k=1:16
    fc_t(k)=(c/2)*sqrt((i(k)*i(k))/(a*a) + (j(k)*j(k))/(b*b));
end
fc=sort(fc_t);
clc;
%display(fc_t);
%display(fc);
o=['  -- ' 
   '  DM ' 
   '1HOM ' 
   '2HOM ' 
   '3HOM ' 
   '4HOM ' 
   '5HOM ' 
   '6HOM ' 
   '7HOM ' 
   '8HOM ' 
   '9HOM ' 
   '10HOM' 
   '11HOM' 
   '12HOM' 
   '13HOM' 
   '14HOM'];
for k=1:16
    for l=1:16
        if(fc_t(l)==fc(k))
            m(k)=i(l);
            n(k)=j(l);
        end
    end
end
clc;
disp('       m          n    fc(in Ghz)');
pay=[m
    n
    fc*power(10,-10)];
payt=pay';
disp(payt);