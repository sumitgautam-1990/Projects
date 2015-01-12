clear all;
clc;
clf;
close all;

%**************************************************************************
% Initialize all the values for the block implementation
N = 64;
L = 16;
P = L;
M = 32;
R = 10;
B = N+M-L; 
%**************************************************************************

% Find the FFT and IFFT matrices 
F = fft(eye(M)); % MxM matrix
figure(1);plot(F);
figure(2);plot(abs(F));

Finv = ifft(eye(M)); % MxM matrix
figure(3);plot(Finv);
figure(4);plot(abs(Finv));

G1 = [zeros(M-L,M-L) zeros(M-L,L)
zeros(L,M-L) eye(L,L)];
figure(5);plot(G1);
%**************************************************************************

% Intialize the constarined or unconstarined condition 
G2 = F*[eye(P) zeros(P,M-P)
zeros(M-P,P) zeros(M-P,M-P)]*Finv; % size = MxM , constrained
figure(6); plot(G2);
%**************************************************************************

% Intialize the coefficients vector 
K = 5; % Gain factor 
w(1:N,1) = K*[ones(N,1)]; % Nx1 vector , intialize the coefficients vector 

for (p = 0 : (N/P)-1)
W_p(1:M,p+1) = F*[w((p*P)+1 : (p+1)*(P),1) % Mx1 vector , find the frequency domain equivalent 
zeros(M-P,1)]; % Split into N/P parts , length is Px1 and zero pad with (M-P)x1 zeros 
end % Size of W_p = Mx1

figure(7);plot(W_p);
%**************************************************************************

% Time sampling for collecting data 
% %noise signal
% noise = .2*randn(1,length(t));
% x1 = randn(1,length(t));
% b = fir1(63,[.35 .65]);
% %sample original signal x
% f1 = filter(b,1,x1);

[x1,fs] = wavread('C:\signalplusnoise.wav',64);


[s] = wavread('C:\noise.wav',64);
figure(9);plot(s);
t = 0:length(x1);

%assume additive white gaussian noise and add to s
[xw] = 10*[x1];
k = 5;
figure(8);plot(xw);
%here s = sin(3*t)
%s = k*(10*sin(.5*t) + 20*cos(5*t));
% d = xw + s
d = xw + s ; 
figure(19);plot(d);
%**************************************************************************

% Taking data , size = the lowest power of 2 available data 
TB = floor(log2(length(t)));
TBL = 2^TB;
%**************************************************************************

%plot x d and s to be able to see them together
figure(10);
plot(t(1:TBL),x1(1:TBL));
hold on;
plot(t(1:TBL),d(1:TBL),'r-');
xlabel ('NUMBER OF SAMPLES');
ylabel('AMPLITUDE');
axis tight;
plot(t(1:TBL),s(1:TBL),'g+');
legend('ORIGINAL SIGNAL, x','d = s + (w*x)','NEW SIGNAL, s');
%close ;
%plot noise
figure(11);
plot(xw(1:TBL));
axis tight;
title('SIGNALS FROM LOUDSPEAKER');
xlabel ('NUMBER OF SAMPLES');
ylabel('AMPLITUDE');
%close ;

%**************************************************************************
x = [zeros(1,(N + M - 2*L))' x1]; % Zero pad with N + M - 2*L zeros 
%**************************************************************************

for a = 1:TBL/L
dd(1:L,1) = d(((a-1)*L + 1):a*L)'; % L samples of desired element 
d_l(1:M,1) = [zeros(M-L,1) 
dd ];% Desired data matric Mx1 matrix , fixed for the 
end
figure(12);plot(dd);
xhold(1:B,1) = [x(((a-1)*L +1) : ((a-1)*L + B))]' ; % every L sample (N+M-L)x1
figure(13);plot(xhold);

for p = 0:1:((N/P)-1)
x_p(1:M,p+1) = xhold((B - p*P - M +1):(B - p*P),1); % take the first L samples and the previous N samples 
X_p(1:M,p+1) = F*x_p(1:M,p+1); % create blocks of length M starting from the latest sample
% and going backwards.
end
figure(14);plot(x_p);
figure(15);plot(X_p);
figure(16);plot(abs(X_p));

%Del = calculate_step_size(X_p,M,N/P,type);
Del = size(X_p,M);

for r = 1:R % Start the recursion 
if r == 1
W_p_r(1:M,1:(N/P),r) = W_p(1:M,1:(N/P)); % store the filter weights in a new array indexed 
end % for including the R iterations
end
figure(17);plot(abs(W_p_r));

temp = 0; % Initialize for summation

for p = 0:1:((N/P)-1)
temp = temp + [((diag(X_p(1:M,p+1)))*W_p_r(1:M,p+1))]; % Find the summation of X_p*w_p
end
% figure(17);plot(temp);

y(1:M,r) = real(G1*Finv*temp)./P; % estimate of
figure(18);plot(y);