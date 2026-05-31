A=[0 1;-20 -6]
B=[0;1]
C=[20 0]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)

A=[-6 -2;10 0]
B=[2;0]
C=[0 10]
D=[0]

[num1,den1]=ss2tf(A,B,C,D)
CIR1=tf(num1,den1)

num1=[0 0 20]; den1=[1 6 20];
[A,B,C,D]=tf2ss(num1,den1)
printsys(A,B,C,D)
cir1=tf(num1,den1)

