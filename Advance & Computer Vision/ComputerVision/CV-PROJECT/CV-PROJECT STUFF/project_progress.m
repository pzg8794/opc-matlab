
im=imread('Auto2.jpg');
I = rgb2gray(im);
BW1 = edge(I,'sobel', .2);
BW2 = edge(I,'canny', .2);
figure, imshow(BW1<.1)
figure, imshow(BW2>.6)

BW3 =(BW1>.1);

BW = im2bw(I);
figure, imshow(BW)
dim = size(BW);
col = round(dim(2)/2)-90;
row = find(BW(:,col), 1 );
boundary = bwtraceboundary(BW,[row, col],'N');

figure, imshow(I)
hold on;
plot(boundary(:,2),boundary(:,1),'g','LineWidth',3);
BW_filled = imfill(BW,'holes');
boundaries = bwboundaries(BW_filled);
for k=1:10
   b = boundaries{k};
   plot(b(:,2),b(:,1),'g','LineWidth',3);
end
rotI = imrotate(I,33,'crop');
fig1 = imshow(I);
BW = edge(I,'canny',[0.15 0.2]);
figure, imshow(BW);
[H,theta,rho] = hough(BW);
figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('theta (degrees)'), ylabel('rho');
axis on, axis normal, hold on;
colormap(hot)
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
figure, imshow(I)
% BW is the binary image obtained by thresholding IMG
stats = regionprops(BW3,'BoundingBox');
figure
hold on
imshow(im)
for object = 1 : length(stats)
    
    if( bb > 1)
    bb = stats(object).BoundingBox;
    rectangle('Position',bb,'EdgeColor','g','LineWidth',2)
    end
    
end
hold off
