function [myHist,myMed,myMod,myVar] = colorBlockHistFeats(myImg,colorSpace,blocks,bins)
% Returns median, mode and variance vectors. Color space conversion options
% 1=YCrCb, 2=HSV, 3=LST, 4=LAB, 0/other = No conversion(RGB)

%change based on color space choice code
if(colorSpace == 1)
    colorSpaceImg = rgb2ycbcr(myImg);
elseif(colorSpace == 2)
    %color space is 0-1 based
    colorSpaceImg = rgb2hsv(myImg);
    colorSpaceImg = colorSpaceImg*255;
elseif(colorSpace == 3)
    colorSpaceImg = rgb2lst(myImg);
elseif(colorSpace == 4)
    cform = makecform('srgb2lab');
    colorSpaceImg = applycform(myImg,cform);
else
    colorSpaceImg = myImg;
end

%Block size fixed for compatiblity with known image sizes
% FIX AT 16!
myBlocks = imgsubblock(colorSpaceImg,16);
%assuming its called with 16 blocks!!
%four histograms for the center of the image (6,7,10,11)
histList = zeros(blocks,bins,3);
if(blocks == 4)
    myBlocks = myBlocks([6,7,10,11],:,:);
elseif(blocks == 6)
    myBlocks = myBlocks([6,7,10,11,14,15],:,:);
end
for hindex = 1:size(myBlocks,1);
    histList(hindex,:,:) = rgbhist(myBlocks(hindex,:,:),false);
end

%assuptions for 3 channels
myMed = reshape(median(histList,1),bins,3);
myMod = reshape(mode(histList,1),bins,3);
myVar = reshape(var(histList),bins,3);
myHist = histList;