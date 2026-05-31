%Piter Garacia
%Lab 9 EET-420

%Part II:

num=[0 0 25];
den=[1 6 25];
CIR1=tf(num,den)
t=(0:0.01:3)
y= step(CIR1,t)
subplot(2,4,1)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for (25/s^2+6s+25)')


%Part II:


num=[0 25 75];
den=[3 18 75];
CIR1=tf(num,den)
t=(0:0.01:3)
y= step(CIR1,t)
subplot(2,4,2)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for z=3')

%Part II:


num=[0 25 75];
den=[3 18 75];
CIR1=tf(num,den)
t=(0:0.01:3)
y= step(CIR1,t)
subplot(2,4,3)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for z=3')

%Part 4:

num=[0 150 150];
den=[3 36 183 450];
CIR1=tf(num,den)
t=(0:0.01:3)
y= step(CIR1,t)
subplot(2,4,4)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for p=6,z=3')

num=[0 150 2250];
den=[15 240 915 2250];
CIR1=tf(num,den)
t=(0:0.01:3)
y= step(CIR1,t)
subplot(2,4,5)
plot(t,y)
ylabel('y(t)')
xlabel('Time(s)'),grid
title(' Unit Step Response for p=6,z=15')


