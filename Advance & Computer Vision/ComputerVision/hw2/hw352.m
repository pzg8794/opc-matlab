        figure;   
                
                temp = adapthisteq(im3);
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3));
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3));
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram');
    
  
        figure;                    
                
                temp = adapthisteq(im3);
                subplot(2, 2, 1),imhist(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(1./3));
                subplot(2, 2, 2),imhist(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(2./3));
                subplot(2, 2, 3),imhist(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram Graph');   
                
                
%J = adapthisteq(I,param1,val1,param2,val2...) 
%specifies any of the additional parameter/value pairs listed in the following table. 
%Parameter names can be abbreviated, and case does not matter.                 
                
                
        figure;   
                
                temp = adapthisteq(im3,'clipLimit',0.01,'Distribution','exponential');
                subplot(2, 2, 1),imshow(temp);xlabel('Double');
               
                temp = adapthisteq(im3.^(i./3));
                subplot(2, 2, 2),imshow(temp);xlabel('Cube Root');
                
                temp = adapthisteq(im3.^(i./3));
                subplot(2, 2, 3),imshow(temp);xlabel('Sqrt Root');

                suptitle('Adaptive Equalized Histogram');