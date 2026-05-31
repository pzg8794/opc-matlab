X= 0.5:pi./200:1.5;

for Q=5:5:15;

y= -atan(Q.*(X-(1./X))).*(180./pi);

plot(X,y)
hold on

plot([0.5 1.5],[0 0])
hold on

plot([1 1],[-90 90])
hold on
end;

grid
axis ([0.5,1.5 -90, 90])
