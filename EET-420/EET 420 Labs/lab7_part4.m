A=[-5 5;0 -5]
B=[0;5]
C=[1 -1]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)
t=(0:0.01:10)
y=step(A,B,C,D,1,t)
subplot(2,1,1)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title('Preparation State Matrices From Part B')






