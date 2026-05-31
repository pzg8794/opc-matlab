%EET 327L
%DIAMELA DUVERGE E.
%LAB 1D MAGNITUDE 
clf
x= 0:.01: 10;
y= ((1./(1+x.^2)).^2+(x./(1+x.^2)).^2).^.5;
plot (x,y)

grid
ylabel ('NORMAILIZED GAIN');
title ('GAIN LPF');
