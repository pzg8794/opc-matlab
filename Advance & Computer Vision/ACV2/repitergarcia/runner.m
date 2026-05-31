%% INITIALISATION
clc
clear
close all

% Parameters

%tstart = tic;
%nbErrors = 0;

imageSize = 128; 
orientationsPerScale = [4 4 4];
numberBlocks = 4;

G = createGabor(orientationsPerScale, imageSize);

%Create feature vectors and target matrixes

%fv_matrix = zeros(5,20000);
%target_matrix = zeros(5,2000);

%% Extract names of images
cd /Users/molochinsky/Documents/BOTAN/Zima/ACV/Gabor/coast
ImagesCoast = dir ('*.jpg');
cd ..

cd forest
ImagesForest = dir ('*.jpg');
cd ..

cd highway
ImagesHighway = dir ('*.jpg');
cd ..

cd mountain
ImagesMountain = dir ('*.jpg');
cd ..

cd tallbuilding
ImagesTallBuilding = dir ('*.jpg');
cd ..


% Remove unuseful data
%ImagesCoast = ImagesCoast(3:end);
%ImagesForest = ImagesForest(3:end);
%ImagesHighway = ImagesHighway(3:end);
%ImagesMountain = ImagesMountain(3:end);
%ImagesTallBuilding = ImagesTallBuilding(3:end);

%% Compute feature vectors
Gcoast = zeros(1,576,69);
Gforest = zeros(1,576,69);
Ghighway = zeros(1,576,69);
Gmountain = zeros(1,576,69);
GtallBuilding = zeros(1,576,69);

CHcoast = zeros(1,8,69);
CHforest = zeros(1,8,69);
CHhighway = zeros(1,8,69);
CHmountain = zeros(1,8,69);
CHtallBuilding = zeros(1,8,69);


%for i = 1:size(ImagesCoast)
%    Gcoast(:,:,i) = gistGabor(ImagesCoast(i).name);
%    Gforest(:,:,i) = gistGabor(ImagesForest(i).name);
%    Ghighway(:,:,i) = gistGabor(ImagesHighway(i).name);
%    Gmountain(:,:,i) = gistGabor(ImagesMountain(i).name);
%    GtallBuilding(:,:,i) = gistGabor(ImagesTallBuilding(i).name);
%end

for i = 1:size(ImagesCoast)
    Gcoast(:,:,i) = gistGabor(ImagesCoast(i).name);
    Gforest(:,:,i) = gistGabor(ImagesForest(i).name);
    Ghighway(:,:,i) = gistGabor(ImagesHighway(i).name);
    Gmountain(:,:,i) = gistGabor(ImagesMountain(i).name);
    GtallBuilding(:,:,i) = gistGabor(ImagesTallBuilding(i).name);
end

for i = 1:size(ImagesCoast)
    CHcoast(:,:,i) = colorHist(ImagesCoast(i).name);
    CHforest(:,:,i) = colorHist(ImagesForest(i).name);
    CHhighway(:,:,i) = colorHist(ImagesHighway(i).name);
    CHmountain(:,:,i) = colorHist(ImagesMountain(i).name);
    CHtallBuilding(:,:,i) = colorHist(ImagesTallBuilding(i).name);
end

% Calculate averages
avgCoast = mean(Gcoast,3);
avgForest = mean(Gforest,3);
avgHighway = mean(Ghighway,3);
avgMountain = mean(Gmountain,3);
avgTallBuilding = mean(GtallBuilding,3);

%Correlation scores
sum_c = 0;
sum_f = 0;
sum_h = 0;
sum_m = 0;
sum_tb = 0;
sum_cc = 0;
sum_cf = 0;
sum_ch = 0;
sum_cm = 0;
sum_ctb = 0;
sum_fh = 0;
sum_fm = 0;
sum_ftb = 0;
sum_ff = 0;
sum_hm = 0;
sum_htb = 0;
sum_hh = 0;
sum_mtb = 0;
sum_mm = 0;
sum_tbtb = 0;

for i=1:69
    sum_c = sum_c + sum((Gcoast(:,:,i) - avgCoast).^2);
    sum_f = sum_f + sum((Gforest(:,:,i) - avgForest).^2);
    sum_h = sum_h + sum((Ghighway(:,:,i) - avgHighway).^2);
    sum_m = sum_m + sum((Gmountain(:,:,i) - avgMountain).^2);
    sum_tb = sum_tb + sum(GtallBuilding(:,:,i) - avgTallBuilding);
    sum_cc = sum_cc + sum((Gcoast(:,:,i) - avgCoast).*(Gcoast(:,:,i) - avgCoast));
    sum_cf = sum_cf + sum((Gcoast(:,:,i) - avgCoast).*(Gforest(:,:,i) - avgForest));
    sum_ch = sum_ch + sum((Gcoast(:,:,i) - avgCoast).*(Ghighway(:,:,i) - avgHighway));
    sum_cm = sum_cm + sum((Gcoast(:,:,i) - avgCoast).*(Gmountain(:,:,i) - avgMountain));
    sum_ctb = sum_ctb + sum((Gcoast(:,:,i) - avgCoast).*(GtallBuilding(:,:,i) - avgTallBuilding));
    sum_fh = sum_fh + sum((Gforest(:,:,i) - avgForest).*(Ghighway(:,:,i) - avgHighway));
    sum_fm = sum_fm + sum((Gforest(:,:,i) - avgForest).*(Gmountain(:,:,i) - avgMountain));
    sum_ftb = sum_ftb + sum((Gforest(:,:,i) - avgForest).*(GtallBuilding(:,:,i) - avgTallBuilding));
    sum_ff = sum_ff + sum((Gforest(:,:,i) - avgForest).*(Gforest(:,:,i) - avgForest));
    sum_hm = sum_hm + sum((Ghighway(:,:,i) - avgHighway).*(Gmountain(:,:,i) - avgMountain));
    sum_htb = sum_htb + sum((Ghighway(:,:,i) - avgHighway).*(GtallBuilding(:,:,i) - avgTallBuilding));
    sum_hh = sum_hh + sum((Ghighway(:,:,i) - avgHighway).*(Ghighway(:,:,i) - avgHighway));
    sum_mtb = sum_mtb + sum((Gmountain(:,:,i) - avgMountain).*(GtallBuilding(:,:,i) - avgTallBuilding));
    sum_mm = sum_mm + sum((Gmountain(:,:,i) - avgMountain).*(Gmountain(:,:,i) - avgMountain));
    sum_tbtb = sum_tbtb + sum((GtallBuilding(:,:,i) - avgTallBuilding).*(GtallBuilding(:,:,i) - avgTallBuilding));
    
