clf
f= logspace(0, 5, 40);
Magnitude= 0-atan(2*(5555./(2*pi*f))./(1-(5555./(2*pi*f))).^2)*180./pi;
semilogx(f, Magnitude); grid
title('Phase Angle in Degrees of an Audio Amplifier')