clf
f= logspace(0, 6, 40);
Phase1= 0-atan(2*(5555./(2*pi*f))./(1-(5555./(2*pi*f))).^2)*180./pi;
Phase2= 0-atan(5555./(2*pi*f))*180./pi;
Phase3= 0-atan(2*(5555./(2*pi*f))./(1+(5555./(2*pi*f))).^2)*180./pi;
semilogx(f, Phase1, f, Phase2, f, Phase3); grid
title('Phase Angle in Degrees of an Audio Amplifier')