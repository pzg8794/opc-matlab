clf
f= logspace(0, 6, 40);
Magnitude= 20*log10(1./sqrt((1+(5555./(2*pi*f))).^4 + 2*(5555./(2*pi*f)).^2));
Magnitude2= 20*log10(1./sqrt(1+((5555)./(2*pi*f)).^2));
Magnitude3= 20*log10(1./sqrt((1-(5555./(2*pi*f))).^4 + 2*(5555./(2*pi*f)).^2));
semilogx(f, Magnitude, f, Magnitude2, f, Magnitude3); grid
title('MAGNITUDE GRAPHS OF 1st and 2nd ORDER H.P FILTERS')