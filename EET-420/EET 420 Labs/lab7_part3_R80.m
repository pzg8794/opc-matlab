A=[-1.25 1.25;0 -1.25]
B=[0;1.25]
C=[1 -1]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)



