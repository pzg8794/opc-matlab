A=[-5 5;0 -5]
B=[0;5]
C=[1 -1]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)



