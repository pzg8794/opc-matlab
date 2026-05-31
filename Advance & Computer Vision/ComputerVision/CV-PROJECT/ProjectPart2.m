clc
clear all
close all

%uploading picture
im=imread('Auto10.jpg');
imSm = imresize(im, 1);
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
level = graythresh(imH(:,:,3)); % using best edged picture to draw box
imshow(imH(:,:,1)>level);

% BW is the binary image obtained by thresholding IMG
stats = regionprops((imH(:,:,1)>level),'BoundingBox');
figure
hold on
for object = 1 : length(stats)

    bb = stats(object).BoundingBox;
    rectangle('Position',bb,'EdgeColor','g','LineWidth',3)
    
end
hold off

imshow(imSm);


%drawing box
for object = 1 : length(stats)
    bb(object,:) = stats(object,:).BoundingBox;
    if(bb(object,1) > 55) & (bb(object,1) < 105)
      if(bb(object,2) > 85) & (bb(object,2) < 135)  
    rectangle('Position',[bb(object,1)-80 bb(object,1)  270 100],'EdgeColor','g','LineWidth',2)
    break
      end
    end
    
end
%hold off
I=im
G= rgb2gray(I);

%resizing image
E = imresize(G, .25);

%finding edges of the car and tresholding to find circles( the tires)
E=edge(G,'canny',[.2 .75], .1);
BW = edge(E,'canny', .92);
%figure, imshow(BW)

[H, theta, rho] = hough(E);
%figure, imshow(H, []);
peaks = houghpeaks(H, 50, 'Threshold', 30);

% BW is the binary image obtained by thresholding IMG
stats = regionprops(BW,'BoundingBox');

for object = 1 : length(stats)
    bb1 = stats(object,:).BoundingBox;    
    %if( bb(object,2)>100)
        
%    bb(object,1) = stats(object,:).BoundingBox;
    rectangle('curvature',[1 1],'Position',bb1,'EdgeColor','r','LineWidth',2)
    %count=count+1
        
    %nd
    
end
hold off
