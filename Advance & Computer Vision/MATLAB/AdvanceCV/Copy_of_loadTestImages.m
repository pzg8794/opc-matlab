
sdirectory = 'coastTestImages';
tifFiles = dir([sdirectory '/*.jpg']);


for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);



lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;
img_in = im2double(I);


img_in(:,:,2:3) = [];   
img_out = zeros(size(img_in,1), size(img_in,2), N);
for n=1:N
    gb = gaborsample(bw,gamma,psi(1),lambda,theta)...
        + 1i * gaborsample(bw,gamma,psi(2),lambda,theta);
    
    img_out(:,:,n) = imfilter(img_in, gb, 'symmetric');
   
    theta = theta + 2*pi/N;
    
end
%figure(1);
%imshow(img_in);
%title('input image');
figure(2);
img_out_disp = sum(abs(img_out).^2, 3).^0.5;

img_out_disp = img_out_disp./max(img_out_disp(:));


%title('gabor output, L-2 super-imposed, normalized');

subplot(6,7,k);imshow(img_out_disp);

% operations on "I"
end










sdirectory = 'forestTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;
img_in = im2double(I);


img_in(:,:,2:3) = [];   
img_out = zeros(size(img_in,1), size(img_in,2), N);
for n=1:N
    gb = gaborsample(bw,gamma,psi(1),lambda,theta)...
        + 1i * gaborsample(bw,gamma,psi(2),lambda,theta);
    
    img_out(:,:,n) = imfilter(img_in, gb, 'symmetric');
   
    theta = theta + 2*pi/N;
    
end
%figure(1);
%imshow(img_in);
%title('input image');
figure(2);
img_out_disp = sum(abs(img_out).^2, 3).^0.5;

img_out_disp = img_out_disp./max(img_out_disp(:));


%title('gabor output, L-2 super-imposed, normalized');

subplot(6,6,k);imshow(I);

% operations on "I"
end


sdirectory = 'highwayTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;
img_in = im2double(I);


img_in(:,:,2:3) = [];   
img_out = zeros(size(img_in,1), size(img_in,2), N);
for n=1:N
    gb = gaborsample(bw,gamma,psi(1),lambda,theta)...
        + 1i * gaborsample(bw,gamma,psi(2),lambda,theta);
    
    img_out(:,:,n) = imfilter(img_in, gb, 'symmetric');
   
    theta = theta + 2*pi/N;
    
end
%figure(1);
%imshow(img_in);
%title('input image');
figure(2);
img_out_disp = sum(abs(img_out).^2, 3).^0.5;

img_out_disp = img_out_disp./max(img_out_disp(:));


%title('gabor output, L-2 super-imposed, normalized');
subplot(6,6,k);imshow(I);

% operations on "I"
end








sdirectory = 'mountainTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;
img_in = im2double(I);


img_in(:,:,2:3) = [];   
img_out = zeros(size(img_in,1), size(img_in,2), N);
for n=1:N
    gb = gaborsample(bw,gamma,psi(1),lambda,theta)...
        + 1i * gaborsample(bw,gamma,psi(2),lambda,theta);
    
    img_out(:,:,n) = imfilter(img_in, gb, 'symmetric');
   
    theta = theta + 2*pi/N;
    
end
%figure(1);
%imshow(img_in);
%title('input image');
figure(2);
img_out_disp = sum(abs(img_out).^2, 3).^0.5;

img_out_disp = img_out_disp./max(img_out_disp(:));


%title('gabor output, L-2 super-imposed, normalized');

subplot(6,6,k);imshow(I);

% operations on "I"
end


sdirectory = 'tallbuildingTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;
img_in = im2double(I);


img_in(:,:,2:3) = [];   
img_out = zeros(size(img_in,1), size(img_in,2), N);
for n=1:N
    gb = gaborsample(bw,gamma,psi(1),lambda,theta)...
        + 1i * gaborsample(bw,gamma,psi(2),lambda,theta);
    
    img_out(:,:,n) = imfilter(img_in, gb, 'symmetric');
   
    theta = theta + 2*pi/N;
    
end
%figure(1);
%imshow(img_in);
%title('input image');
figure(2);
img_out_disp = sum(abs(img_out).^2, 3).^0.5;

img_out_disp = img_out_disp./max(img_out_disp(:));


%title('gabor output, L-2 super-imposed, normalized');

subplot(6,6,k);imshow(I);

% operations on "I"
end