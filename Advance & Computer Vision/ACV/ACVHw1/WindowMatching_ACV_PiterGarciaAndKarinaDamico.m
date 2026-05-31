%Advance Computer Vision
%Due Date : 12/04/2012
%Homework #1
%Authors: Karina Damico & Piter Garcia

%Loading image, convering to double, then to grayscale and displaying.
I = im2double(I); 
IGray = rgb2gray(I); 
figure,imshow(IGray); suptitle('Gray Scale Picture');



%Extracting patch from image as well as the Strip that contains it.
patch1 = IGray(80:110,200:230);
Strip = IGray(80:110,1:450);



%Calculating Error from the patch and strip selected and ploting it.
stripe=IGray(80:110,:);
figure,imshow(stripe);
 
[M N]=size(patch1);
sz=size(stripe,2);
err=zeros(1,sz);
 
for i=1:1:sz-N
    test=stripe(:,i:i+N-1);
    err(i)=sum(abs(test(:)- patch1(:)));
end
%finding min and index of values 
[mini k]=min(err);
plot(err), grid, hold on;
xlabel('Column Position');
ylabel('Error');
suptitle('Total Absolute Error');



% Patch Normalized Cross Correlation on Strip
figure,
g = normxcorr2(patch1, Strip);
d = abs(g);
[ypeak, xpeak] = find(d == max(d(:)));
ypeak = ypeak-(size(patch1,1)-1)/2;
xpeak = xpeak-(size(patch1,2)-1)/2;
fprintf('\n Center of patch: ypeak is %d and xpeak is  %d \n\n\n', ypeak, xpeak);
subplot(2,1,1),imshow(Strip),title('Finding Patch from Strip');
hold on;
plot(xpeak, ypeak, 'ro');
subplot(2,1,2),surf(g), shading flat,title('Grapth of Patch from Strip');


% Patch Normalized Cross Correlation on Whole Image.
templates(patch1, IGray);
suptitle('Finding Patch from Whole Image');

% Strip Normalized Cross Correlation on Whole Image
templates(Strip, IGray);
suptitle('Finding Strip from Whole Image');



%Displaying patch and the strip that contains the patch selected.
figure,
subplot(2,1,2),imshow(patch1), title('Patch Selected from Picture');
subplot(2,1,1),imshow(Strip), title('Strip Containing Patch from Picture');
suptitle('Patch & Strip');



%Usind different templates "patches" from the gray scale image.

%Strong Edge Patch
patch1 = IGray(100:150, 200:250);
templates(patch1, IGray);
suptitle('Finding Strong Edge Patch from Whole Image');
figure,imshow(patch2), title('Strong Edge Patch');

%Strong Edge Patch
patch1 = IGray(300:350, 300:350);
templates(patch1, IGray);
suptitle('Finding Strong Edge Patch from Whole Image');
figure,imshow(patch1), title('Strong Edge Patch');

%Uniform Area Patch
patch1 = IGray(350:400, 250:300);
templates(patch1, IGray);
suptitle('Finding Uniform Area Patch from Whole Image');
figure,imshow(patch1), title('Uniform Area Patch');

%Uniform Area Patch
patch1 = IGray(10:80, 10:90);
templates(patch1, IGray);
suptitle('Finding Uniform Area Patch from Whole Image');
figure,imshow(patch1), title('Uniform Area Patch');
