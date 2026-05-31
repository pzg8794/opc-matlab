
imgData  = imread('shark.png');
mImgData = mean(imgData,3);
rdSize   = 64;
%Algorithm Function


% eliminate unnecessary values
mImgData(isnan(mImgData)) = 0;
mImgData(isinf(mImgData)) = 0;

% reduce mean values matrix
mImgData   = mImgData - min(mImgData (:));
mxImgData  = max(mImgData(:));
avgImgData = mImgData/mxImgData;
randVal    = rdSize/3;
mImgData = round(avgImgData*randVal);

%generate ramdon valuese matrix
randomDots = round(rand(rdSize)*256);

%Calculate width and hight of the mean values matrix
tpImgWidth = size(mImgData, 1);
rdWidth    = size(randomDots, 1);
rdHight    = size(randomDots, 2);

% Loop each row to insert a random bit on each row
for i = 1: size(mImgData,1)
    
    for j = tpImgWidth:-1: tpImgWidth-rdWidth
        
        bit           = mod(j-mImgData(i,j), rdWidth-1)+1;
        mImgData(i,j) = randomDots(mod(i, rdHight-1)+1, bit);
        
    end
    
    for j = tpImgWidth-rdWidth-1: -1:1
        
        bit           = j + rdWidth-mImgData(i,j)+1;
        mImgData(i,j) = mImgData(i, bit);
        
    end
    
end


scaledImg = imagesc(mImgData);
colormap (cool);
grid ('off');

% Graphics Object value

% Ensure root units are pixels and get the size of the screen
% and create a figure window:
gcf = get( scaledImg, 'Parent');

%Returns or displays the possile values for the specified property of 
%the object with handle ScaledImg.
set ( gcf, 'Units', 'Pixels');
set( gcf, 'Position', [5 5 size(mImgData,2) size(mImgData,1)] );

%Returns or displays the possile values for the specified property of 
%the object with handle gcf.
fGcf = get( gcf, 'Parent' );
set ( fGcf, 'Units', 'Pixels' );
set( fGcf, 'Position', [100 100 size(mImgData,2)+10 size(mImgData,1)+10] );


%setting te mesh and the accuracy paramemters
clear;
imgData  = membrane(1,250,9,2);
mImgData = mean(imgData,3);
rdSize   = 32;
%Algorithm Function

% eliminate unnecessary values
mImgData(isnan(mImgData)) = 0;
mImgData(isinf(mImgData)) = 0;

% reduce mean values matrix
mImgData   = mImgData - min(mImgData (:));
mxImgData  = max(mImgData(:));
avgImgData = mImgData/mxImgData;
randVal    = rdSize/3;

mImgData = round(avgImgData*randVal);
% mImgData = round(mImgData/max(mImgData(:))*rdSize/3);

%generate ramdon valuese matrix
randomDots = round(rand(rdSize)*256);

%Calculate width and hight of the mean values matrix
tpImgWidth = size(mImgData, 1);
rdWidth    = size(randomDots, 1);
rdHight    = size(randomDots, 2);

% Loop each row to insert a random bit on each row
for i = 1: size(mImgData,1)
    
    for j = tpImgWidth:-1: tpImgWidth-rdWidth
        
        bit           = mod(j-mImgData(i,j), rdWidth-1)+1;
        mImgData(i,j) = randomDots(mod(i, rdHight-1)+1, bit);
        
    end
    
    for j = tpImgWidth-rdWidth-1: -1:1
        
        bit           = j + rdWidth-mImgData(i,j)+1;
        mImgData(i,j) = mImgData(i, bit);
        
    end
    
end


scaledImg = imagesc(mImgData);
colormap (cool);
grid ('off');

% Graphics Object value

% Ensure root units are pixels and get the size of the screen
% and create a figure window:
gcf = get( scaledImg, 'Parent');

%Returns or displays the possile values for the specified property of 
%the object with handle ScaledImg.
set ( gcf, 'Units', 'Pixels');
set( gcf, 'Position', [5 5 size(mImgData,2) size(mImgData,1)] );

%Returns or displays the possile values for the specified property of 
%the object with handle gcf.
fGcf = get( gcf, 'Parent' );
set ( fGcf, 'Units', 'Pixels' );
set( fGcf, 'Position', [100 100 size(mImgData,2)+10 size(mImgData,1)+10] );


clear;
ScrData = peaks(500);
imgData  = membrane(1,250,9,2);
mImgData = mean(imgData,3);
rdSize   = 32;
%Algorithm Function


% eliminate unnecessary values
mImgData(isnan(mImgData)) = 0;
mImgData(isinf(mImgData)) = 0;

% reduce mean values matrix
mImgData   = mImgData - min(mImgData (:));
mxImgData  = max(mImgData(:));
avgImgData = mImgData/mxImgData;
randVal    = rdSize/3;

mImgData = round(avgImgData*randVal);
% mImgData = round(mImgData/max(mImgData(:))*rdSize/3);

%generate ramdon valuese matrix
randomDots = round(rand(rdSize)*256);

%Calculate width and hight of the mean values matrix
tpImgWidth = size(mImgData, 1);
rdWidth    = size(randomDots, 1);
rdHight    = size(randomDots, 2);

% Loop each row to insert a random bit on each row
for i = 1: size(mImgData,1)
    
    for j = tpImgWidth:-1: tpImgWidth-rdWidth
        
        bit           = mod(j-mImgData(i,j), rdWidth-1)+1;
        mImgData(i,j) = randomDots(mod(i, rdHight-1)+1, bit);
        
    end
    
    for j = tpImgWidth-rdWidth-1: -1:1
        
        bit           = j + rdWidth-mImgData(i,j)+1;
        mImgData(i,j) = mImgData(i, bit);
        
    end
    
end


scaledImg = imagesc(mImgData);
colormap (copper);
grid ('off');

% Graphics Object value

% Ensure root units are pixels and get the size of the screen
% and create a figure window:
gcf = get( scaledImg, 'Parent');

%Returns or displays the possile values for the specified property of 
%the object with handle ScaledImg.
set ( gcf, 'Units', 'Pixels');
set( gcf, 'Position', [5 5 size(mImgData,2) size(mImgData,1)] );

%Returns or displays the possile values for the specified property of 
%the object with handle gcf.
fGcf = get( gcf, 'Parent' );
set ( fGcf, 'Units', 'Pixels' );
set( fGcf, 'Position', [100 100 size(mImgData,2)+10 size(mImgData,1)+10] );

