%Lab6 - Part C - Piter Garcia
%Part C
A= [-6 -2; 10 0]
B= [2; 0]
C= [0 1]
D= [0]
[num,denom]= ss2tf(A,B,C,D)
printsys(num,denom,'s')
AA= [0 1; -20 -6]
BB= [0; 1]
CC= [20 0]
DD= [0]
[num1,denom1]= ss2tf(A1,B1,C1,D1)
printsys(num1,denom1,'s')

num2= [0 0 20];
denom2= [1 6 20];
[Aa,Bb,Cc,Dd]= tf2ss(num2,denom2);
printsys(Aa,Bb,Cc,Dd)
t= 0:0.005:2
y = step(A,B,C,D,1,t);
title('STEP RESPONSE OF THE SYSTEM')
xlabel('TIME')
ylabel('V-OUT')
subplot(3,1,1)
plot(t,y)
grid on

y1 = step(AA,BB,CC,DD,1,t);
xlabel('Time')
ylabel('Vout')
subplot(3,1,2)
plot(t,y1)
grid on

y2 = step(Aa,Bb,Cc,Dd,1,t);
xlabel('Time')
ylabel('Vout')
subplot(3,1,3)
plot(t,y2)
grid on