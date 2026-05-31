clf
x= 0:0.1:10
Phase1= atan(-x) - atan(x)*180./pi;
Phase2= atan(1./x) - atan(1./-x)*180./pi;
semilogx(x, Phase1, x, Phase2); grid
title('PHASE RESPONSE')
ylabel('PHASE SHIFT IN DEGREES')
xlabel('Normalized Frequency (f/f0)')