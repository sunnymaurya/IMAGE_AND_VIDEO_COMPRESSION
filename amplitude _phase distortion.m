clc;
close all;
clear all;
 
a=zeros(1,50);
b=ones(1,50);
c=[a,b,a];
m=length(c);
subplot(2,2,1);
plot(c);
axis([0 m -0.1 1.1]);
title('Original Signal');
ylabel('Amplitude');
xlabel('Time(sec)');
 
d=fft(c);

% Amplitude Distortion 
f1=d(1,1:length(d)/3)*0.2;
f2=d(1,length(d)/3:2*length(d)/3)*0.7;
f3=d(1,2*length(d)/3:length(d));
f=[f1,f2,f3];
g=ifft(f);
subplot(2,2,2);
plot(abs(g)); 
title('Resultant Signal with Amplitude Distortion');
ylabel('Amplitude');
xlabel('Time(sec)');
 
% Phase Distortion
f1=d(1,1:length(d)/3)*(1+3j);
f2=d(1,length(d)/3:2*length(d)/3)*(5+11j);
f3=d(1,2*length(d)/3:length(d))*(2+3j);
f=[f1,f2,f3];
h=ifft(f);
subplot(2,2,3);
plot(abs(h)); 
title('Resultant Signal with Phase Distortion');
ylabel('Amplitude');
xlabel('Time(sec)');

% Distortion caused by Band Limited Channel(ISI) 
f4=d(1,length(d)/5:4*length(d)/5);
i=ifft(f4);
subplot(2,2,4);
plot(abs(i)); 
title('Resultant Signal with Distortion caused by Band Limited Channel(ISI)');
ylabel('Amplitude');
xlabel('Time(sec)');

