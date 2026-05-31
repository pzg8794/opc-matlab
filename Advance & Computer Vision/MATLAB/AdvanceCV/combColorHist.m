function [ comb_hist, out_hists ] = combColorHist( Cell_imgs , UseAvg, colorSpace, blockCount,histBins)
%combColorHist Returns a combined color histogram given a cell array of
%images. Breaks imgs into 16 blocks and combines histograms across cells
%   Changes color space, equally sized blocks, histogram per block then
%   returns the average or mode of those histograms per block

%block count desribes how many of the 16 blocks to use

out_hists = zeros(size(Cell_imgs,1),blockCount,histBins,3);
hsum = zeros(blockCount,histBins,3);
%The 16 blocks, histBins histogram bins
for index = 1:size(Cell_imgs,1)
    %16 blocks to return hists blockCount blocks from the center of the img
    [out_hists(index,:,:,:), ~, ~, ~] = colorBlockHistFeats(Cell_imgs{index},colorSpace,blockCount,histBins);
    %running sum for average
    hsum = hsum + (reshape(out_hists(index,:,:,:),blockCount,histBins,3));
end

if(UseAvg == true)

    comb_hist = hsum ./ size(Cell_imgs,1);
    %normalize to make equalivant to individual histograms?
%     comb_hist(:,:,1) = comb_hist(:,:,1)/norm(comb_hist(:,:,1));
%     comb_hist(:,:,2) = comb_hist(:,:,2)/norm(comb_hist(:,:,2));
%     comb_hist(:,:,3) = comb_hist(:,:,3)/norm(comb_hist(:,:,3));
else

    %use mode
    comb_hist = reshape(mode(out_hists),blockCount,histBins,3);
end

end

