clc
close all
clear all

%% Zadanie 1
%a
a=9;
f=500+10*a;

T=1/f;
step=T/100;


t= (0:1e-6:0.01);
tf=t*f*2*pi;
x=100e-6+sin(tf)*50e-6;

figure
plot(t*1000,x*1e6);
xlabel('t[ms]')
ylabel('x[μm]');
title('Położenie x końcówki igły w funkcji czasu');
grid on
hold off

%b
v=50e-6*f*2*pi
a=50e-6*(f*2*pi)^2


%% Zadanie 3
U0=0.5;
U1=3.5;

x0=0;
x1=15;

a = (U1-U0)/(x1-x0);
b= U1-x1*a;

x=0:0.1:20;
 
u =a*x+b;

figure
plot(x,u)
grid on
title('charakterystyki przetwarzania czujnika w zakresie od 0 do 20 mm')
xlabel('przesunięcie[mm]')
ylabel('napięcie[V]')
hold off

