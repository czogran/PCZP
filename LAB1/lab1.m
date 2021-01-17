close all
clc
clear all

%% ZADANIE 1
Q=1:10;
a=9;
k=2*a+1;
p=Q*k;

figure
plot(Q,p)
xlabel('Q[$\frac{m^{3}}{h}$]', 'Interpreter', 'latex')
ylabel('p[$Pa$]','Interpreter', 'latex')
title('$p=f(Q)$','Interpreter', 'latex')
hold off


%% ZADANIE 2
Q=1:10;
a=9;
k=2*a+3;
f=Q*k;
figure
plot(Q,f)
xlabel('Q[$\frac{dm^{3}}{h}$]', 'Interpreter', 'latex')
ylabel('f[$Hz$]','Interpreter', 'latex')
title('$f=\phi(Q)$','Interpreter', 'latex')
hold off

%% ZADANIE 3
a=9;
b=29;

Qmin = a+2;
Qmax = b+15;

x = Qmin : Qmax;
delta = Qmax * 0.01;
y =  delta ./ x * 100;

figure
plot(x,y)
hold on
xline(Qmin,'--r')
hold on
xline(Qmax,'--r')
xlabel('Q[$\frac{m^{3}}{h}$]', 'Interpreter', 'latex')
ylabel('blad względny [%]')
title('Błąd względny pomiaru strumienia objętości od wartości mierzonej')
% xlim([Qmin Qmax])
hold off