syms a0 an bn t T n w
w=2*pi/T

a0 = 2/T*int(sin(n*w*t),t,0,T/2) * 2/T*int(sin(n*w*t),t,T/2,T)

an = 4/T*int(-sin(n*w*t),t,0,T/2) * 4/T*int(-sin(n*w*t),t,T/2,T)
an = simplify(an)
n=0:1:6
 

an = subs(an,sym('n'),n)
a1 = 4/T*int(sin(w*t),t,0,T/2)
