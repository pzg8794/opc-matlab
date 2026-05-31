%this script will run the functions to test different combinations of color
%histogram attributes

%% Load Images
%only needs to be run once, eventually may pick out verification set
loadTrainImages
loadTestImages


%% Feature Extraction
UseAverageHist = true;
ConvertColorSpaceTo = 1; %1=YCrCb, 2=HSV, 3=LST, 4=LAB, 0/other = None(RGB)
%Choice of color space and combination method, Classes kept seperated

[coast_avgs, coast_hists] = combColorHist(Coasts,UseAverageHist,ConvertColorSpaceTo);
[forest_avgs, forest_hists] = combColorHist(Forests,UseAverageHist,ConvertColorSpaceTo);
[highway_avgs, highway_hists] = combColorHist(Highways,UseAverageHist,ConvertColorSpaceTo);
[mountain_avgs, mountain_hists] = combColorHist(Mountains,UseAverageHist,ConvertColorSpaceTo);
[building_avgs, building_hists] = combColorHist(TallBuildings,UseAverageHist,ConvertColorSpaceTo);

%Possible feature weighting based on Comparision

%% Stat Comparision
categoryHist = cell(5,1);
categoryHist{1} = coast_avgs;
categoryHist{2} = forest_avgs;
categoryHist{3} = highway_avgs;
categoryHist{4} = mountain_avgs;
categoryHist{5} = building_avgs;

featHists = cell(5,1);
featHists{1} = coast_hists;
featHists{2} = forest_hists;
featHists{3} = highway_hists;
featHists{4} = mountain_hists;
featHists{5} = building_hists;

    
    %% Inter-class feature comparison
    %outer by inner
    maxCovs_f = zeros(5,5);
    avgpHist_f = zeros(5,5,3);
    %compares classes avg hist set to other classes avg hist set
    for bC = 1:5
        for tC = 1:5
            [maxCovs_f(bC,tC,:), avgpHist_f(bC,tC,:), ~ ] = doHistIntersect(categoryHist{bC},categoryHist{tC},0,0);
        end
    end
    var(maxCovs_f) %higher inter-class variance is better
    
    %% Intra-class comparison
    maxCovs_v = zeros(70,5);
    avgpHist_v = zeros(70,5,3);
    
    for bC = 1:5
        %assuming all classes are the same size!
        for tC = 1:size(coast_hists,1)
            [maxCovs_v(tC,bC), avgpHist_v(tC,bC,:), ~ ] = doHistIntersect(categoryHist{bC},featHists{bC},0,tC);
        end
    end
    
    %% Inter-class seperation comparison
    %toomany?
    maxCovs_c = zeros(5,5,(size(coast_hists,1)/5)); 
    avgpHist_c = zeros(5,5,(size(coast_hists,1)/5),3);
    %base class
    for bC = 1:5
        %comparison class
        for iC = 1:5
            %test images, divs of 5
            for tC = 1:(size(coast_hists,1)/5)
                [maxCovs_c(bC,iC,tC), avgpHist_c(bC,iC,tC,:), ~] = doHistIntersect(categoryHist{bC},featHists{iC},0,tC);
            end
        end
    end
