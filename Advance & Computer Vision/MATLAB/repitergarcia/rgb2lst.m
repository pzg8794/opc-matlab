function newImg = rgb2lst(img)
img = imread('OrangeFlower.jpg');
newImg = uint8(zeros(size(img)));
alpha = 1;
lstMat = [ alpha/sqrt(3), alpha/sqrt(3), alpha/sqrt(3); alpha/sqrt(2), 0, -alpha/sqrt(2); alpha/sqrt(6), 2*alpha/sqrt(6), alpha/sqrt(6)];
%slow, but steady
for rowi = 1:(size(img,1))
    for coli = 1:(size(img,2))
        alpha = 255/max([img(rowi,coli,1),img(rowi,coli,2),img(rowi,coli,3)]);
        lstMat = [ alpha/sqrt(3), alpha/sqrt(3), alpha/sqrt(3); alpha/sqrt(2), 0, -alpha/sqrt(2); alpha/sqrt(6), 2*alpha/sqrt(6), alpha/sqrt(6)];
        newImg(rowi,coli,:) = uint8(double(lstMat)*double([img(rowi,coli,1);img(rowi,coli,2);img(rowi,coli,3)]));
    end
end
        