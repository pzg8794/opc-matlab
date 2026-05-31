
n=[0 0 80]
d=[100 1]
w= logspace(-2, 2, 400);
g= freqs(n, d, w);
magnitude= 20 * log10(abs(g));
subplot(2,2,1)
semilog(w, magnitude); grid