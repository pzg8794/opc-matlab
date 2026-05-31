%Piter Garacia
%Lab 8-PART-III EET-420

%Part I:

num=[0 0 100];
den=[1 8 100];
CIR1=tf(num,den)
t=(0:0.001:5)
y= step(CIR1,t)
subplot(1,4,1)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response,(100/s^2+8s+100)')


%PART IV

num=[0 1000 0]
den=[1 18 180 1000]
CIR1=tf(num,den)
t=(0:0.001:2)
y= step(CIR1,t)
subplot(1,4,2)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response, pole S=-10')


%PART V

num=[0  0 0 4000]
den=[1 48 420 4000]
CIR1=tf(num,den)
t=(0:0.001:2)
y= step(CIR1,t)
subplot(1,4,3)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response, pole S=-40')