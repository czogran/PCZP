clc
close all
clear all
%% ZADANIE 1
Q =10:10: 100;
a=9;
b=2;
k=a+5*b;
p=k*Q.^2;


figure
semilogy(Q,p)
xlabel('$Q[\frac{dm^3}{h}]$','Interpreter','latex')
ylabel('$p[Pa]$','Interpreter','latex')
title('charakterystyka przepływomierza p=f(Q)')
hold off

%% ZADANIE 2
Qdown=0.1:0.01:0.2;
Qup=(0.2+0.01):0.01:1;
Q=[Qdown Qup];
error1=ones(1,length(Qdown))*5;
error5 =ones(1,length(Qup))*1;
error =[error1 error5];
a=9;
b=2;
dQ=a*0.01+b*0.05./Q;

figure
plot(Q,dQ)
hold on
plot(Q, error, 'r*')
legend('błąd','wymagana dokładności')
ylabel('$\delta Q$','Interpreter','latex')
xlabel('$Q$','Interpreter','latex')
title('$\delta Q=f(Q)$','Interpreter','latex')
hold off

%% ZADANIE 3
a=9;
b=2;
Qmin =a+2;
Qmax = b+15;
Q=Qmin:Qmax;
dQ=a*0.01+b*0.005*Qmax./Q;

dAbsQ= dQ.*Q;

figure
plot(Q,dAbsQ)
xlabel('$Q[\frac{m^3}{h}]$','Interpreter','latex')
ylabel('$\delta Q$','Interpreter','latex')
title({'błąd bewzgledny pomiaru strumienia objętości',' w zależności od wartości mierzonej'})
