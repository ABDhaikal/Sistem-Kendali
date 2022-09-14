
    %% declaration of system variable
    s = tf('s')
    T = 1
    Kp = 1;
    Ti = 1/5;
    Ki = Kp/Ti;
    num = 1;
    den = [T T/16 1];
    sys = tf(num,den);

variable variable dalam sistem kendali terdiri atas Ti,Kp,Ki,s merupakan konstanta,gain proporsional ,gain integral ,dan dimensi ruang laplace


![alt text](https://www.controleng.com/wp-content/uploads/sites/2/2016/07/CTL1608_MAG_F1_LoopTuning_fig-1Slider.jpg)

berdasarkan fungsi PID diatas dapat dinyatakan bahwa KI = KP/Ti 

![alt text](image1.jpeg)

sehingga system control atau gain adalah : ((Kp*s)+Ki)/s
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


untuk hasil respon menggunakan impulse step dan ramp secara berurutan dengan variasi KI (1,3,5,7,9) sebagai berikut


KI= 1

![alt text](ki1.jpg)

KI= 3

![alt text](ki3.jpg)

KI= 5

![alt text](ki5.jpg)

KI= 7

![alt text](ki7.jpg)

KI= 9

![alt text](ki9.jpg)