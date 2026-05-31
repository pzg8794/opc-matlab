function [cim, r, c] = harris(im, sigma, thresh, radius)
    
    dx = [-1 0 1; -1 0 1; -1 0 1];
    dy = dx';
    Ix = conv2(im, dx, 'same');
    Iy = conv2(im, dy, 'same');
    g = fspecial('gaussian',max(1,fix(6*sigma)), sigma);
    
     Ix2 = conv2(Ix.^2, g, 'same');
     Iy2 = conv2(Iy.^2, g, 'same');
     Ixy = conv2(Ix.*Iy, g, 'same');
    cim = (Ix2.*Iy2 - Ixy.^2)./(Ix2 + Iy2 + eps); %must be some +eps (or + something) to avoid division by 0

	sze = 2*radius+1;      
    mx = imdilate(cim, strel('square',sze));
	cim = (cim==mx)&(cim>thresh);   
	
	[r,c] = find(cim);     
	imagesc(im), hold on, axis off, axis equal, colormap(gray);
	plot(c,r,'r*'),hold off;
end