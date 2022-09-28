https://github.com/ABDhaikal/Sistem-Kendali/tree/main/ziglerN
deklarasi system terdiri atas variabel variable motor DC

    %% declaration of system variable
    J = 0.01;
    b = 0.1;
    K = 0.01;
    R = 1;
    L = 0.5;
    s = tf('s');


langkah selanjutnya ditentukan delay time dan time constant 

    delay_t = 1;
    constant_t = 10;

lalu setelah ditentukan time delay dan time constan langkah selanjutnya tinggal menentukan nilai kp ti dan td berdasarkan tabel zigler nichols 1

    %% ZN1 
    if(use_p)
        if(use_i)
            if(use_d)
                %pakai pid
                kp = constant_t/delay_t*1.2;
                Ti = delay_t*2;
                Td = 0.5*delay_t;
            else
                % cuma pakai P sama i
                kp = constant_t/delay_t*0.9;
                Ti = delay_t/0.3;
                Td = 0
            end
        else 
            %cuma p doang
            kp = delay_t/constant_t;
            Ti = inf;
            Td = 0
        end
    end


setelah ditentuakn nilai kp ti td maka dapat diperoleh nilai kp ki kd bedasarkan kp ti td

    % memasukan gain berdasarkan tunning
    kp = kp
    ki = kp/Ti
    kd = kp*Td


![alt text](/Derivative%20Effect%20on%20Control%20System/outputzn.jpg)