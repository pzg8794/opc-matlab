A=[0 1;-100 -10]
B=[0;1]
C=[0 1]
D=[0]

[num,den]=ss2tf(A,B,C,D)
sys2=tf(num,den)

num1=[0 0 100]; den1=[1 10 100];
[A,B,C,D]=tf2ss(num1,den1)
cir1=tf(num1,den1)