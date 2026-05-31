
%Part V
num1=[0 -5 0];
den1=[1 10 25];
CIR2=tf(num1,den1)
t=(0:0.01:10)
y=step(A,B,C,D,1,t)
subplot(2,1,1)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title('Unit Step Response From Transfer Function')


A=[-1.25 1.25;3.75 -1.25]
B=[0;5]
C=[1 -1]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)
t=(0:0.01:10)
y=step(A,B,C,D,1,t)
subplot(2,1,2)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title('Unit Step Response From State Matrices')


