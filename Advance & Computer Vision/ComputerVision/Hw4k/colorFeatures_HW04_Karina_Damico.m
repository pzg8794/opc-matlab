function [CovaianceMatrix,MatlabCov,MeanVector,Data] = colorFeatures_HW04_Karina_Damico(img)
    imgi=imread(img);
    imgi=im2double(imgi);
    Data=impixel(imgi);
    data_r=Data(:,1);   %extracting red values of pixels
    data_g=Data(:,2);   %%extracting green values of pixels
    data_b=Data(:,3);   %extracting blue values of pixels
    % counting mean for select_r
    sum_r=sum(data_r);
    % counting mean for select_r
    mean_r=sum_r/length(data_r);
    sum_g=sum(data_g);
    % counting mean for select_r
    mean_g=sum_g/length(data_g);
    sum_b=sum(data_b);
    % counting mean for select_r
    mean_b=sum_b/length(data_b);
 
    MeanVector=[mean_r mean_g mean_b];  %Combining Mean Vector
    
    dataM=[(data_r-mean_r),(data_g-mean_g),(data_b-mean_b)];
    n=size(Data,1)-1;
    C11=sum(dataM(:,1).*dataM(:,1))/n;
    C12=sum(dataM(:,1).*dataM(:,2))/n;
    C13=sum(dataM(:,1).*dataM(:,3))/n;
    C21=C12;    %covariance matrix is symmetric along the diagonal
    C22=sum(dataM(:,2).*dataM(:,2))/n;
    C23=sum(dataM(:,2).*dataM(:,3))/n;
    C31=C13;
    C32=C23;
    C33=sum(dataM(:,3).*dataM(:,3))/n;
    CovaianceMatrix=[C11 C12 C13; C21 C22 C23; C31 C32 C33]; %combining Coavriance Matrix together
    
    MatlabCov=cov(Data);
    
    end
 