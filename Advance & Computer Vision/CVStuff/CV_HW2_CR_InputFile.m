im= imread('DarkTree.JPG');
im2= im2double(im);
im3= rgb2gray(im2);
%figure, imshow(im3);

im4= im3.^(1./3);
im5= im3.^(2./3);

figure,
subplot(2, 2, 1),imshow(im3); xlabel('Double');
subplot(2, 2, 2),imshow(im4); xlabel('Cube Root');
subplot(2, 2, 3),imshow(im5); xlabel('Sqrt Root');
suptitle('Imput Image in Gray Scale - Image DarkTree');

imm= imread('DarkLog.JPG');
imm2= im2double(imm);
imm3= rgb2gray(imm2);
%figure, imshow(im3);

imm4= imm3.^(1./3);
imm5= imm3.^(2./3);

figure,
subplot(2, 2, 1),imshow(imm3); xlabel('Double');
subplot(2, 2, 2),imshow(imm4); xlabel('Cube Root');
subplot(2, 2, 3),imshow(imm5); xlabel('Sqrt Root');
suptitle('Imput Image in Gray Scale - Image DarkLog');

