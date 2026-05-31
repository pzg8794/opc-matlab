%Lab Number 5-2, by Piter Garcia

num1=[0 0 100];
den1=[1 10 100];
[A,B,C,D]=tf2ss(num1,den1)
printsys(A,B,C,D)
%Lab Number 5-2, Part A

num2=[1 0 0];
den2=[1 10 100];
[A,B,C,D]=tf2ss(num2,den2)
printsys(A,B,C,D)
%Lab Number 5-2, Part B

num3=[0 10 0];
den3=[1 10 100];
[A,B,C,D]=tf2ss(num3,den3)
printsys(A,B,C,D)
%Lab Number 5-2, Part C