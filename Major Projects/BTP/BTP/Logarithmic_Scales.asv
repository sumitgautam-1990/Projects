clear all;
clc;
w='y';
while(w=='y')
    clc;
k=input('                   Main-Menu\n 1.Find dB value of a 2-Port Network.\n 2.Find Neper value of a 2-Port Network.\n 3.Convert dB value to Neper and vice-versa.\n 4.Find dBm value for a given value of Power(in Watts).\n 5.Find Power(in Watts) for a given dBm value.\n 6.Find dBw value for a given value of Power(in Watts).\n 7.Find Power(in Watts) for a given dBw value.\n 8.Convert a value from dBw to dBm.\n Please enter your choice:');
clc;
if(k==1)
    display('Find dB value of a 2-Port Network.');
    V1=input('\nEnter the value of V1(in Volts):');
    V2=input('\nEnter the value of V2(in Volts):');
    dB=20*(log(V2/V1)/2.303);
    display('The Value in dB:');display(dB);
end
if(k==2)
    display('Find Neper value of a 2-Port Network.');
    V1=input('\nEnter the value of V1(in Volts):');
    V2=input('\nEnter the value of V2(in Volts):');
    Np=log(V2/V1);
    display('The Value in Neper:');display(Np);
end
if(k==3)
    display('Convert dB value to Neper and vice-versa.');
    s=input('a.Convert dB to Neper.\n b.Convert Neper to dB.\n Your Choice:');
    if(s=='a') 
        Np=input('Enter value in Neper:');
        dB=8.686*Np;
        display('The value in dB:');dislpay(dB);
    end
    if(s=='b') 
        dB=input('Enter value in dB:');
        Np=dB/8.686;
        display('The value in Neper:');dislpay(Np);
    end
end
if(k==4)
    display('Find dBm value for a given value of Power(in Watts).');
    P=input('Enter the value of Power(in Watts):');
    dBm=10*(log(P/0.001)/2.303);
    display('The value in dBm:');display(dBm);
end
if(k==5)
    display('Find Power(in Watts) for a given dBm value.');
    dBm=input('Enter the value of dBm:');
    P=power(10,(dBm/10))*0.001;
    display('The value of Power(in Watts):');display(P);
end
if(k==6)
    display('Find dBw value for a given value of Power(in Watts).');
    P=input('Enter the value of Power(in Watts):');
    dBw=(10*log(P/1))/2.303;
    display('The value in dBw:');display(dBw);
end
if(k==7)
    display('Find Power(in Watts) for a given dBw value.');
    dBw=input('Enter the value of dBw:');
    P=power(10,(dBw/10))*1;
    display('The value of Power(in Watts):');display(P);
end
if(k==8)
    display('Convert a value from dBw to dBm.');
    dBw=input('Enter value in dBw:');
    dBm=30+dBw;
    display('The value in dBm:');display(dBm);
end
w=input('Do you want to continue <y/n>:','s');
end