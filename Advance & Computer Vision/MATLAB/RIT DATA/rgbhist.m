function threeDimHist = rgbhist(I,show)
%RGBHIST   Histogram of RGB values.

if (size(I, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end

%change manually
nBins = 16;

rHist = imhist(I(:,:,1), nBins);
gHist = imhist(I(:,:,2), nBins);
bHist = imhist(I(:,:,3), nBins);

%normalize them
% rHist = rHist/norm(rHist);
% gHist = gHist/norm(gHist);
% bHist = bHist/norm(bHist);

threeDimHist = cat(2,rHist, gHist);
threeDimHist = cat(2,threeDimHist, bHist);
%varargout = rHist;

%so it dosen't print 1000 pictures
if(show == true)
    figure;
    hold on
    stem(1:nBins, rHist,'-r');
    stem(1:nBins + 1/3, gHist,'-g');
    stem(1:nBins + 2/3, bHist,'-b');
    hold off
    % set(hFig, 'marker', 'none')
    % set(hFig(1), 'color', [1 0 0])
    % set(hFig(2), 'color', [0 1 0])
    % set(hFig(3), 'color', [0 0 1])
end;
 