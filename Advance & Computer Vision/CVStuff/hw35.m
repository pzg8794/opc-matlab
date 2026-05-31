for i=0.1:0.1:0.5

figure;   
                
                temp = adapthisteq(im3,'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram - Image DarkTree');
                
end;

for i=0.1:0.1:0.5

figure;   
                
                temp = adapthisteq(imm3,'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(imm3.^(1./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(imm3.^(2./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram - Image DarkLog');
                
end;