%Part A for the obtained matrices
A= [-6 -2; 10 0]
B= [2; 0]
C= [0 1]
D= [0]
[num,den] = ss2tf(A,B,C,D)
printsys(num,den,'s')

%Part A for the Given  matrices
AA= [0 1; -20 -6]
BB= [0; 1]
CC= [20 0]
DD= [0]
[num1,den1] = ss2tf(AA,BB,CC,DD)
printsys(num1,den1,'s')