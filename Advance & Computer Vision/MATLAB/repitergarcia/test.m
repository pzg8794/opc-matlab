

clc;
clear all;
close all;


nBins=5;
winSize=7;
nClass=6;

%Read Input Image
inImg = imread('coast_land309.jpg');
imshow(inImg);title('Class Coast');

%Segmentation
outImg = Imagesegm(inImg, nBins, winSize, nClass);

%Displaying Output
figure;imshow(outImg);title('Segmentation Maps');
colormap('default');

