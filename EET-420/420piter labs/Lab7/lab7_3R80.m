%Part III @ R1=20 and R2= 80 ohms
A=[-1.25 1.25;3.75 -1.25]
B=[0;5]
C=[1 -1]
D=[0]

[num,den]=ss2tf(A,B,C,D)
CIR1=tf(num,den)



