 for i=0:1:2,
       
        if i == 0 
            x= im3; 
        end;  
        
        if i ~= 0
        x= im3.^(i./3); 
        end;

        figure;

                temp = imadjust(x);
                subplot(2, 2, 1),imshow(temp);
                xlabel('No Gamma');
                if i == 0
                ylabel('Double Images');
                end;
                if i == 1
                ylabel('Cube Root Images');
                end;
                if i == 2
                ylabel('Sqrt Root Images');
                end;
                
                
                
                temp = imadjust(x,[],[], 0.5);
                subplot(2, 2, 2),imshow(temp);xlabel('Gamma is 0.5');
                
                temp = imadjust(x,[],[], 0.6);
                subplot(2, 2, 3),imshow(temp);xlabel('Gamma is 0.6');
                                
                temp = imadjust(x,[],[], 0.7);
                subplot(2, 2, 4),imshow(temp);xlabel('Gamma is 0.7');

                suptitle('Adjusting image intensity (imadjust) - Image DarkTree'); 
  end;       
 
     for i=0:1:2,
       
        if i == 0 
            x= im3; 
        end;  
        
        if i ~= 0
        x= im3.^(i./3); 
        end;

        figure;

                temp = imadjust(x);
                subplot(2, 2, 1),imhist(temp);
                xlabel('No Gamma');
                if i == 0
                ylabel('Double Images');
                end;
                if i == 1
                ylabel('Cube Root Images');
                end;
                if i == 2
                ylabel('Sqrt Root Images');
                end;
                
                
                
                temp = imadjust(x,[],[], 0.5);
                subplot(2, 2, 2),imhist(temp);xlabel('Gamma is 0.5');
                
                temp = imadjust(x,[],[], 0.6);
                subplot(2, 2, 3),imhist(temp);xlabel('Gamma is 0.6');
                                
                temp = imadjust(x,[],[], 0.7);
                subplot(2, 2, 4),imhist(temp);xlabel('Gamma is 0.7');

                suptitle('Adjusting image intensity (imadjust) Graph - Image DarkTree');  
    end;      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  for i=0:1:2,
       
        if i == 0 
            x= imm3; 
        end;  
        
        if i ~= 0
        x= imm3.^(i./3); 
        end;

        figure;

                temp = imadjust(x);
                subplot(2, 2, 1),imshow(temp);
                xlabel('No Gamma');
                if i == 0
                ylabel('Double Images');
                end;
                if i == 1
                ylabel('Cube Root Images');
                end;
                if i == 2
                ylabel('Sqrt Root Images');
                end;
                
                
                
                temp = imadjust(x,[],[], 0.5);
                subplot(2, 2, 2),imshow(temp);xlabel('Gamma is 0.5');
                
                temp = imadjust(x,[],[], 0.6);
                subplot(2, 2, 3),imshow(temp);xlabel('Gamma is 0.6');
                                
                temp = imadjust(x,[],[], 0.7);
                subplot(2, 2, 4),imshow(temp);xlabel('Gamma is 0.7');

                suptitle('Adjusting image intensity (imadjust) - Image DarkLog'); 
  end;       
 
     for i=0:1:2,
       
        if i == 0 
            x= imm3; 
        end;  
        
        if i ~= 0
        x= imm3.^(i./3); 
        end;

        figure;

                temp = imadjust(x);
                subplot(2, 2, 1),imhist(temp);
                xlabel('No Gamma');
                if i == 0
                ylabel('Double Images');
                end;
                if i == 1
                ylabel('Cube Root Images');
                end;
                if i == 2
                ylabel('Sqrt Root Images');
                end;
                
                
                
                temp = imadjust(x,[],[], 0.5);
                subplot(2, 2, 2),imhist(temp);xlabel('Gamma is 0.5');
                
                temp = imadjust(x,[],[], 0.6);
                subplot(2, 2, 3),imhist(temp);xlabel('Gamma is 0.6');
                                
                temp = imadjust(x,[],[], 0.7);
                subplot(2, 2, 4),imhist(temp);xlabel('Gamma is 0.7');

                suptitle('Adjusting image intensity (imadjust) Graph - Image DarkLog');
    end;                  
               
                    
