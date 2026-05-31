%Lab Number 5-3, by Piter Garcia
A=[0,1;-100,-10];
B=[0;1];
C=[100,0]
D=0;
t=0:0.0005:1;
y=step(A,B,C,D,1,t)
title=('Matrices from Homework')
subplot(2,2,1)
plot(t,y)
%Lab Number 5, Part A



A=[-10,-100;1,0];
B=[1;0];
C=[0,100]
D=0;
t=0:0.0005:1;
y=step(A,B,C,D,1,t)
x=('Matrices from MatLab')
subplot(2,2,2)
plot(t,y)
%Lab Number 5, Part A