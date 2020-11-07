clc
clear all
close all

%% B
Kelvin= 273.15;

% 820R
T0 = 65 + Kelvin;   %[K]
RTo=0.2;            %[kOm]
T1 = 25  + Kelvin;  %[K]
RT1 = 0.9           %[kOm]

B820=bParam(T0,RTo,T1, RT1);
A820=aParam(RTo, T0,B820);

%NTC-213
T0 = 50 + Kelvin;   %[K]
RTo=8;            %[kOm]
T1 =  62.5 + Kelvin;  %[K]
RT1 = 5           %[kOm]

BNTC=bParam(T0,RTo,T1, RT1);
ANTC=aParam(RTo, T0,BNTC);


% czułość
a=9;
T=30+2*a;

r820Tdown=0.375;
r820T=0.36;
r820Tup=0.35;
relativeSensivity820=100*[(r820Tdown-r820T)/r820T,(r820Tup-r820T)/r820T];
absoluteSensivity820=[(r820Tdown-r820T),(r820Tup-r820T)];


rNTCTdown=8.9;
rNTCT=8.6;
rNTCTup=8.4;
relativeSensivityNTC=100*[(rNTCTdown-rNTCT)/rNTCT,(rNTCTup-rNTCT)/rNTCT];
absoluteSensivityNTC=[(rNTCTdown-rNTCT),(rNTCTup-rNTCT)];

rITETdown=1.135;
rITET=1.14;
rITETup=1.145;
relativeSensivityITE=100*[(rITETdown-rITET)/rITET,(rITETup-rITET)/rITET];
absoluteSensivityITE=[(rITETdown-rITET),(rITETup-rITET)];

%% 3
dTmax =0.1 
K=0.02
Kwater=0.6
Rt=900
Ipmax =sqrt(dTmax*K/Rt)
IpmaxWater=sqrt(dTmax*Kwater/Rt)


function  [B]=bParam(T0,RTo,T1, RT1)
    B=T1*T0/(T1-T0)*log(RTo/RT1);
end

function[A]= aParam(RT,T,B)
    A=RT/exp(B/T);
end