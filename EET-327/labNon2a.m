t=0:.0001:2.5;

i1= 7.5*exp(-2*t);
plot(t,i1,'--')
hold on

i2= -7.5*exp(-10*t);
plot(t,i2,'--')
hold on

i= i1+i2;
plot(t,i,'-'), grid
hold on

title('LAB #2 Part A')