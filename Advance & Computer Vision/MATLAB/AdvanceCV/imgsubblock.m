function blocks = imgsubblock(img,numBlocks)
% Flattens and divides a 3 channel image into equal sized blocks
% depending on the numBlocks (must be perfect square)
numDivs = sqrt(numBlocks);
numPix = (size(img,1)/numDivs)*(size(img,2)/numDivs);
blocks = uint8(zeros(numBlocks,numPix,3));
%loop operations, index starts in top left of image and goes down and
% then right each operation
blockLeft = 1;
blockRight = size(img,2)/numDivs;
for rindex = 1:numDivs
    blockTop = 1;
    blockBot = size(img,1)/numDivs;
    for cindex = 1:numDivs
       
        blocks(numDivs*(rindex-1) +cindex,:,1) = reshape(img(blockLeft:blockRight,blockTop:blockBot,1),1,numPix);
        blocks(numDivs*(rindex-1) +cindex,:,2) = reshape(img(blockLeft:blockRight,blockTop:blockBot,2),1,numPix);
        blocks(numDivs*(rindex-1) +cindex,:,3) = reshape(img(blockLeft:blockRight,blockTop:blockBot,3),1,numPix);
        
        blockTop = blockTop + size(img,1)/numDivs;
        blockBot = blockBot + size(img,1)/numDivs;
    end
    
    blockLeft = blockLeft + size(img,2)/numDivs;
    blockRight = blockRight + size(img,2)/numDivs;
end
