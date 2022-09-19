
%% declaration of system variable
s = tf('s')
T = 1
Kp = 1;
Kd = 1;
num = 1;
den = [T T/16 1];
sys = tf(num,den);

%% system control function
sys_c = tf([Kd Kp],[1])
sys_c1 = tf([3 Kp],[1])
sys_c2 = tf([5 Kp],[1])
sys_c3 = tf([7 Kp],[1])
sys_c4 = tf([9 Kp],[1])

%% output plant function
complete = feedback(sys*sys_c,1)
complete1 = feedback(sys*sys_c1,1)
complete2 = feedback(sys*sys_c2,1)
complete3 = feedback(sys*sys_c3,1)
complete4 = feedback(sys*sys_c4,1)

%%  timestamp ramp
t = (0:0.1:10)';

%%  plot graph
figure
subplot(231), step(complete,complete*s); 
legend('step kd(1)','impulse kd(1)')
subplot(232), step(complete1,complete1*s);
legend('step kd(3)','impulse kd(3)')
subplot(233), step(complete2,complete2*s);
legend('step kd(5)','impulse kd(5)')
subplot(234), step(complete3,complete3*s);
legend('step kd(7)','impulse kd(7)')
subplot(235), step(complete4,complete4*s);  
legend('step kd(7)','impulse kd(7)')
subplot(236), step(complete/s,complete1/s,complete2/s,complete3/s,complete4/s,t); 
legend('ramp kd(1)','ramp kd(3)','ramp kd(5)','ramp kd(7)','ramp kd(9)')

%% characteristic graph
subj = complete

fprintf('step\n')
Risetime = stepinfo(subj).RiseTime
SettlingTime = stepinfo(subj).SettlingTime
Overshoot = stepinfo(subj).Overshoot

fprintf('impulse\n')
Risetime = stepinfo(subj*s).RiseTime
SettlingTime = stepinfo(subj*s).SettlingTime
Overshoot = stepinfo(subj*s).Overshoot

fprintf('ramp\n')
Risetime = stepinfo(subj/s).RiseTime
SettlingTime = stepinfo(subj/s).SettlingTime
Overshoot = stepinfo(subj/s).Overshoot