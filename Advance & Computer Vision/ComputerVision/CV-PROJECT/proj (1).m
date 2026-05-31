%This code takes the image, converts to a gray scale and then find its
%edges to drwo a box around its shape. 

%I am using this techniques but you are open to use any other techniques
%the more strange the better, just make sure you explain me what you are
%doing and why.

%uploading picture
im=imread('Auto10.jpg');
imSm = imresize(im, .25);
figure,imshow(imSm);

%converting to a gray scale
imSmGray = rgb2gray(imSm);
imSmGray = im2double(imSmGray);

%displaying gray scale pictures
figure, imshow(imSmGray)
figure, imshow(im2bw(imSmGray,graythresh(imSmGray)))

%using maximum and minimum values
max(imSmGray(:))
min(imSmGray(:))
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
stats = regionprops((imH(:,:,2)>level),'BoundingBox');
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

    if(bb < 55)
    bb = stats(object).BoundingBox;
    rectangle('Position',bb,'EdgeColor','g','LineWidth',3)
   end
    
end
hold off