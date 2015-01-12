function y = hearingAidF(input,g,Psat,transitionV,newfile);

[x,fs,nbits] = wavread('late_cafe.wav');
g=90;
Psat=60;
transitionV=[3000 4000 5000 9000];
xc = denoiseEm(x);                             
xf = applySkiSlope(xc,g,transitionV,fs);       
y = powerCompress(xf, Psat,fs);                
x_length = length(x);
t=[0:1/fs:(x_length-1)/fs];




figure;
subplot(2,1,1);
plot(t,x,'b');
axis tight;
xlabel('Time (sec)');
ylabel('Relative Magnitude');
Title('Time Profile for Data in Signal 2');


subplot(2,1,2);
plot(t,y,'r');
axis tight;
xlabel('Time (sec)');
ylabel('Relative Magnitude');
Title('Time Profile for Data in Adjusted Signal 2');

figure;
subplot(2,1,1);
specgram(x);
title('Spectrogram of Original Signal 2');

subplot(2,1,2);
specgram(y);
title('Spectrogram of Adjusted Signal 2');



sound(y,fs);
auwrite(y,fs,nbits,'linear','late_cafe_out.au');
 