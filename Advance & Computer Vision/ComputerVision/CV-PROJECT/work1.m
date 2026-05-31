clc
close all
clear all

%uploading picture
im=imread('Auto10.jpg');
imSm = imresize(im,1);
figure,imshow(imSm);

%converting to a gray scale
imSmGray = rgb2gray(imSm);
imSmGray = im2double(imSmGray);

%displaying gray scale pictures
figure, imshow(imSmGray)
figure, imshow(im2bw(imSmGray,graythresh(imSmGray)))

%using maximum and minimum values
maxi=max(imSmGray(:))
mini=min(imSmGray(:))
figure, imhist(imSmGray)

%displaying image in red, green, blue pixels level.
figure, subplot(2,3,1),imshow(imSm(:,:,1)),title('Red')
subplot(2,3,2),imshow(imSm(:,:,2)),title('Green')
subplot(2,3,3),imshow(imSm(:,:,3)),title('Blue')

%tresholoding privous images.
subplot(2,3,4),imshow(im2bw(imSm(:,:,1),graythresh(imSm(:,:,1))))
title('Red Threshold')
subplot(2,3,5),imshow(im2bw(imSm(:,:,2),graythresh(imSm(:,:,2))))
title('Green Threshold')
subplot(2,3,6),imshow(im2bw(imSm(:,:,3),graythresh(imSm(:,:,3))))
title('Blue Threshold')

%using hsv function.
imH = rgb2hsv(imSm);
figure, imshow(imH)

%displaying result
figure, subplot(1,3,1),imshow(imH(:,:,1)),title('Hue')
subplot(1,3,2),imshow(imH(:,:,2)),title('Saturation')
subplot(1,3,3),imshow(imH(:,:,3)),title('Value')

%displaying histogram of Hue
figure,imhist(imH(:,:,1));
level = graythresh(imH(:,:,2)); % using best edged picture to draw box
imshow(imH(:,:,1)>level);

% BW is the binary image obtained by thresholding IMG
stats = regionprops((imH(:,:,2)>level),'BoundingBox');
figure
% hold on
% for object = 1 : length(stats)
% 
%     bb = stats(object).BoundingBox;
%     rectangle('Position',bb,'EdgeColor','g','LineWidth',3)
%     
% end
% hold off

imshow(imSm);
G= rgb2gray(im);
%resizing image
E = imresize(G, .25);

%finding edges of the car and tresholding to find circles( the tires)
E=edge(G,'canny',[.5  .75], .3);
BW = edge(E,'canny', .7);
figure, imshow(BW)

[H, theta, rho] = hough(E);
figure, imshow(H, []);
peaks = houghpeaks(H, 50, 'Threshold', 30);

% BW is the binary image obtained by thresholding IMG
stats1 = regionprops(BW,'BoundingBox');
figure
%hold on
imshow(im)
hold on
%drawing box
for object = 1 : length(stats)
    %if(bb(1) < 70)
    bb = stats(object).BoundingBox;    
    rectangle('Position',bb,'EdgeColor','g','LineWidth',2)
    %end
    
end

for object1 = 1 : length(stats1)
%if( bb < 255)
    bb = stats1(object1).BoundingBox;
    rectangle('curvature',[1 1],'Position',bb,'EdgeColor','r','LineWidth',2)
    %end
end
hold off

