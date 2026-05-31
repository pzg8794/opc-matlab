syms v1 v2 r1 r2 c s
eqn1= '(v1- v2)/((r1*(1/(c*s)))/(r1+(1/(c*s))))= v2/r2';
v2= solve(eqn1,'v2')
pretty(v2/v1)

