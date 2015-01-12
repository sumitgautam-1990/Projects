%Amplitude Modulation
%====================

clear all;
close all;

%Message Signal : m= sin(2*pi*fm*t); time period=1;
%======================================================

fc=1000;
fm=100; Tm=1/fm;
A=2;
mu=0.5;
fs=10000; Ts=1/fs;
t=0:Ts:Tm-Ts;

m= sin(2*pi*fm*t);
phiam= (A+m).*cos(2*pi*fc*t);

figure (1);plot(t,m);xlabel('time')
ylabel('Message Signal 1')
title('Message Signal: m= sin(2*pi*fm1*t1)')
figure (2);plot(t,phiam);
xlabel('time')
ylabel('Amplitude Modulated Signal ')

%%%%%%%%%%%%%% ENVELOPE %%%%%%%%%%%%%%%%%%%%
h=exp(-0.8*t);

%%%%%%%%%%%%%%%DEMODULATING PIAM%%%%%%%%%%%%
m1=phiam.*cos(2*pi*t*fc);
M=conv(m1,h);
figure(3);
subplot(2,1,1)
plot(m+2);
title('DEMODULATED SIGNAL');
axis([0 100 0 4]);
xlabel('time(millisec)'),ylabel('demod(piam)');
subplot(2,1,2)
plot(fftshift(abs(fft(M))));
title('fft of DEMODULATED SIGNAL');
xlabel('frequency'),ylabel('demod(piam)');