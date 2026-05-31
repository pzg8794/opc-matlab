num=[0 150 450];
den=[1 24 183 450];
CIR1=tf(num,den)
t=(0:0.01:3)
y= step(CIR1,t)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for p=6')

