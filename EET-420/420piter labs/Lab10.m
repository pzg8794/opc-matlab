%Piter Garacia
%Lab 10 EET-420

%Part I
num=[0 15.4];
den=[1 4.7 15.4];
CIR1=tf(num,den)
t=(0:0.01:5)
y= step(CIR1,t)
subplot(2,1,1)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response')

%Part II
num=[2.6 15.4];
den=[1 4.7 15.4];
CIR1=tf(num,den)
t=(0:0.01:5)
y= step(CIR1,t)
subplot(2,1,2)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response with zero = -5.9')