link : https://github.com/ABDhaikal/Sistem-Kendali/tree/main/Derivative%20Effect%20on%20Control%20System


sistem kendali menggunakan derevatif merupakan pengembangan sistem kembali yang dapat digunakan untuk mengurangi terjadinya osilasi
pada suatu plant. Penggunaan sistem kendali derevatif mirip dengan sistem kendali menggunakan integral dan proporsional dengan menambahkan
suatu nilai konstanta.

![alt text](https://ctms.engin.umich.edu/CTMS/Content/Introduction/Control/PID/figures/feedback_block.png)

fungsi kontrol pada sistem kendali derevatif merupakan hasil kali antara nilai konstanta derevatif dengan perubahan nilai error (Kd * s)

pada kasus digunakan 2 jenis kendali yang akan digunakan yaitu proporsional dan derevatif 

![alt text](/Derivative%20Effect%20on%20Control%20System/kd.jpg)

sehingga fungsi system control yang akan digunakan menjadi seperti berikut

    sys_c = tf([Kd Kp],[1])

pada pengujian kali ini fungsi transfer yang akan digunakan sebagai berikut 

![alt text](/Derivative%20Effect%20on%20Control%20System/fs.jpg)

sehingga 

    num = 1;
    den = [T T/16 1];
    sys = tf(num,den);

dengan menggunakan beberapa variasi konstanta derevatif yaitu 1 3 5 7 9 diharapkan dapat digunakan sebagai acuan pembanding perubahan nilai konstanta

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

 Untuk dapat melihat perbedaan respon sistem yang digunakan 
. Dapat dilakukan beberapa pengujian respon menggunakan fungsi step ramp dan impulse 

    
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

OUTPUT :


![alt text](/Derivative%20Effect%20on%20Control%20System/grph.jpg)


	Risetime	| SettlingTime | Overshoot	| Risetime	|SettlingTime 	| Overshoot |	Risetime |	SettlingTime | 	Overshoot
kd1	   | 0.4404	 | 72.351 |	640.571	10.096	74.747	   Inf |	   NaN	 |  NaN	   NaN
kd3	   | 0.1777	| 54.078 |	773.628	    | 0.6153 |	33.919	|   Inf	|   NaN	 | NaN	|  NaN
kd5	   | 0.1083	| 96.269 |	856.019	   | 0.4056	 | 23.497	 |  Inf	 | NaN	 |  NaN	  | NaN
kd7	   | 0.0778	| 136.127 |	899.807	  |  0.2997	  |   0.4773	|   Inf	   NaN	 |  NaN	 |  NaN
kd9	   | 0.0607	| 175.592 |	925.571	 |    0.2368	|     0.3902	 |   Inf	|   NaN	  | NaN	|   NaN
