function [ newtemplate ] = templates(patch1, IGray);

%template = .2*ones(11); % make light gray plus on dark gray background
g = normxcorr2(patch1, IGray);
d = abs(g);
[ypeak, xpeak] = find(d == max(d(:)));
ypeak = ypeak-(size(patch1,1)-1)/2;
xpeak = xpeak-(size(patch1,2)-1)/2;
fprintf('\n Center of patch: ypeak is %d and xpeak is  %d \n\n\n', ypeak, xpeak);
figure,imshow(IGray);
figure, surf(g), shading flat, title('Graph Of Selected Patch');
hold on;
plot(xpeak, ypeak, 'ro');

newtemplate = g;
end