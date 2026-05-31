%append and scale Pauline
load pauline_CT.mat
load karina_gist.mat
load CHfeatures.mat


%create target

target = zeros(5,345);
target(1,1:69) = 1;
target(2,1+69:69+69) = 1;
target(3,1+69+69:69+69+69) = 1;
target(4,1+69+69+69:69+69+69+69) = 1;
target(5,1+69+69+69+69:69+69+69+69+69) = 1;

target_opt = zeros(5,150);
target_opt(1,1:30) = 1;
target_opt(2,1+30:30+30) = 1;
target_opt(3,1+30+30:30+30+30) = 1;
target_opt(4,1+30+30+30:30+30+30+30) = 1;
target_opt(5,1+30+30+30+30:30+30+30+30+30) = 1;

%%%%%%%%%%%%%%%%%%%

gist = zeros(345,576);
for f=1:69
gist(f,:) = Gicoast(:,:,f);
end

for f=70:69+69
gist(f,:) = Giforest(:,:,f-69);
end

for f=70+69:69+69+69
gist(f,:) = Gihighway(:,:,f-69-69);
end

for f=70+69+69:69+69+69+69
gist(f,:) = Gimountain(:,:,f-69-69-69);
end

for f=70+69+69+69:69+69+69+69+69
gist(f,:) = GitallBuilding(:,:,f-69-69-69-69);
end

gist=gist';


%%%%%%%

gistTest = zeros(150,576);


for f=1:150
gistTest(f,:) = ImTestGist(1,:,f);
end 
gistTest = gistTest';

%%%%%%%%%%%%%%%%%%%%%%%%%%%

CTinp = zeros(345,160);
for f=1:69
CTinp(f,:) = CTcoast(:,:,f);
end

for f=70:69+69
CTinp(f,:) = CTforest(:,:,f-69);
end

for f=70+69:69+69+69
CTinp(f,:) = CThighway(:,:,f-69-69);
end

for f=70+69+69:69+69+69+69
CTinp(f,:) = CTmountain(:,:,f-69-69-69);
end

for f=70+69+69+69:69+69+69+69+69
CTinp(f,:) = CTtallBuilding(:,:,f-69-69-69-69);
end

CTinp = CTinp';

%%%%%%%%%%%%%%%%%%

CHinp = zeros(345,8);
for f=1:69
CHinp(f,:) = CHcoast(:,:,f);
end

for f=70:69+69
CHinp(f,:) = CHforest(:,:,f-69);
end

for f=70+69:69+69+69
CHinp(f,:) = CHhighway(:,:,f-69-69);
end

for f=70+69+69:69+69+69+69
CHinp(f,:) = CHmountain(:,:,f-69-69-69);
end

for f=70+69+69+69:69+69+69+69+69
CHinp(f,:) = CHtallBuilding(:,:,f-69-69-69-69);
end

CHinp = CHinp';
%%%%%%%%%%%%%%%%%%%%%%

CTtest = zeros(150,160);
for f=1:150
CTtest(f,:) = ImTest(1,:,f);
end 
CTtest = CTtest';

%%%%%%%%%%%%%%%%%%%%%
CHtesty = zeros(150,8);
for f=1:150
CHtesty(f,:) = CHTest(1,:,f);
end 
CHtesty = CHtesty';


mingist = min(gist(:));
maxgist = max(gist(:));
minCT = min(CTinp(:));
maxCT = max(CTinp(:));
minCH = min(CHinp(:));
maxCH = max(CHinp(:));

gistSc = (gist - mingist)./maxgist;
gistTestSc =(gistTest - mingist)./maxgist;

CTinpSc = (CTinp - minCT)./maxCT;
CTtestSc = (CTtest - minCT)./maxCT;

CHinpSc = (CHinp - minCH)./maxCH;
CHtestSc = (CHtesty - minCH)./maxCH;

GCTinp = [gistSc; CTinpSc];
GCTtest = [gistTestSc;CTtestSc];

GCHinp = [gistSc; CHinpSc];
GCHtest = [gistTestSc; CHtestSc];

CTCHinp = [CTinpSc; CHinpSc];
CTCHtest = [CTtestSc; CHtestSc];

GCTCHinp = [gistSc; CTinpSc; CHinpSc];
GCTCHtest = [gistTestSc; CTtestSc; CHtestSc];

