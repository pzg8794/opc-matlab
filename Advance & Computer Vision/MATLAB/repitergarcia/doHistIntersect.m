function [maxCov, avgInter, res] = doHistIntersect(histBase, histTest,imgBase, imgTest,blockCount,histBins)
%computes intersection of 16 sixteen bin histograms from 2 images selected
%from a cell array based on imgNum, 0=single image compare

if(imgBase > 0)
    base = reshape(histBase(imgBase,:,:,:),blockCount,histBins,3);
else
    base = histBase;
end
if(imgTest > 0)
    test = reshape(histTest(imgTest,:,:,:),blockCount,histBins,3);
else
    test = histTest;
end
maxCov = -1;
avgInter = [0,0,0];
res = zeros(blockCount,3,histBins);
close all
for index = 1:blockCount
    %histogram intersection of imgNum image
    %percentage vs absolute
    %ch1Int = reshape(min(base(index,:,1),test(index,:,1))./base(index,:,1),1,histBins);
    ch1Int = reshape(min(base(index,:,1),test(index,:,1)),1,histBins);
    ch1Int(isnan(ch1Int)) = 0;
    if(size(nonzeros(ch1Int),1) > 0)
        avgInter(1) = avgInter(1) + sum(nonzeros(ch1Int))/size(nonzeros(ch1Int),1);
    end
    
    %ch2
    ch2Int = reshape(min(base(index,:,2),test(index,:,2)),1,histBins);
    %ch2Int = reshape(min(base(index,:,2),test(index,:,2))./base(index,:,2),1,histBins);
    ch2Int(isnan(ch2Int)) = 0;
    if(size(nonzeros(ch2Int),1) > 0)
        avgInter(2) = avgInter(2) + sum(nonzeros(ch2Int))/size(nonzeros(ch2Int),1);
    end
    
    %ch3
    ch3Int = reshape(min(base(index,:,3),test(index,:,3)),1,histBins);
    %ch3Int = reshape(min(base(index,:,3),test(index,:,3))./base(index,:,3),1,histBins);
    ch3Int(isnan(ch3Int)) = 0;
    if(size(nonzeros(ch3Int),1) > 0) 
        avgInter(3) = avgInter(3) + sum(nonzeros(ch3Int))/size(nonzeros(ch3Int),1);
    end
    
    %plotting covariance
    
    covMatC1 = abs(cov(reshape(base(index,:,1),1,16),reshape(test(index,:,1),1,histBins)));
    covMatC2 = abs(cov(reshape(base(index,:,2),1,16),reshape(test(index,:,1),1,histBins)));
    covMatC3 = abs(cov(reshape(base(index,:,3),1,16),reshape(test(index,:,1),1,histBins)));
    
    maxCov = max([covMatC1(2),covMatC2(2),covMatC3(2), maxCov]);
    res(index,:,:) = [ch1Int; ch2Int; ch3Int;];
end
avgInter = avgInter./blockCount;
