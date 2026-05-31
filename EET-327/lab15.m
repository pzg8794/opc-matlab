syms v1 v2 r1 r2 c s
eqn1= '(v1- v2)/r1= v2/r2 + v2*c*s';
v2= solve(eqn1,'v2')
pretty(v2/v1)

eqn1= '(v1- v2)/5000= v2/20000 + v2*0.0000025*s';
v2= solve(eqn1,'v2')
pretty(v2/v1)