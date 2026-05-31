function [CovaianceMatrix,MatlabCov,MeanVector,Data] = colorFeatures_HW04_Karina_Damico(img)

    select=impixel(img);
    select_r=select(:,:,1);
    select_r=select_r(:);
    select_g=select(:,:,2);
    select_g=select_g(:);
    select_b=select(:,:,3);
    select_b=select_b(:);
    Data=[select_r,select_g,select_b];
    
    % counting mean for select_r
    sum_r=sum(select_r);
    % counting mean for select_r
    mean_r=sum_r/size(select_r,1);
 
    sum_g=sum(select_g);
    % counting mean for select_r
    mean_r=sum_g/size(select_r,1);
    
    sum_b=sum(select_b);
    % counting mean for select_r
    mean_b=sum_b/size(select_b,1);
 
    MeanVector=[mean_r mean_g mean_b];
    
    dataM=[(select_r-mean_r),(select_g-mean_g),(select_b-mean_b);
    
    C11=sum(dataM(:,1).*dataM(:,1))/2;
    C12=sum(dataM(:,1).*dataM(:,2))/2;
    C13=sum(dataM(:,1).*dataM(:,3))/2;
    C21=sum(dataM(:,2).*dataM(:,1))/2;
    C22=sum(dataM(:,2).*dataM(:,2))/2;
    C23=sum(dataM(:,2).*dataM(:,3))/2;
    C31=sum(dataM(:,3).*dataM(:,1))/2;
    C32=sum(dataM(:,3).*dataM(:,2))/2;
    C33=sum(dataM(:,3).*dataM(:,3))/2;
    CovaianceMatrix=[C11 C12 C13; C21 C22 C23; C31 C32 C33];
    
    MatlabCov=cov(select);
    
    end
 
    
    function [EDMap,EMapThreshImage,imE,MDMap,MMapThreshImage,imM] = colorsegment_HW04_Karina_Damico(img)
    
    img=imread(img);
    figure, imshow(img), title('Original Image');
    fprintf('Click on sample points. Double click on last point');
    [CvM, MlC, MV, Data]=colorFeatures_HW04_Karina_Damico(img);
    EDMap=sqrt((img(:,:,1)-MV(:,1)).^2+(img(:,:,2)-MV(:,2)).^2+(img(:,:,3)-MV(:,3)).^2);
    thrE = input('Enter threshold value for Euclidean segmentation');
    thrM = input('Enter threshold value for Mahalanobis segmentation ');
    EMapThreshImage=EDMap<thrE;
    Er=img(:,:,1).*EMapThreshImage;
    Eg=img(:,:,2).*EMapThreshImage;
    Eb=img(:,:,3).*EMapThreshImage;
    imE=cat(3,Er,Eg,Eb);
    
    MDMap=sqrt((img-Mv)*inv(CvM)*(img-Mv)');
    MMapThreshImage=MDMap<thrM;
    Mr=img(:,:,1).*MMapThreshImage;
    Mg=img(:,:,2).*MMapThreshImage;
    Mb=img(:,:,3).*MMapThreshImage;
    imM=cat(3,Mr,Mg,Mb);
    end
    
    
    
    Write your own function for color segmentation called colorsegment_HW04_your_name with the following parameters:
 [EDMap EMapThreshImage imE MDMap MMapThreshImage imM ] = colorsegment_Gaborski( img )
 im=imread(img);
       
        EDMap : Euclidean Distance Map
        EMapThreshImage : Thresholded Euclidean Distance Map
        imE : Masked original image (using EMapThreshImage)
        MDMap : Mahalanobis Distance Map
        MMapThreshImage : Thresholded Mahalanobis Distance Map
        imM : Masked original image (using MMapThreshImage)
        img : RGB  jpeg image to be segmented
       
  Call your colorFeatures_HW04 from inside your colorsegment function to calculate the covariance matrix and mean vector 


Your function must have the following minimum functionality to obtain full credit 

1. The function should take as the input parameter the name of an image file,
for example: CV_W04RogerGaborski('OrangeBuilding.jpg'). There is only one input parameter
3. Display the image
4. Display the message: 'Click on sample points. Double click on last point'. Use impixel to collect the data
5a. Request a threshold value from the user and display: 'Enter threshold value for Euclidean segmentation '
5b. Request a threshold value from the user and display: 'Enter threshold value for Mahalanobis segmentation '
6. Use the user supplied thresholds to segment the image (Euclidean threshold for euclidean distance measurement and  Mahalanobis threshold for Mahalanobis distance measurement - DO NOT PASS THE THRESHOLD VALUES AS A FUNCTION PARAMETER VALUE
7. Return the images EDMap EMapThreshImage imE MDMap MMapThreshImage imM (as described above)
    
    
    
    
    