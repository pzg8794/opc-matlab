
figure,
Y = [30388.*exp(0) 46934.*exp(0) 36462.*exp(0)
     50342.*exp(0) 42069.*exp(0) 47305.*exp(0)
     0.000.*exp(014) 0.000.*exp(014) 1.181.*exp(014)
     0.016.*exp(014) 0.038.*exp(014) 8.415.*exp(014)
     1.449.*exp(004) 2.036.*exp(004) 1.454.*exp(004)
     0.014.*exp(016) 0.023.*exp(016) 8.409.*exp(016)];
bar(Y)
colormap summer
grid on
title('Comparing Coast Classes'); 

figure,
Y = [30388.*exp(0) 46934.*exp(0) 36462.*exp(0)
     50342.*exp(0) 42069.*exp(0) 47305.*exp(0)
     0.000.*exp(014) 0.000.*exp(014) 1.181.*exp(014)
     0.016.*exp(014) 0.038.*exp(014) 8.415.*exp(014)
     1.449.*exp(004) 2.036.*exp(004) 1.454.*exp(004)
     0.014.*exp(016) 0.023.*exp(016) 8.409.*exp(016)];
bar(Y)
colormap summer
grid on
title('Comparing Coast Classes'); 


figure,
bar3(Y)
title('Comparing Coast Classes'); 


figure,
xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')
set(gca,'XTick',[1 2 3])
bar3(Y,'group')
title('Comparing Coast Classes'); 

figure,
Y = [30388.*exp(0) 46934.*exp(0) 36462.*exp(0)
     50342.*exp(0) 42069.*exp(0) 47305.*exp(0)
     0.000.*exp(014) 0.000.*exp(014) 1.181.*exp(014)
     0.016.*exp(014) 0.038.*exp(014) 8.415.*exp(014)
     1.449.*exp(004) 2.036.*exp(004) 1.454.*exp(004)
     0.014.*exp(016) 0.023.*exp(016) 8.409.*exp(016)];
harea = area(Y) 
 % This returns handles to three hggroups (areaseries objects)
grid on 
title('Comparing Coast Classes'); 


rgbhist(rgb2lst(im2double(imread('coast_n203030.jpg'))), true);
title('Comparing Coast Classes');  

bar3(rgbhist(rgb2lst(im2double(imread('coast_n203030.jpg'))), true));
title('Comparing Coast Classes');  