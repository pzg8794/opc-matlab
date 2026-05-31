%EET 327L
%DIAMELA DUVERGE E.
%LAB 1c plot |sin(x)/x|
clf
x= -10 :.02: 10;
y= 20*log10(abs(sin(x)./x));
plot (x,y)
hold on
plot ([-10,10],[0,0],[0,0],[-30,0])
axis ([-10,10, -30,0])
hold on

grid
ylabel ('|sin(x)/x|');
title ('MAGNITUDE |sin(x)/x|');
