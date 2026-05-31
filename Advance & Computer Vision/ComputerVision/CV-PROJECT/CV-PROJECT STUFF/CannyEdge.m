im = imread('Auto2.jpg');
%figure, imshow(im);

figure,
im2= im2double(im);
subplot(2, 2, 1),imshow(im2); title('Iam2Double');

im3= rgb2gray(im2);
subplot(2, 2, 2),imshow(im3); title('Rgb2Gray');

im4= imresize(im3, [167 250]);
subplot(2, 2, 3),imshow(im4); title('Rgb-Resized');

im1=medfilt2(im4,[3 3]); 
BW = edge(im1,'sobel'); 
[imx,imy]=size(BW);
msk=[0 0 0 0 0;  0 1 1 1 0; 0 1 1 1 0; 0 1 1 1 0; 0 0 0 0 0;];
B=conv2(double(BW),double(msk)); 
L = bwlabel(B,8);
mx=max(max(L));
[r,c] = find(L==17);  
rc = [r c];
[sx sy]=size(rc);
n1=zeros(imx,imy); 
for i=1:sx
x1=rc(i,1);
y1=rc(i,2);
n1(x1,y1)=255;
end 
figure,imshow(im);

figure,
I_eq = im4;
I_eq = adapthisteq(I_eq);
subplot(2, 2, 1), imshow(I_eq)
bw = im2bw(I_eq, graythresh(I_eq));
subplot(2, 2, 2), imshow(bw)

bw2 = imfill(bw,'holes');
bw3 = imopen(bw2, ones(5,5));
bw4 = bwareaopen(bw3, 40);
bw4_perim = bwperim(bw4);

subplot(2, 2, 3), imshow(bw4_perim)
mask_em = imextendedmax(I_eq, 30);
subplot(2, 2, 4),imshow(mask_em)
