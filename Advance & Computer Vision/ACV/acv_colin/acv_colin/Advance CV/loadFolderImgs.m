function [Cell_of_images] = loadFolderImgs(directory)
curDir = pwd;
cd(directory)
picList = ls;
%takes out . and ..
picList(1:2,:) = [];
Cell_of_images = cell(size(picList,1),1);
for index = 1:size(picList,1)
    Cell_of_images{index} = imread(picList(index,:));
end
cd(curDir)
