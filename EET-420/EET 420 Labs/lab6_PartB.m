A= [0 1; -20 -6]
B= [0; 1]
C= [20 0]
D= [0]

sys_ss=ss (A,B,C,D)
sys_ft=tf (sys_ss)