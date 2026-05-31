%Lab Number 5, by Piter Garcia


A=[0,1;-100,-10];
B=[0;1];
C=[100,0]
D=0;
[num,den]=ss2tf(A,B,C,D);
printsys(num,den,'s');
%Lab Number 5, Part A


A=[0,1;-100,-10];
B=[0;1];
C=[-100,-10]
D=1;
[num1,den1]=ss2tf(A,B,C,D);
printsys(num1,den1,'s');
%Lab Number 5, Part B


A=[0,1;-100,-10];
B=[0;1];
C=[0,10]
D=0;
[num2,den2]=ss2tf(A,B,C,D);
printsys(num2,den2,'s');
%Lab Number 5, Part c