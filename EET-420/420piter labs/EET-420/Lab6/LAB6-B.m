%Lab6 - Part B - Piter Garcia
%Part A for the obtained matrices
%Part B
[num]= [0 0 20];
[denom]= [1 6 20];
[A,B,C,D]= tf2ss(num,denom)
printsys(A,B,C,D)