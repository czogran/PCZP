close all
clear all
clc

T=[10.8	18.5 24.5 35.5 45.5	58.6 72	83.4];


%% a
data = readmatrix('data3.txt'); % data for task3
wave_lengths = data(:,1); % first column contains wave_lengths
transmission_powers = data(:,2:length(data(1,:))); % powers for transmission for diffrent scre increment
power_length = length(transmission_powers(1,:)); % helping variable

figure 
legend_text = "T[C]: " + string(T);

for k=1:power_length
    plot(wave_lengths,transmission_powers(:,k))
    hold on
end
grid on
title('rodzina charakterystyk spektralnych')
xlabel('długość fali [nm]')
ylabel('P[dBm]')
legend(legend_text, 'Location', 'best')
hold off

%% b % creating figure
lambdas = zeros(1,power_length); % pre-allocating memory
for k=1:power_length % finding wave length for minimum power
    lambdas(k) = wave_lengths(find(transmission_powers(:,k)== min(transmission_powers(:,k)),1));
end

figure
plot(T, lambdas)
grid on
xlabel('tempeartura [C]')
ylabel("długość fali Bragga[nm]")
title("charakterystykę ilustrująca zmiany długości fali Bragga siatki "+newline+"w funkcji temperatury")
hold off

%% c
dLambdas= lambdas(end) - lambdas(1); % lambda difference
ke = (dLambdas/lambdas(1))/(T(end)-T(1)); % relative sensitivity
Ke=ke*lambdas(1); % absolute sensitivity