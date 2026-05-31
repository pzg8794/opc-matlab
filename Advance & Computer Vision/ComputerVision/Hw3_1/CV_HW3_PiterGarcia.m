%10/02/2012
%Piter Garcia
%Homework Number 3

box = imread('Auto2.jpg');
ML  = imread('Auto10.jpg');
PO  = imread('Auto2.jpg');
OF  = imread('Auto10.jpg');

screen_size = get(0, 'ScreenSize');

f1 = figure(1);
set(f1, 'Position', [0 0 screen_size(4) screen_size(4) ] );
subplot(2, 2, 1), imshow(box), title('Box');
subplot(2, 2, 2), imshow(ML), title('MauiLab');
subplot(2, 2, 3), imshow(PO), title('PatternOne');
subplot(2, 2, 4), imshow(OF), title('OrangeFlower');

for x=1:4,
    
    if x==1
      Jg = rgb2gray(box);
    end;
  
    if x==2
     Jg = rgb2gray(ML);
    end;
    if x==3
      Jg = rgb2gray(PO);
    end;
    if x==4
      Jg = rgb2gray(OF);
    end;   
  

Jg = im2double(Jg);
Jg = imresize(Jg, .25);
figure, imshow(Jg);title('Resized and Rgb2Gray');

f = fspecial('sobel');
imEdge = imfilter(Jg, f );
figure, imshow(imEdge,[]);title('fspecial and filtered - Horizontal Edge');


max(imEdge(:))
min(imEdge(:))


figure,
for i=1:4,
 subplot(2, 2, i),imshow(imEdge,i);
end;
suptitle('Thresholding Horizontal Edges with Sigma from 1-4');

figure, imshow(abs(imEdge),[]);title('Absolute value of Horizontal Edge');
%figure, imshow(imEdge>.5);
%figure, hist(abs(imEdge(:)),100);
%

fv=f';
imEdgeV = imfilter(Jg, fv );
figure, imshow(imEdgeV,[]);title('fspecial and filtered - Vertical Edge');

figure, 
for i=1:4,
 subplot(2, 2, i),imshow(imEdgeV,5);
end;
suptitle('Thresholding Vertical Edges with Sigma from 1-4');

figure, imshow(abs(imEdgeV),[]);title('Absolute value of Vertical Edge');
%figure, hist(abs(imEdgeV(:)),100);
%figure, imshow(imEdgeV>.5);

max(fv(:));
min(fv(:));

figure,
for i=1:4,
 t=edge(Jg,'log',[ ],i);
 subplot(2, 2, i),imshow(t);
end;
suptitle(' Laplacian of Gaussian filtered Image');

figure,
for i=1:4,
 t=edge(Jg,'canny',[ ],i);
 subplot(2, 2, i),imshow(t);
end;
suptitle('Canny filtered Image');
end;
