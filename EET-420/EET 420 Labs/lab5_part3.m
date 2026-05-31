A=[0 1;-100 -10]
B=[0;1]
C=[100 0]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)
t=(0:0.01:10)
y=step(A,B,C,D,1,t)
subplot(2,1,1)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title('Preparation State Matrices')

num1=[0 0 100];den1=[1 10 100];
[A,B,C,D]=tf2ss(num1,den1)
t1=(0:0.01:10)
y1=step(A,B,C,D,1,t)
subplot(2,1,2)
plot(t1,y1)
ylabel('y(t)')
xlabel('Time(s)'),grid
title('Mathlab State Matrices')

