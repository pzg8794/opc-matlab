%Using Canny edge detection to find circles and drow a circle around them.
%Unfortunately my program does not draw a circle but a square box, so I
%also need help to draw a circle instead of a square box.

clear all
close all

%uploading image
I = imread('Auto10.jpg');
imshow(I);
G= rgb2gray(I);

%resizing image
E = imresize(G, .25);

%finding edges of the car and tresholding to find circles( the tires)
E=edge(G,'canny',[.5  .75], .3);
BW = edge(E,'canny', .6);
figure, imshow(BW)

[H, theta, rho] = hough(E);
figure, imshow(H, []);
peaks = houghpeaks(H, 50, 'Threshold', 30);

% BW is the binary image obtained by thresholding IMG
stats = regionprops(BW,'BoundingBox');
figure
hold on

imshow(I)
%drawing the square - (I need to replace this for circles instead)
for object = 1 : length(stats)
    
    %if( bb < 255)
    bb = stats(object).BoundingBox;
    rectangle('curvature',[1 1],'Position',bb,'EdgeColor','g','LineWidth',2)
    %end
    
end
hold off

%[r , c , rad] = circlefinder(E, [], [], 0.4); 