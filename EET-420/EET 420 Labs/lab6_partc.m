A=[-6 -2;10 0]
B=[2;0]
C=[0 1]
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

E=[0 1;-20 -6]
F=[1;0]
G=[20 0]
H=[0]

[num1,den1]=ss2tf(E,F,G,H)
CIR2=tf(num1,den1)
t=(0:0.01:10)
y=step(E,F,G,H,1,t)
subplot(2,1,2)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title('Preparation State Matrices From Part C')