end
c_c = sum_cc/sqrt(sum_c.*sum_c);
c_f = sum_cf/sqrt(sum_c.*sum_f);
c_h = sum_ch/sqrt(sum_c.*sum_h);
c_m = sum_cm/sqrt(sum_c.*sum_m);
c_tb = sum_ctb/sqrt(sum_c.*sum_tb);

f_h = sum_fh/sqrt(sum_f.*sum_h);
f_m = sum_fm/sqrt(sum_f.*sum_m);
f_tb = sum_ftb/sqrt(sum_f.*sum_tb);
f_f = sum_ff/sqrt(sum_f.*sum_f);

h_m = sum_hm/sqrt(sum_h.*sum_m);
h_tb = sum_htb/sqrt(sum_h.*sum_tb);
h_h = sum_hh/sqrt(sum_h.*sum_h);
m_tb = sum_mtb/sqrt(sum_m.*sum_tb);
m_m = sum_mm/sqrt(sum_m.*sum_m);

tb_tb = sum_tbtb/sqrt(sum_tb.*sum_tb);

%% Test images

%save karina_hist.mat Gcoast Gforest Ghighway Gmountain GtallBuilding ImTest

cd Images_testing
ImagesNames = dir ('*.jpg');
ImTest = zeros(1,576,size(ImagesNames));

CHTest = zeros(1,8,150);

for i = 1:size(ImagesNames)
    CHTest(:,:,i) = colorHist(ImagesNames(i).name);
end

for i = 1:size(ImagesNames)
    ImTest(:,:,i) = gabor_vector(ImagesNames(i).name);
     % ImTest = gabor_vector(ImagesNames(i).name);
    
    % Calculate differences with quadratic method
    % diffCoast = (ImTest.^2 - avgCoast.^2);
    % diffForest = (ImTest.^2 - avgForest.^2);
    % diffHighway = (ImTest.^2 - avgHighway.^2);
    % diffMountain = (ImTest.^2 - avgMountain.^2);
    % diffTallBuilding = (ImTest.^2 - avgTallBuilding.^2);
    % dc = mean(diffCoast);
    % df = mean(diffForest); 
    % dh = mean(diffHighway);
    % dm = mean(diffMountain); 
    % dtb = mean(diffTallBuilding);
   % dc = norm(ImTest - avgCoast);
    %df = norm(ImTest - avgForest);
    %dh = norm(ImTest - avgHighway);
    %dm = norm(ImTest - avgMountain);
    %dtb = norm(ImTest - avgTallBuilding);
     %differences = [dc df dh dm dtb];
%optDiff = min(abs(differences));

    %Calculate differences with histogram intersection method
    dc = sum(min(avgCoast,ImTest))/min(sum(avgCoast),sum(ImTest));
    df = sum(min(avgForest,ImTest))/min(sum(avgForest),sum(ImTest));
    dh = sum(min(avgHighway,ImTest))/min(sum(avgHighway),sum(ImTest));
    dm = sum(min(avgMountain,ImTest))/min(sum(avgMountain),sum(ImTest));
    dtb = sum(min(avgTallBuilding,ImTest))/min(sum(avgTallBuilding),sum(ImTest));
    differences = [dc df dh dm dtb];
    optDiff = max(differences);


    if (optDiff == dc)
       % disp(['Image ' ImagesNames(i).name ' is a coast']);
       if (~strcmp(ImagesNames(i).name(1:2),'co'))
            nbErrors = nbErrors + 1;
       end
    elseif (optDiff == df)
%         disp(['Image ' ImagesNames(i).name ' is a forest']);
       if (~strcmp(ImagesNames(i).name(1:2),'fo'))
          nbErrors = nbErrors + 1;
        end
    elseif (optDiff == dh)
%         disp(['Image ' ImagesNames(i).name ' is a highway']);
        if (~strcmp(ImagesNames(i).name(1:2),'hi'))
           nbErrors = nbErrors + 1;
        end
   elseif (optDiff == dm)
%         disp(['Image ' ImagesNames(i).name ' is a mountain']);
        if (~strcmp(ImagesNames(i).name(1:2),'mo'))
            nbErrors = nbErrors + 1;
       end
    else 
%         disp(['Image ' ImagesNames(i).name ' is a tall building']);
       if (~strcmp(ImagesNames(i).name(1:2),'ta'))
            nbErrors = nbErrors + 1;
        end
    end
end
%% Display

totalTime = toc(tstart);
disp (['Total computation time: ' int2str(totalTime)]);
disp (['Total number of misclassifications: ' int2str(nbErrors) '/' int2str(length(ImagesNames))]);


