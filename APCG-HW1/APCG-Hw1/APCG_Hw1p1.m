


imgData  = imread('depth.jpg');
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
