close all
clear all
clc

wave = readmatrix('wave-length1.txt');
y = readmatrix('data1.txt');

figure
plot(wave,y)
xlabel('Długosć fali [nm]')
ylabel ('P[dBm]')
title('charakterystyka spektralna transmisyjnej siatki Bragga') 
grid on
hold off

window = y(find(wave == 1551.25): find(wave == 1552.25));
wave_window= wave(find(wave == 1551.25): find(wave == 1552.25));
lambda = wave_window (find(window==min(window)));
T= min(window) -max(window);
t=(10^(T/10))*100;
r= 100 -t;
fwhm_threshold = max(window)-3;
indexes = find(window< fwhm_threshold);
fwhm =wave_window(indexes(1)) - wave_window(indexes(end));
figure
plot(wave_window,window)

