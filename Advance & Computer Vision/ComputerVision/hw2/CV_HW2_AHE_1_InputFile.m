        figure;   
                
                temp = adapthisteq(im3);
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3));
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3));
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram - Image DarkTree');
    
  
        figure;                    
                
                temp = adapthisteq(im3);
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3));
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3));
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram Graph - Image DarkTree');  
                
               
                
                
                
                
                
                
                
          figure;   
                
                temp = adapthisteq(imm3);
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(imm3.^(1./3));
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(imm3.^(2./3));
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram - Image DarkLog');
    
  
        figure;                    
                
                temp = adapthisteq(imm3);
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = adapthisteq(imm3.^(1./3));
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
                
                temp = adapthisteq(imm3.^(2./3));
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram Graph - Image DarkLog');  