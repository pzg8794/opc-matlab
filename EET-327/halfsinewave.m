syms a0 an bn t T n w
w=2*pi/T
 
a0 = 1/T*int (sin(w*t)*cos(n*w*t),t,0,T/2)

an = 2/T*int(sin(w*t)*cos(n*w*t),0,T/2)
 
bn = 2/T*int(sin(w*t)*sin(n*w*t),t,0,T/2)
 
pretty(bn)

n=1:1:6

an = subs(an,sym('n'),n)

a1 = 2/T*int(sin(w*t)*cos(w*t),t,0,T/2)
 
bn = subs(bn, sym('n'),n)

b1 = 2/T*int(sin(w*t)*sin(w*t),t,0,T/2)