%% Classification Comparison
    %% Train / Verficiation Data Seperation
    ConvertColorSpaceTo = 4; %1=YCrCb, 2=HSV, 3=LST, 4=LAB, 0/other = None(RGB)
    blockCount = 6;
    histBins = 16;
    numTrainImgs = 70;
    numVerifyImgs = 30;
    pcNum = 50;
    featureSelection = 1; %fs(0) = histOnly, fs(1) = hist+int, fs(x) = int
    %Training Set
    [coast_avgs_t, coast_hists_t] = combColorHist(Coasts(1:numTrainImgs),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [forest_avgs_t, forest_hists_t] = combColorHist(Forests(1:numTrainImgs),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [highway_avgs_t, highway_hists_t] = combColorHist(Highways(1:numTrainImgs),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [mountain_avgs_t, mountain_hists_t] = combColorHist(Mountains(1:numTrainImgs),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [building_avgs_t, building_hists_t] = combColorHist(TallBuildings(1:numTrainImgs),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    %Verification set, not allowed to have average feature comparison
%     [~, coast_hists_v] = combColorHist(Coasts(1+numTrainImgs:70),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
%     [~, forest_hists_v] = combColorHist(Forests(1+numTrainImgs:70),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
%     [~, highway_hists_v] = combColorHist(Highways(1+numTrainImgs:70),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
%     [~, mountain_hists_v] = combColorHist(Mountains(1+numTrainImgs:70),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
%     [~, building_hists_v] = combColorHist(TallBuildings(1+numTrainImgs:70),UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    %Test set verification
    [~, coast_hists_v] = combColorHist(Coasts_test,UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [~, forest_hists_v] = combColorHist(Forests_test,UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [~, highway_hists_v] = combColorHist(Highways_test,UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [~, mountain_hists_v] = combColorHist(Mountains_test,UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);
    [~, building_hists_v] = combColorHist(Buildings_test,UseAverageHist,ConvertColorSpaceTo,blockCount,histBins);

      
    %% Avg Intersection Feature
    coast_intersections_t = zeros(numTrainImgs,blockCount,3,histBins);
    forest_intersections_t = zeros(numTrainImgs,blockCount,3,histBins);
    highway_intersections_t = zeros(numTrainImgs,blockCount,3,histBins);
    mountain_intersections_t = zeros(numTrainImgs,blockCount,3,histBins);
    building_intersections_t = zeros(numTrainImgs,blockCount,3,histBins);
    
    coast_intersections_v = zeros(numVerifyImgs,blockCount,3,histBins);
    forest_intersections_v = zeros(numVerifyImgs,blockCount,3,histBins);
    highway_intersections_v = zeros(numVerifyImgs,blockCount,3,histBins);
    mountain_intersections_v = zeros(numVerifyImgs,blockCount,3,histBins);
    building_intersections_v = zeros(numVerifyImgs,blockCount,3,histBins);
    
    for index = 1:numTrainImgs
        [~, ~, coast_intersections_t(index,:,:,:)] = doHistIntersect(coast_avgs_t,coast_hists_t,0,index,blockCount,histBins);
        [~, ~, forest_intersections_t(index,:,:,:)] = doHistIntersect(forest_avgs_t,forest_hists_t,0,index,blockCount,histBins);
        [~, ~, highway_intersections_t(index,:,:,:)] = doHistIntersect(highway_avgs_t,highway_hists_t,0,index,blockCount,histBins);
        [~, ~, mountain_intersections_t(index,:,:,:)] = doHistIntersect(mountain_avgs_t,mountain_hists_t,0,index,blockCount,histBins);
        [~, ~, building_intersections_t(index,:,:,:)] = doHistIntersect(building_avgs_t,building_hists_t,0,index,blockCount,histBins);
    end
    for index = 1:numVerifyImgs
        [~, ~, coast_intersections_v(index,:,:,:)] = doHistIntersect(coast_avgs_t,coast_hists_v,0,index,blockCount,histBins);
        [~, ~, forest_intersections_v(index,:,:,:)] = doHistIntersect(forest_avgs_t,forest_hists_v,0,index,blockCount,histBins);
        [~, ~, highway_intersections_v(index,:,:,:)] = doHistIntersect(highway_avgs_t,highway_hists_v,0,index,blockCount,histBins);
        [~, ~, mountain_intersections_v(index,:,:,:)] = doHistIntersect(mountain_avgs_t,mountain_hists_v,0,index,blockCount,histBins);
        [~, ~, building_intersections_v(index,:,:,:)] = doHistIntersect(building_avgs_t,building_hists_v,0,index,blockCount,histBins);
    end
    %% Feature Creation
    
    %Flatten samples 
    coast_flat_hists_t = reshape(coast_hists_t,numTrainImgs,blockCount*3*histBins);
    forest_flat_hists_t = reshape(forest_hists_t,numTrainImgs,blockCount*3*histBins);
    highway_flat_hists_t = reshape(highway_hists_t,numTrainImgs,blockCount*3*histBins);
    mountain_flat_hists_t = reshape(mountain_hists_t,numTrainImgs,blockCount*3*histBins);
    building_flat_hists_t = reshape(building_hists_t,numTrainImgs,blockCount*3*histBins);
    
    coast_flat_hists_v = reshape(coast_hists_v,numVerifyImgs,blockCount*3*histBins);
    forest_flat_hists_v = reshape(forest_hists_v,numVerifyImgs,blockCount*3*histBins);
    highway_flat_hists_v = reshape(highway_hists_v,numVerifyImgs,blockCount*3*histBins);
    mountain_flat_hists_v = reshape(mountain_hists_v,numVerifyImgs,blockCount*3*histBins);
    building_flat_hists_v = reshape(building_hists_v,numVerifyImgs,blockCount*3*histBins);
    
    if(featureSelection == 0)

        %Leave off the intersection (either or with below)
        coast_feat_t = coast_flat_hists_t;
        forest_feat_t = forest_flat_hists_t;
        highway_feat_t = highway_flat_hists_t;
        mountain_feat_t = mountain_flat_hists_t;
        building_feat_t = building_flat_hists_t;
        coast_feat_v = coast_flat_hists_v;
        forest_feat_v = forest_flat_hists_v;
        highway_feat_v = highway_flat_hists_v;
        mountain_feat_v = mountain_flat_hists_v;
        building_feat_v = building_flat_hists_v;
    elseif(featureSelection == 1)

        %Concat intersection with raw block output
        coast_feat_t = [coast_flat_hists_t, reshape(coast_intersections_t,numTrainImgs,blockCount*3*histBins)];
        forest_feat_t = [forest_flat_hists_t, reshape(forest_intersections_t,numTrainImgs,blockCount*3*histBins)];
        highway_feat_t = [highway_flat_hists_t, reshape(highway_intersections_t,numTrainImgs,blockCount*3*histBins)];
        mountain_feat_t = [mountain_flat_hists_t, reshape(mountain_intersections_t,numTrainImgs,blockCount*3*histBins)];
        building_feat_t = [building_flat_hists_t, reshape(building_intersections_t,numTrainImgs,blockCount*3*histBins)];

        coast_feat_v = [coast_flat_hists_v, reshape(coast_intersections_v,numVerifyImgs,blockCount*3*histBins)];
        forest_feat_v = [forest_flat_hists_v, reshape(forest_intersections_v,numVerifyImgs,blockCount*3*histBins)];
        highway_feat_v = [highway_flat_hists_v, reshape(highway_intersections_v,numVerifyImgs,blockCount*3*histBins)];
        mountain_feat_v = [mountain_flat_hists_v, reshape(mountain_intersections_v,numVerifyImgs,blockCount*3*histBins)];
        building_feat_v = [building_flat_hists_v, reshape(building_intersections_v,numVerifyImgs,blockCount*3*histBins)];
    else

        %Just Intersections
        coast_feat_t = reshape(coast_intersections_t,numTrainImgs,blockCount*3*histBins);
        forest_feat_t = reshape(forest_intersections_t,numTrainImgs,blockCount*3*histBins);
        highway_feat_t = reshape(highway_intersections_t,numTrainImgs,blockCount*3*histBins);
        mountain_feat_t = reshape(mountain_intersections_t,numTrainImgs,blockCount*3*histBins);
        building_feat_t = reshape(building_intersections_t,numTrainImgs,blockCount*3*histBins);
        
        coast_feat_v = reshape(coast_intersections_v,numVerifyImgs,blockCount*3*histBins);
        forest_feat_v = reshape(forest_intersections_v,numVerifyImgs,blockCount*3*histBins);
        highway_feat_v = reshape(highway_intersections_v,numVerifyImgs,blockCount*3*histBins);
        mountain_feat_v = reshape(mountain_intersections_v,numVerifyImgs,blockCount*3*histBins);
        building_feat_v = reshape(building_intersections_v,numVerifyImgs,blockCount*3*histBins);
    end
       
    
    %% Dimension Reduction
    [trainComps, ~, trainEVals] = princomp([coast_feat_t; forest_feat_t; highway_feat_t; mountain_feat_t; building_feat_t;]);
    plot(trainEVals);
    useComps = trainComps(:,1:pcNum);
    %Reduce
    coast_pc_t = coast_feat_t*useComps;
    forest_pc_t = forest_feat_t*useComps;
    highway_pc_t = highway_feat_t*useComps;
    mountain_pc_t = mountain_feat_t*useComps;
    building_pc_t = building_feat_t*useComps;

    coast_pc_v = coast_feat_v*useComps;
    forest_pc_v = forest_feat_v*useComps;
    highway_pc_v = highway_feat_v*useComps;
    mountain_pc_v = mountain_feat_v*useComps;
    building_pc_v = building_feat_v*useComps;

    %% Train SVM
    trainData = [coast_pc_t; forest_pc_t; highway_pc_t; mountain_pc_t; building_pc_t;];
    trainCoastLabel = [ones(numTrainImgs,1); zeros(4*numTrainImgs,1);];
    trainForestLabel = [zeros(numTrainImgs,1); ones(numTrainImgs,1); zeros(3*numTrainImgs,1);];
    trainHighwayLabel = [zeros(2*numTrainImgs,1); ones(numTrainImgs,1); zeros(2*numTrainImgs,1);];
    trainMountainLabel = [zeros(3*numTrainImgs,1); ones(numTrainImgs,1); zeros(1*numTrainImgs,1);];
    trainBuildingLabel = [zeros(4*numTrainImgs,1); ones(numTrainImgs,1);];
    %Training Settings
    categoryNames = cell(1,5);
    categoryNames{1} = 'Coast';
    categoryNames{2} = 'Forest';
    categoryNames{3} = 'Highway';
    categoryNames{4} = 'Mountain';
    categoryNames{5} = 'Building';
    %Autoscale to center at mean and unity standard deviation
    scaleVector = [true,true,true,true,true];
    %Kernel function type
    classKernels = cell(1,5);
    classKernels{1} = 'quadratic';
    classKernels{2} = 'linear';
    classKernels{3} = 'linear';
    classKernels{4} = 'quadratic';
    classKernels{5} = 'linear';
    
    %Violation Percentage Vector
    violateVector = [1,1,1,1,1];
    %Training attempts
    disp('Coast Train');
    coastHistSVM = svmtrain(trainData, trainCoastLabel,'autoscale', scaleVector(1), 'kernel_function', classKernels{1}, 'kktviolationlevel', violateVector(1));
    disp('Forest Train');
    forestHistSVM = svmtrain(trainData, trainForestLabel,'autoscale', scaleVector(2),'kernel_function', classKernels{2}, 'kktviolationlevel', violateVector(2));
    disp('Highway Train');
    highwayHistSVM = svmtrain(trainData, trainHighwayLabel,'autoscale', scaleVector(3),'kernel_function', classKernels{3}, 'kktviolationlevel', violateVector(3));
    disp('Mountain Train');
    mountainHistSVM = svmtrain(trainData, trainMountainLabel,'autoscale', scaleVector(4),'kernel_function', classKernels{4}, 'kktviolationlevel', violateVector(4));
    disp('Building Train');
    buildingHistSVM = svmtrain(trainData, trainBuildingLabel,'autoscale', scaleVector(5),'kernel_function', classKernels{5}, 'kktviolationlevel', violateVector(5));
    %Look at training results
    coastTrainError = svmclassify(coastHistSVM,trainData);
    forestTrainError = svmclassify(forestHistSVM,trainData);
    highwayTrainError = svmclassify(highwayHistSVM,trainData);
    mountainTrainError = svmclassify(mountainHistSVM,trainData);
    buildingTrainError = svmclassify(buildingHistSVM,trainData);
    coastCompare_t = sum(abs(coastTrainError-trainCoastLabel));
    forestCompare_t = sum(abs(forestTrainError-trainForestLabel));
    highwayCompare_t = sum(abs(highwayTrainError-trainHighwayLabel));
    mountainCompare_t = sum(abs(mountainTrainError-trainMountainLabel));
    buildingCompare_t = sum(abs(buildingTrainError-trainBuildingLabel));
    disp('Train done');
    %% Test SVM
    verifyData = [coast_pc_v; forest_pc_v; highway_pc_v; mountain_pc_v; building_pc_v;];
    coastResults = svmclassify(coastHistSVM,verifyData);
    forestResults = svmclassify(forestHistSVM,verifyData);
    highwayResults = svmclassify(highwayHistSVM,verifyData);
    mountainResults = svmclassify(mountainHistSVM,verifyData);
    buildingResults = svmclassify(buildingHistSVM,verifyData);
    %Report test results
    verifyCoastLabel = [ones(numVerifyImgs,1); zeros(4*numVerifyImgs,1);];
    verifyForestLabel = [zeros(numVerifyImgs,1); ones(numVerifyImgs,1); zeros(3*numVerifyImgs,1);];
    verifyHighwayLabel = [zeros(2*numVerifyImgs,1); ones(numVerifyImgs,1); zeros(2*numVerifyImgs,1);];
    verifyMountainLabel = [zeros(3*numVerifyImgs,1); ones(numVerifyImgs,1); zeros(1*numVerifyImgs,1);];
    verifyBuildingLabel = [zeros(4*numVerifyImgs,1); ones(numVerifyImgs,1);];
    %Compare
    coastCompare = sum(abs(coastResults-verifyCoastLabel));
    forestCompare = sum(abs(forestResults-verifyForestLabel));
    highwayCompare = sum(abs(highwayResults-verifyHighwayLabel));
    mountainCompare = sum(abs(mountainResults-verifyMountainLabel));
    buildingCompare = sum(abs(buildingResults-verifyBuildingLabel));
    resultsVector = [coastCompare; coastCompare/(5*numVerifyImgs)];
    resultsVector = cat(2,resultsVector,[forestCompare; forestCompare/(5*numVerifyImgs)]);
    resultsVector = cat(2,resultsVector,[highwayCompare; highwayCompare/(5*numVerifyImgs)]);
    resultsVector = cat(2,resultsVector,[mountainCompare; mountainCompare/(5*numVerifyImgs)]);
    resultsVector = cat(2,resultsVector,[buildingCompare; buildingCompare/(5*numVerifyImgs)]);
    %Display as a percent
    fprintf('Coast %d(%f)\n', coastCompare, coastCompare/(numVerifyImgs));
    %
    fprintf('Forest %d(%f)\n',forestCompare, forestCompare/(numVerifyImgs));
    %
    fprintf('Highway %d(%f)\n',highwayCompare, highwayCompare/(numVerifyImgs));
    %
    (fprintf('Mountain %d(%f)\n',mountainCompare, mountainCompare/(numVerifyImgs)));
    %
    (fprintf('Building %d(%f)\n',buildingCompare, buildingCompare/(numVerifyImgs)));
    %
    
    %% Writing Settings and Results out to Excel
    sheetSpace = 'LAB3';
    sheetName = 'test_CH.xlsx';
    xlswrite(sheetName,{'SVM Settings'},sheetSpace,'A1');
    xlswrite(sheetName,categoryNames,sheetSpace,'A4');
    xlswrite(sheetName,classKernels,sheetSpace,'A2');
    xlswrite(sheetName,{'# of PCs'},sheetSpace,'A3');
    xlswrite(sheetName,pcNum,sheetSpace,'B3');
    xlswrite(sheetName,{'Num Blocks'},sheetSpace,'C3');
    xlswrite(sheetName,blockCount,sheetSpace,'D3');
    xlswrite(sheetName,{'Feature/Color code'},sheetSpace,'E3');
    xlswrite(sheetName,[featureSelection ConvertColorSpaceTo],sheetSpace,'F3');
    %xlswrite(sheetName,resultsVector ,sheetSpace,'A5');
    xlswrite(sheetName,coastResults-verifyCoastLabel,sheetSpace,'A5');
    xlswrite(sheetName,forestResults-verifyForestLabel,sheetSpace,'B5');
    xlswrite(sheetName,highwayResults-verifyHighwayLabel,sheetSpace,'C5');
    xlswrite(sheetName,mountainResults-verifyMountainLabel,sheetSpace,'D5');
    xlswrite(sheetName,buildingResults-verifyBuildingLabel,sheetSpace,'E5');
    
    