function [EDMap,EMapThreshImage,imE,MDMap,MMapThreshImage,imM] = colorsegment_HW04_Karina_Damico(img)
    %figure, imshow(img), title('Original Image');
    fprintf('Click on sample points. Double click on last point:\n');
    [CovaianceMatrix,MatlabCov,MeanVector,Data]=colorFeatures_HW04_Karina_Damico(img);
    imgi=imread(img);
    imgi=im2double(imgi);
    %getting lenghth and width of image-Maps will have the same dimentions
    nrows = size(imgi,1);
    ncols = size(imgi,2);
    MDMap = zeros(nrows, ncols);   %creating empty (0) matrix for MDMap that we will fill in the loop
    EDMap = zeros(nrows, ncols);   %creating empty (0) matrix for EDMap that we will fill in the loop
    invCo=inv(CovaianceMatrix);
% Loop through the maps
for r = 1:nrows
   for c = 1:ncols
      px=imgi(r,c,:);   %getting R G B values of each pixel
      px=reshape(px,1,3);    %shape those values in the 1x3 matrix
      EDMap(r,c)=sqrt((px-MeanVector)*(px-MeanVector)');
      MDMap(r,c)=sqrt((px-MeanVector)*invCo*(px-MeanVector)');
   end
end
    
    %Could avoid using loop for counting EDMap by using:
    %EDMap=sqrt((imgi(:,:,1)-MeanVector(1)).^2+(imgi(:,:,2)-MeanVector(2)).^2+(imgi(:,:,3)-MeanVector(3)).^2);
    %but can't avoid loop for MDMap so if I have to loop anyways,
    %everything was counted in the loop
    thrE = input('Enter threshold value for Euclidean segmentation: ');
    thrM = input('Enter threshold value for Mahalanobis segmentation: ');
    %Thresholdimg the map with the value that user input (all the values
    %more than threshold will be displayed black (will be multiplied by 0)
    EMapThreshImage=EDMap<thrE;
    Er=imgi(:,:,1).*EMapThreshImage;
    Eg=imgi(:,:,2).*EMapThreshImage;
    Eb=imgi(:,:,3).*EMapThreshImage;
    imE=cat(3,Er,Eg,Eb);
    %Thresholdimg the map with the value that user input
    MMapThreshImage=MDMap<thrM;
    Mr=imgi(:,:,1).*MMapThreshImage;
    Mg=imgi(:,:,2).*MMapThreshImage;
    Mb=imgi(:,:,3).*MMapThreshImage;
    imM=cat(3,Mr,Mg,Mb);
end