        figure;                    
                temp = histeq(im3);
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = histeq(im3.^(1./3));
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
               
                temp = histeq(im3.^(2./3));
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Equalized Histogram - Image DarkTree');
                
        figure;                    
                temp = histeq(im3);
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = histeq(im3.^(1./3));
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
               
                temp = histeq(im3.^(2./3));
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Equalized Histogram Graph - I mage DarkTree');
                
                
                
                
                
                
                
                
                
                
                
        figure;                    
                temp = histeq(imm3);
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = histeq(imm3.^(1./3));
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
               
                temp = histeq(imm3.^(2./3));
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Equalized Histogram - Image DarkLog');
                
        figure;                    
                temp = histeq(imm3);
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = histeq(imm3.^(1./3));
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
               
                temp = histeq(imm3.^(2./3));
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Equalized Histogram Graph - Image DarkLog');