%Date 10/26/2012
%Piter Garcia
%HomeWork Number 6



I = imread('2011_1HW5.tif');
figure, imagesc(I);
suptitle('BINARY IMAGE');



SE1A = eye(5);
SE1B = imrotate(SE1A, 90);
SE2 = ones(3);
SE3 = ones(5);
SE4 = [1 1 1];
SE5 = [1 1 1]';

figure,
Ise1AERODE = imerode(I,SE1A);
subplot(1,2,1),imagesc(Ise1AERODE);title('Structure Element 1A (SE1A)');

%figure,
Ise1BERODE = imerode(I,SE1B);
subplot(1,2,2),imagesc(Ise1BERODE);title('Structure Element 1B (SE1B)');
suptitle('EROSION 1 - Structure Element Figures');

figure,
Ise2ERODE = imerode(I,SE2);
subplot(1,2,1),imagesc(Ise2ERODE);title('Structure Element 2 (SE2)');

%figure,
Ise3ERODE= imerode(I,SE3);
subplot(1,2,2),imagesc(Ise3ERODE);title('Structure Element 3 (SE3)');
suptitle('EROSION 2 - Structure Element Figures');
%dislate

figure,
Ise1ADILATE = imdilate(I,SE1A);
subplot(1,2,1),imagesc(Ise1ADILATE);title('Structure Element 1A SE1A');

Ise1BDILATE = imdilate(I,SE1B);
subplot(1,2,2),imagesc(Ise1BDILATE);title('Structure Element 1B SE1B');
suptitle('DILATION 1 - Structure Element Figures');

figure,
Ise2DILATE = imdilate(I,SE2);
subplot(1,2,1),imagesc(Ise2DILATE);title('Structure Element 2 (SE2)');


Ise3DILATE= imdilate(I,SE3);
subplot(1,2,2),imagesc(Ise3DILATE);title('Structure Element 3 (SE3)');
suptitle('DILATION 2 - Structure Element Figures');

%carefully analyze
figure,
D32 = Ise3ERODE-Ise2ERODE;
subplot(1,3,1),imagesc(Ise3ERODE);title('Structure Element 3 (SE3)');
subplot(1,3,2),imagesc(Ise2ERODE);title('Structure Element 2 (SE2)');
subplot(1,3,3),imagesc(D32);title('SE3 -  SE2 (D32)');
suptitle('(D32) ANALYSIS');


%OPEN
figure,
Ise1AOPEN = imopen(I,SE1A);
subplot(1,2,1),imagesc(Ise1AOPEN);title('Structure Element 1A (SE1A)');

%figure,
Ise1BOPEN = imopen(I,SE1B);
subplot(1,2,2),imagesc(Ise1BOPEN);title('Structure Element 1B (SE1B)');
suptitle('OPEN 1 - Structure Element Figures');

figure,
Ise2OPEN = imopen(I,SE2);
subplot(1,2,1),imagesc(Ise2OPEN);title('Structure Element 2 (SE2)');

%figure,
Ise3OPEN= imopen(I,SE3);
subplot(1,2,2),imagesc(Ise3OPEN);title('Structure Element 3 (SE3)');
suptitle('OPEN 2 - Structure Element Figures');

%CLOSE
figure,
Ise1ACLOSE = imclose(I,SE1A);
subplot(1,2,1),imagesc(Ise1ACLOSE);title('Structure Element 1A (SE1A)');

%figure,
Ise1BCLOSE = imclose(I,SE1B);
subplot(1,2,2),imagesc(Ise1BCLOSE);title('Structure Element 1B (SE1B)');
suptitle('CLOSE 1 - Structure Element Figures');

figure,
Ise2CLOSE = imclose(I,SE2);
subplot(1,2,1),imagesc(Ise2CLOSE);title('Structure Element 2 (SE2)');

%figure,
Ise3CLOSE= imclose(I,SE3);
subplot(1,2,2),imagesc(Ise3CLOSE);title('Structure Element 3 (SE3)');
suptitle('CLOSE 2 - Structure Element Figures');
