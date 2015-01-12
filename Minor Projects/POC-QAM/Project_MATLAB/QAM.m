close all
clear all

% function DSB_SC

%MODULATION
 
N=200;
F=(-N/2:N/2-1)/N;
 
fc=0.25;

n=0:200;
 
c1=cos(2*pi*n*fc);          %carrier 1
figure (1);
subplot(2,2,1)
plot(n,c1);
title('Carrier wave 1'); 
xlabel('time');ylabel('amplitude');
subplot(2,2,2)
plot(F, fftshift(abs(fft(c1,N))));
title('Carrier Wave in frequency-domain 1');
xlabel('frequency'), ylabel('amplitude');
grid on;

fm=0.01;

m1=cos(2*pi*fm*n);           %message signal 1
subplot(2,2,3)
plot(n,m1);
title('Message wave 1');
xlabel('time'),ylabel('amplitude');
subplot(2,2,4)
plot(F, fftshift(abs(fft(m1,N))));
title('Message at frequency-domain 1');
xlabel('frequency'), ylabel('amplitude');
grid on;



c2=sin(2*pi*n*fc);          %carrier 2
figure (2);
subplot(2,2,1)
plot(n,c2);
title('Carrier wave 2'); 
xlabel('time');ylabel('amplitude');
subplot(2,2,2)
plot(F, fftshift(abs(fft(c2,N))));
title('Carrier Wave in frequency-domain 2');
xlabel('frequency'), ylabel('amplitude');
grid on;

m2=1;                       %message signal 2
subplot(2,2,3)
plot(n,m2);
title('Message wave 2');
xlabel('time'),ylabel('amplitude');
subplot(2,2,4)
plot(fft(m2));
title('Message at frequency-domain 2');
xlabel('frequency'), ylabel('amplitude');
grid on;

s1=m1.*c1;                     %modulated signal 1
figure (3);
subplot(2,2,1)
plot(n,s1);
title('Modulated signal of first signal');
xlabel('time'),ylabel('amplitude');
subplot(2,2,2)
plot(F, fftshift(abs(fft(s1,N))));
title('Modulated signal in freq-domain of first signal');
xlabel('frequency'), ylabel('amplitude');
grid on;
 
s2=m2.*c2;                     %modulated signal 2

subplot(2,2,3)
plot(n,s2);
title('Modulated signal of second signal');
xlabel('time'),ylabel('amplitude');
subplot(2,2,4)
plot(F, fftshift(abs(fft(s2,N))));
title('Modulated signal in freq-domain of second signal');
xlabel('frequency'), ylabel('amplitude');
grid on;

s=s1+s2;                    %transmitted signal
figure(4)
plot(s);

x1=s.*c1;                   %demodulated signal 1
b = fir1(8,0.3);            %lowpass filter

w1 = conv(x1,b);
a1=abs(fft(w1,N));

figure (4);
subplot(2,2,1)
plot(F, fftshift(a1));
title('demodulated signal in frequency domain of first signal');
xlabel('frequency'), ylabel('amplitude');
h1=ifft(a1,N);
subplot(2,2,2)
plot(h1);
title('demodulated signal of first signal')
xlabel('time'),ylabel('amplitude');
grid on;


x2=s.*c2;                   %demodulated signal 2


w2 = conv(x2,b);
a2=abs(fft(w2,N));


subplot(2,2,3)
plot(F, fftshift(a2));
title('demodulated signal in frequency domain of second signal');
xlabel('frequency'), ylabel('amplitude');
h2=ifft(a2,N);
subplot(2,2,4)
plot(h2);
title('demodulated signal of second signal')
xlabel('time'),ylabel('amplitude');
grid on;






