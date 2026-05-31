
%EET 327L
%DIAMELA DUVERGE E.
%LAB 1A plot [sin(x)]/x
clf
x= -10 :.01: 10;
y= sin(x)./x;
plot (x,y)
hold on
plot ([-10,10],[0,0],[0,0],[-0.4,1])
hold on
grid
ylabel ('[sin(x)]/x');
title ('MAGNITUDE [sin(x)]/x');
