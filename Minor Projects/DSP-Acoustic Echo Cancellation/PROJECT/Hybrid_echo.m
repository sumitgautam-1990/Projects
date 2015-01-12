clear all;
mule = .01; % Larger values for fast conv
max_run = 200;
for run=1:max_run;
taps = 20; %Adaptive Filter Taps #
freq = 2000;%Signal Freq
w = zeros(1,taps);%state of adaptive filter
time = .2;%lenght of simulation (sec)
samplerate = 8000;%samples/sec
samples = time*samplerate;
max_iterations = samples-taps+1;
iterations = 1:max_iterations;%Vector of iterations
t=1/samplerate:1/samplerate:time;
rand('state',sum(100*clock));%Reset Randome Generator
noise=.02*rand(1,samples);%noise added to signal
s=.4*sin(2*pi*freq*t);%Pure Signal
x=noise+s;%input to adaptive filter
echo_amp_per = .4; %Echo percent of signal
%rand('state',sum(100*clock));%Reset Randome Generator
echo_time_delay = .064;
echo_delay=echo_time_delay*samplerate;
echo = echo_amp_per*[zeros(1,echo_delay) x(echo_delay+1:samples)];
%LMS
for i=1:max_iterations;
   y(i)=w*x(i:i+taps-1)';    
   e(run,i)=echo(i)-y(i);
   %mule(i) = .5/(x(i:i+taps-1)*x(i:i+taps-1)'+ .01);
   w = w + 2*mule*e(run,i)*x(i:i+taps-1);
end
end
%%Mean Square Error
mse=sum(e.^2,1)/max_run;
b=x+echo;
%Ouput of System 
out=b(1:length(y))-y;
subplot(3,1,1),plot(b);
title('Signal and Echo');
ylabel('Amp');
xlabel('Time sec');
subplot(3,1,2),plot(out);
title('Output of System');
ylabel('Amp');
xlabel('Time sec');
subplot(3,1,3),semilogy(mse);
grid
title('LEARNING CURVE mu=.01 echo delay=64ms runs=200');
ylabel('Estimated MSE, dB');
xlabel('Number of Iterations');
%subplot(3,1,2),semilogy(iterations,e(1,:).^2);
%grid
%subplot(3,1,3),semilogy(iterations,e(2,:).^2);
%grid

