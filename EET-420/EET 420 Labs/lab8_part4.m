num=[0  0 0 4000]
den=[1 48 420 4000]
CIR1=tf(num,den)
t=(0:0.001:2)
y= step(CIR1,t)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for additional pole S=-40')





