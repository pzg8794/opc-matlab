%EET 327L
%DIAMELA DUVERGE E.
%LAB 1E
clf
x= 0:.01: 10;
y= -atan(x)*(180/pi);
plot (x,y)
axis ([0,10, -90,0])
grid
ylabel ('PHASESHIFT (IN DEGREES)');
title ('PHASE ANGLE OF LPF');
