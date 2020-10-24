clc
clear all
close all

%% A
x= [0 10 20 30 40]; 
T=[0 10 20 30 40];

R=zeros(length(x),length(T));
C=zeros(length(x),length(T));

for i=1: length(x)
  for j=1: length(T)
      [R(i,j),C(i,j)]=sensor(x(i),3*T(j));
      dRdx=8;
      dRdT=2.3;
      dCdx(i,j)=-3-0.2*x(i)+0.03*T(j);
      dCdT(i,j)=-6+0.03*x(i);
      dJ(i,j)=dRdx*dCdT(i,j)-dRdT*dCdx(i,j);
  end
end


disp('PODPUNKT A')
R1=R;
C1=C;
dJ1=dJ;

figure
surf(x,T,R1);
title('R[k\Omega]')
xlabel('x[cm]')
ylabel('T[\circC]')

figure
surf(x,T,C1);
title('C[nF]')
xlabel('x[cm]')
ylabel('T[\circC]')

figure
surf(x,T,C1);
hold on
surf(x,T,R1);
title('R[k\Omega] i C[nF]')
xlabel('x[cm]')
ylabel('T[\circC]')
hold off

figure
surf(x,T,dJ1);
title('dJ')
xlabel('x[cm]')
ylabel('T[\circC]')
hold off

%% B 
index =29;
R=220+index;
C=490-index;

xData=0:0.1: 50;
tData=0:0.1:50;

xR=(R-50-2.3*tData)/8;
xR(find(xR>0 & xR<50));

tR=(R-50-8*xData)/2.3;
tR(find(tR>0 & tR<50));

% xC=C-700+6*T

syms x T;
[x2, T2]=solve(249==50+8*x+2.3*T, 471== 700 - 3*x - 0.1 * x.^2- 6*T+0.03*x*T,[x,T]);
x2=eval(x2)
T2=eval(T2)

sensor(x2(1),T2(1))


%% C
To =25;
Tmin =0;
Tmax=50;

x=0:0.1:50;
len=length(x);
R0=zeros(len,1);
R25=zeros(len,1);
R50=zeros(len,1);

C0=zeros(len,1);
C25=zeros(len,1);
C50=zeros(len,1);

for i=1: length(x)
  [R0(i),C0(i,j)]=sensor(x(i),Tmin);
  [R25(i),C25(i,j)]=sensor(x(i),To);
  [R50(i),C50(i,j)]=sensor(x(i),Tmax);
end

figure
plot(x,R25)
ylabel('T[\circC]')
title('R w temperaturze 25')
xlabel('x[cm]');
ylabel('R[k\Omega]')
hold off

figure
plot(x,R0);
hold on
plot(x,R50)
title('R w temperaturze Tmax i Tmin')
legend('R w Tmin',' R w Tmax');
xlabel('x[cm]');
ylabel('R[k\Omega]');
hold off

figure
plot(x,C25)
title('C w temperaturze 25')
xlabel('x[cm]');
ylabel('C[nF]')
hold off

figure
plot(x,C0);
hold on
plot(x,C50)
title('C w temperaturze Tmax i Tmin')
legend('C w Tmin',' C w Tmax');
xlabel('x[cm]');
ylabel('C[nF]')


%% FUNCTIONS
function [R, C]= sensor(x,T)
    R=50+8*x+2.3*T;
    C= 700 - 3*x - 0.1 * x.^2- 6*T+0.03*x*T;
end

