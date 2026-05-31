w=logspace(1, 6,100000);  
r1=20000;
r2=5000;
c=0.00000025;
rp=(r1*r1)./(r1+r2);
w1=1./(c*r1);
wp=1./(c*rp);
Phase= (atan(w./w1) - atan(w./wp))*180./pi;
semilogx(w, Phase), grid