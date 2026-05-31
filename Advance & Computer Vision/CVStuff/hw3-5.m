im= imread('DarkTree.JPG');

im2= im2double(im);
im3= rgb2gray(im2);
%figure, imshow(im3);

im4= im3.^(1./3);
im5= im3.^(2./3);


subplot(2, 2, 1),imshow(im3); xlabel('Double');
subplot(2, 2, 2),imshow(im4); xlabel('Cube Root');
subplot(2, 2, 3),imshow(im5); xlabel('Sqrt Root');
suptitle('Imput Image in Gray Scale'); 

for i=0.02:0.01:0.09

figure;   
                
                temp = adapthisteq(im3,'clipLimit',0.01,'Distribution','exponential');
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3),'clipLimit',0.01,'Distribution','exponential');
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3),'clipLimit',0.01,'Distribution','exponential');
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram');
                
end;