w=logspace(1, 6,100000);  
r1=20000;
r2=5000;
c=0.00000025;
rp=(r1*r1)./(r1+r2);
w1=1./(c*r1);
wp=1./(c*rp);
Magnitude= 20*log10((r2./(r1+r2))*(sqrt(1 + (w1./w).^2)./sqrt(1 +(wp./w).^2)));
semilogx(w, Magnitude), grid