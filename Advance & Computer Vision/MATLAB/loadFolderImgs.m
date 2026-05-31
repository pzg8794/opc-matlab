function [Cell_of_images] = loadFolderImgs(~)

sdirectory = 'AdvanceCV';
cd(sdirectory)

tifFiles = dir([sdirectory '/*.jpg']);


figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

subplot(6,7,k);imshow(I);
Cell_of_images{k} = I;

cd(sdirectory)
end
