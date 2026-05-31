clf
f= logspace(0, 5, 40);
Magnitude= 20 * log10(100./sqrt((1+(3./500)).^2 + ((f.^2 - 150000)./(5000*f)).^2));
semilogx(f, Magnitude); grid
title('Magnitude in dbs of an Audio Amplifier')