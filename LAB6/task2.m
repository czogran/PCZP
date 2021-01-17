close all
clear all
clc

%% a
% strains definition
% https://www.omega.co.uk/literature/transactions/volume3/strain.html
dL=[0 0.02 0.04	0.06 0.08 0.1]; %dLi=Ls,0-Ls,i [mm] - micrometer screw increment 
L=230;  % basic length
strains = dL./L; % calculating strains
micro_strains = strains * 1e6; % calculating micro strains

%% b
data = readmatrix('data2.txt'); % data for task2
wave_lengths = data(:,1); %first column contains wave_lengths
transmission_powers = data(:,2:length(data(1,:))); % powers for transmission for diffrent scre increment
power_length = length(transmission_powers(1,:)); % helping variable

figure % crating a figure
legend_text = "naprężenie[\mu\epsilon]: " + string(micro_strains);

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

%% c
lambdas = zeros(1,power_length); % pre-allocating memory
for k=1:power_length % finding wave length for minimum power
    lambdas(k) = wave_lengths(find(transmission_powers(:,k)== min(transmission_powers(:,k)),1));
end

figure % creating a figure
plot(micro_strains, lambdas)
grid on
xlabel('odkształcenie [\mu\epsilon]')
ylabel("długość fali Bragga[nm]")
title("charakterystykę ilustrująca zmiany długości fali Bragga siatki "+newline+"w funkcji odkształcenia")
hold off

%% d 
dLambdas= lambdas(end) - lambdas(1); % lambda difference
ke = (dLambdas/lambdas(1))/micro_strains(end); % relative sensitivity
Ke=ke*lambdas(1); % absolute sensitivity