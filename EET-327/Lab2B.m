
t=0:.0001:2.5;



i1= 15*exp(-2*t);
plot(t,i1,'--')
hold on

i2= -15*exp(-2*t);
plot(t,i2,'--')
hold on

i= i1.*sin(8*t);
plot(t,i,'-')
hold on


grid
title('LAB #2 Part B')