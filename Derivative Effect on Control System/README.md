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