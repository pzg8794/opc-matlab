clc

[x,y] = meshgrid(-3:1/8:3);
z = peaks(x,y);
surfl(x,y,z);
shading interp
colormap(gray);
axis([-3,3,-3,3,-8,8])

view([10 10])
grid on
hold on
surfl(peaks)
shading interp
colormap copper
hold off

y = [75.995 91.972 105.711 123.203 131.669 ...
     150.697 179.323 203.212 226.505 249.633 281.422];
figure; barh(y);

figure; barh(y,0.4);

figure;
subplot(2,2,1); barh(y,'grouped');
subplot(2,2,2); barh(y,'stacked');
subplot(2,2,3); barh(y,'hist');
subplot(2,2,4); barh(y,'histc');

figure; barh(y,'r');

figure; barh(y,'g','EdgeColor',[1 0.5 0.5]);
x = [1900:10:2000];
figure; barh(x,y);

x = [1900:10:2000];
figure; barh(x,y);
set(gca,'YLim',[1 max(y)]);

figure,
a = -2.9:0.2:2.9;
barh(a,exp(-a.*a),'r')

load count.dat;
yMat = count(1:6,:);
figure; barh(yMat);

figure,
hMulti = barh(yMat);
set(hMulti,'LineWidth', 2, 'LineStyle',':');

figure,
Y = randn(3,5);
h = barh(Y);
set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
colormap summer % Change the color scheme
