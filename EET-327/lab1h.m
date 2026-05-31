t= 0:0.000001:.002;
w=(2*pi)*1000;

v1=4*sin(w.*t);
plot(t,v1)
hold on

v2=3*sin(w.*t-(pi/2));
plot(t,v2)
hold on

v3= v2+v1;
plot(t, v3)
hold on

plot([0 0.002],[0 0])
hold on
end;

grid
axis ([0, 0.002  -5, 5])
