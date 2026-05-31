Im1=imadjust(im2double(rgb2gray(imread('PurpleFlowerSmall.jpg'))));
Im2=zeros(200,200);
    for i=20:20:180
     Im2(:,i)=1;
     Im2(:,i+1)=1;
     Im2(i,:)=1;
     Im2(i+1,:)=1;
    end  
Im3=imadjust(im2double(rgb2gray(imread('kitty.jpg'))));
Im4=imadjust(im2double(rgb2gray(imread('theThing.jpg'))));

figure,
subplot(1,3,1),imshow(imread('PurpleFlowerSmall.jpg')), 
title('Purple Flower Small');
subplot(1,3,2),imshow(imread('Kitty.jpg')), title('Kitty');
subplot(1,3,3),imshow(imread('theThing.jpg')), title('The Thing');
suptitle('Loading Three Different Images for Examples');

figure,
subplot(2,2,1),imshow(Im1), title('Purple Flower Small');
subplot(2,2,2),imshow(Im2), title('Grin');
subplot(2,2,3),imshow(Im3), title('Kitty');
subplot(2,2,4),imshow(Im4), title('The Thing');
suptitle('Transforming Three Different Images for Examples');

figure,
subplot(2,2,1),imshow(harris(Im1,1,0.1,1)), title('Purple Flower Small');
subplot(2,2,2),imshow(harris(Im2,1,0.5,1)), title('Grin');
subplot(2,2,3),imshow(harris(Im3,1,0.05,1)), title('Kitty');
subplot(2,2,4),imshow(harris(Im4,2,0.04,2)), title('The Thing');
suptitle('Corners Found in Images');

figure,
subplot(2,2,1),title('Purple Flower Small');
harris(Im1,1,0.1,1);  
subplot(2,2,2),title('Kitty');
harris(Im2,1,0.5,1); 
subplot(2,2,3),title('Kitty');
harris(Im3,1,0.05,1); 
subplot(2,2,4),title('The Thing');
harris(Im4,2,0.04,2); 
suptitle('Corners Mathed for Each Image');

