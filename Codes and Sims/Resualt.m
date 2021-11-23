clc
close all
%%%%%%%%%%%%%%%%%%%%Part-1 Original Signal 
[Sound,Fs] = audioread('M20.WAV');%Read original Speech
dt=1/Fs;
time=0:dt:dt*(length(Sound)-1);%time axes
figure()
plot(time,Sound,'red');
xlabel('time (\sec)');
ylabel('y(t)');
grid on;
grid minor ;
title('Original-Sound');
fs = Fs;
t = time;
x =Sound;
figure()%%%Plot STFT of Speech 2D
stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512);
figure()%%%Plot STFT of Speech 3D
stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512);
view(-45,65)
colormap jet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reconstructed Speech
figure()
time=0:dt:dt*(length(out.simout)-1);%time axes
plot(time,out.simout,'red');
xlabel('time (\sec)');
ylabel('y(t)');
title('Reconstructed-Sound');
grid on;
grid minor ;

fs = Fs;
t = time;
x =out.simout;
figure()%%%Plot STFT of Speech 2D
stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512);
figure()%%%Plot STFT of Speech 3D
stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512);
view(-45,65)
colormap jet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lowpass_filter=load('Lowpass_filter.mat','Num');%%%%Filter low pass
Lowpass_filter=Lowpass_filter.Num;
Data=filter(Lowpass_filter,1,out.simout); %Filter the sound

figure()
time=0:dt:dt*(length(Data)-1);%time axes
plot(time,Data,'red');
xlabel('time (\sec)');
ylabel('y(t)');
title('Filtered-Reconstructed-Sound');
grid on;
grid minor ;

fs = Fs;
t = time;
x =Data;
figure()%%%Plot STFT of Speech 2D
stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512);
figure()%%%Plot STFT of Speech 3D
stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512);
view(-45,65)
colormap jet

sound(out.simout,Fs);%%Play 
audiowrite('Reconstructed.WAV',out.simout,Fs);%Save the Reconstructed
audiowrite('Filtered Reconstructed.WAV',out.simout,Fs);%Save the Filtered Reconstructed