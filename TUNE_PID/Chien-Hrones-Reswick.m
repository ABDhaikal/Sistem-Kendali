%%%Chien-Hrones-Reswick Autotuning Method



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
sys = tf(num,den)

%%declaration tunning variable
use_p = 1;
use_i = 1;
use_d = 1;


death_t = 100;
constant_t = 10;


kp = 0;
Ti = inf;
Td = 0;


%% ZN1 
if(use_p)
    if(use_i)
        if(use_d)
            kp = 0.95*constant_t/death_t;
            Ti = 2.4*death_t;
            Td = 0.42*death_t;
        else
            kp = 0.6*constant_t/death_t;
            Ti = 4*death_t;
            Td = 0
        end
    else 
        kp = 0.3*constant_t/death_t;
        Ti = inf;
        Td = 0
    end
end

kp = kp;
ki = kp/Ti;
kd = kp*Td;

%% system control function
sys_c = tf([kd,kp,ki],[1 0])

complate = feedback(sys*sys_c,1)

%%display graph

figure(1)
step(complate); 
legend('step kd(1)')
stepinfo(complate)

