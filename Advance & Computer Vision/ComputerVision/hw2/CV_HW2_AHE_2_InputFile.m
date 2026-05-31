for i=0.001:0.002:0.009

figure;   
                
                temp = adapthisteq(im3,'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram - Image DarkTree');
                
end;
for i=0.01:0.02:0.09

figure;   
                
                temp = adapthisteq(im3,'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram Graph - Image DarkTree');
                
end;








for i=0.001:0.002:0.009

figure;   
                
                temp = adapthisteq(imm3,'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(imm3.^(1./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(imm3.^(2./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram - Image DarkLog');
                
end;
for i=0.01:0.02:0.09

figure;   
                
                temp = adapthisteq(imm3,'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = adapthisteq(imm3.^(1./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
                
                temp = adapthisteq(imm3.^(2./3),'clipLimit',i,'Distribution','exponential');
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram Graph - Image DarkLog');
                
end;