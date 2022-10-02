%%%TL



%% declaration of system variable
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');

%% declaration system
num = K;
den = [J*L,((b*L)+(J*R)),((b*R)+(K*K))];
sys = tf(num,den)/s

%%declaration tunning variable
use_p = 1; 
use_i = 1;
use_d = 0;


kcr = 120.12 ;
pcr =  1.4 ; 


%% ZN1 
if(use_d)
    kp = kcr/2.2
    ti = 2.2*pcr
    td = pcr/6.3

else
    kp = kcr/3.2;
    ti = 2.2*pcr;
    td = 0 ;    
end

kp = kp
kd = kp*td
ki = kp/ti

% 
% kp = kcr
% kd = 0
% ki = 0

%% system control function
sys_c = tf([kd,kp,ki],[1 0]);


plant =sys*sys_c
complate = feedback(plant,1)


%pcr

%%display graph

figure(1)
step(complate); 
stepinfo(complate)