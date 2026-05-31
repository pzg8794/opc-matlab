clf
f= logspace(0, 5, 40);
Magnitude= 20 * log10(100./sqrt((1+(3./500)).^2 + ((f.^2 - 150000)./(5000*f)).^2));
subplot(2,1,1)
semilogx(f, Magnitude); grid
title('Magnitude in dbs of an Audio Amplifier')

PhaseAngle= 0-atan(((f.^2-150000)./(5000*f))./(1+(3./500)))*180./pi;
subplot(2,1,2)
semilogx(f, PhaseAngle); grid
title('Phase Angle in Degrees of an Audio Amplifier')