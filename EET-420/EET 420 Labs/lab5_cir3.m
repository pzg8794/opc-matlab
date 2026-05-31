A=[0 1;-100 -10]
B=[0;1]
C=[10 0]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)

num1=[0 10 0]; den1=[1 10 100];
[A,B,C,D]=tf2ss(num1,den1)
printsys(A,B,C,D)
cir1=tf(num1,den1)