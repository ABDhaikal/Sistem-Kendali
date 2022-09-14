
%% declaration of system variable
s = tf('s')
T = 1
Kp = 1;
Ti = 1/5;
Ki = Kp/Ti;
Ki = 3 %manual input gain integral
num = 1;
den = [T T/16 1];
sys = tf(num,den);

%% system control function
sys_c = tf([Kp Ki],[1 0])


%% output plant function
complete = feedback(sys*sys_c,1)

figure
subplot(311), step(complete*s);   % Impulse reponse
stepinfo(complete*s)
subplot(312), step(complete);      % Step Response
stepinfo(complete)
subplot(313), step(complete / s);  % Ramp response 
stepinfo(complete/s)