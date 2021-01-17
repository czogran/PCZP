clc
close all
clear all

lambda1=1551.68;
kl=8.639001139777177e-07;
kt= 1.083086225435473e-05;

dL=[0 0.02 0.04	0.06 0.08 0.1]; %dLi=Ls,0-Ls,i [mm] - micrometer screw increment 
L=230;  % basic length
strains = dL./L; % calculating strains
micro_strains = strains * 1e6; % calculating micro strains

T=[10.8	18.5 24.5 35.5 45.5	58.6 72	83.4];

t_length = length(T);
l_length = length(dL);

lambdas= zeros(t_length, l_length);
lambdas(1,1) = lambda1;

for t = 1: t_length
    for l = 1: l_length
        if t == 1 
             lambdas(t,l) = lambda1 + ...
            kl *micro_strains(l)*lambda1;
        else
             delta_T=T(t)- T(t-1);
             lambdas(t,l) = lambdas(t-1,l) + kt* delta_T*lambda1 + ...
            kl *micro_strains(l)*lambda1;
        end
        
        
    end
end

figure
surf( micro_strains,T,lambdas)
xlabel('odkształcenie [\mu\epsilon]')
ylabel("temperatura  [C]")
zlabel("długość fali Bragga[nm]")
title("długości fali Bragga "+ newline+" gdy na siatkę działa zarówno odkształcenie jak i temperatura. ")
