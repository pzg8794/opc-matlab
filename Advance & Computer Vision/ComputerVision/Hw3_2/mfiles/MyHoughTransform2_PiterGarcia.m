%Piter Garcia
%Homework 3 Second Part
%Date 09/31/2012

[iHeight, iWidth] = size(E);
distMax = round(sqrt(iHeight^2 + iWidth^2));

theta = -90:1:89;
H= 0;
rho= 0;
d= 0;
H = zeros(length(rho), length(theta));

for ix= 1: iWidth
    for iy= 1:iHeight
        if E(iy, ix) ~= 0
            for iTheta = 1:length(theta)
				t = theta(iTheta)*pi/180;
				
				 dist = ix*cos(t) + iy*sin(t);
			
				 [d, iRho] = min(abs(rho-dist));
			
                if d <= 1
					H(iRho,iTheta) = H(iRho, iTheta) + 1;
                end;
            end;
        end;
    end;
end;


imshow(im);
G= rgb2gray(im);
G= imresize(G, [167 250]);
E=edge(G,'canny', 0.1);
figure, imshow(E);
[H, theta, rho] = hough(E);
figure, imshow(H, []);

peaks = houghpeaks(H, 50, 'Threshold', 30);
I= imresize(im, [167 250]);
figure, imshow(I, []), hold on

lines = houghlines(E,theta,rho,peaks,'FillGap',5,'MinLength',15);
   for k = 1:numel(lines)
        x1 = lines(k).point1(1);
        y1 = lines(k).point1(2);
        x2 = lines(k).point2(1);
        y2 = lines(k).point2(2);
        plot([x1 x2],[y1 y2],'Color','b','LineWidth', 2)
    end
    hold off

suptitle('Transforming Color Image to Find Edges');

