
sdirectory = 'coastTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

subplot(6,7,k);imshow(I);

% operations on "I"
end







sdirectory = 'forestTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

subplot(6,6,k);imshow(I);

% operations on "I"
end


sdirectory = 'highwayTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

subplot(6,6,k);imshow(I);

% operations on "I"
end



sdirectory = 'mountainTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

subplot(6,6,k);imshow(I);

% operations on "I"
end


sdirectory = 'tallbuildingTestImages';
tifFiles = dir([sdirectory '/*.jpg']);

figure;
for k = 1:length(tifFiles)
filename = [sdirectory '/' tifFiles(k).name];
I = imread(filename);

subplot(6,6,k);imshow(I);

% operations on "I"
end