clc
clear
close all
[Sound,Fs] = audioread('M20.WAV');
M20=Sound;
save('M20.mat','M20');%input of part1::Compressor
Segment_time=25e-3;%Segment_time
Frame=Fs*Segment_time;
Frame
Segment_num=ceil(length(Sound)/Frame);%Number of Segments
Segment_num
Pad=Segment_num*Frame;%For zero padding
Pad
Frame=[0,Frame];%For part 2