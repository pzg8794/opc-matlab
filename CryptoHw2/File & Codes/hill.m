% The logic behind this is to get digrams, trigrams of letters.
% 
% for hill cipher 
%             y=x*m;
%             where x are the alphabets and m is the matrix
% now to get m when we have y and x we take the inverse of x and multiply it 
% with y
%             x^-1 * y = m
%             
% to get x^-1 we need to take multiple values to solve the equations for eg.
% 
% x2=[1 17] x3 = [ 1 17 4] x4=[ 1 17  4 0]
%    [4  0]      [ 0 19 7]    [19  7 19 0]
%                [19 0 10]    [10  8 13 6]
%                             [..........] this cannot be completed as we 
%                                             don't have enough plaintext
% we take inverse of x2 x3 using inv() function of matlab and multiply it with
% y to get m (here m is represented as z) when we multiply x and z again we
% get the ciphertext

x=[1 17 4 0 19 7 19 0 10 8 13 6];
y=[17 20 15 14 19 4 13 19 14 8 5 21];

m=[2 4;5 1];
z=[0 0 0 0 0 0 0 0 0 0 0 0];

x2=[1 17;4 0]
y2=[17 20;15 14];

x3=[1 17 4; 0 19 7;19 0 10];
y3=[17 20 15; 14 19 4;13 19 14];

z2=inv(x2)*y2
z3=inv(x3)*y3

letters(x2*z2);
letters(x3*z3);


% Doubtful about it.
x4=[1 17 4 0;19 7 19 0;10 8 13 6;3 2 3 3];
y4=[17 20 15 14;19 4 13 19;14 8 5 21;15 16 13 15];

z4=inv(x4)*y4

letters(x4*z4);

b1=[1 17 4 0];
b2=[19 7 19 0];
b3=[10 8 13 6];

a1=[1 17 4];
a2=[0 19 7];
a3=[19 0 10];
a4=[8 13 6];

letters(b1*z4);
letters(b2*z4);
letters(b3*z4);


% Best answer
letters(a1*z3);
letters(a2*z3);
letters(a3*z3);
letters(a4*z3);

c1=[1 17];
c2=[4 0];
c3=[19 7];
c4=[19 0];
c5=[10 8];
c6=[13 6];

letters(c1*z2);
letters(c2*z2);
letters(c3*z2);
letters(c4*z2);
letters(c5*z2);
letters(c6*z2);