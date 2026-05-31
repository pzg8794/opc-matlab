%Piter Garcia
%Homework 3 Second Part
%Date 09/31/2012

im = imread('Auto10.jpg');
%figure, imshow(im);

figure,
im2= im2double(im);
subplot(2, 2, 1),imshow(im2); title('Iam2Double');

im3= rgb2gray(im2);
subplot(2, 2, 2),imshow(im3); title('Rgb2Gray');

im4= imresize(im3, [167 250]);
subplot(2, 2, 3),imshow(im4); title('Rgb-Resized');

im5=edge(im4,'canny',[],0.5); 
subplot(2, 2, 4),imshow(im5); title('Gamma = 0.5');

suptitle('Transforming Image to Find Edges');

i=0.5;
figure,
for i=1:4,
    
    imm=edge(im4,'canny',[],0.4 + i./10);
    subplot(2, 2, i),imshow(imm); 
    
    if i==1
      title('Gamma = 0.5');
    end;
  
    if i==2
      title('Gamma = 0.6');
    end;
    if i==3
      title('Gamma = 0.7');
    end;
    if i==4
      title('Gamma = 0.8');
    end;   
end; 
suptitle('Finding Edges of an Image Gamma 0.5-0.8');


figure,
for x=1:4,
  
    imm=edge(im4,'canny',[],0.8 + x./10);
    subplot(2, 2, x),imshow(imm);
  
    if i==1
      title('Gamma = 0.9');
    end;
  
    if i==2
      title('Gamma = 1.0');
    end;
    if i==3
      title('Gamma = 1.1');
    end;
    if i==4
      title('Gamma = 1.2');
    end;     
end; 
suptitle('Finding Edges with Canny');
    E=edge(imm,'canny', 0.1);

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
				    if d < 2
                		H(iRho,iTheta) = H(iRho, iTheta) + 1;
                    end;
                end;
            end;
        end;
    end;


i=0.5;
figure,
for i=1:4,    
    imm=edge(im4,'canny',[],0.4 + i./10);
    subplot(2, 2, i),imshow(imm); 
    
    bw = edge(imm, 'canny', [], 2);
    imshow(bw);
    [H,theta,rho] = hough(bw);
    peaks  = houghpeaks(H,50);
    lines = houghlines(bw,theta,rho,peaks);
    imshow(bw)
    hold on
    for k = 1:numel(lines)
        x1 = lines(k).point1(1);
        y1 = lines(k).point1(2);
        x2 = lines(k).point2(1);
        y2 = lines(k).point2(2);
        plot([x1 x2],[y1 y2],'Color','g','LineWidth', 4)
    end
    hold off
    
    if i==1
      title('Gamma = 0.5');
    end;
  
    if i==2
      title('Gamma = 0.6');
    end;
    if i==3
      title('Gamma = 0.7');
    end;
    if i==4
      title('Gamma = 0.8');
    end;  
    
end; 
suptitle('Finding Edges of an Image Gamma 0.5-0.8');


figure,
for x=1:4,
  
    imm=edge(im4,'canny',[],0.8 + x./10);
    subplot(2, 2, x),imshow(imm);
  
    bw = edge(imm, 'canny', [], 2);
    imshow(bw);
    [H,theta,rho] = hough(bw);
    peaks  = houghpeaks(H,50);
    lines = houghlines(bw,theta,rho,peaks);
    imshow(bw)
    hold on
    
    for k = 1:numel(lines)
        x1 = lines(k).point1(1);
        y1 = lines(k).point1(2);
        x2 = lines(k).point2(1);
        y2 = lines(k).point2(2);
        plot([x1 x2],[y1 y2],'Color','g','LineWidth', 4)
    end
    hold off
    
    
    if i==1
      title('Gamma = 0.9');
    end;
  
    if i==2
      title('Gamma = 1.0');
    end;
    
    if i==3
      title('Gamma = 1.1');
    end;
    
    if i==4
      title('Gamma = 1.2');
    end;     
end; 
suptitle('Finding Edges of an Image Gamma 0.9-1.2');


figure,
for j=1:4,


    G= rgb2gray(im);
    G= imresize(G, [167 250]);
    E=edge(G,'canny',0 + j./10);
    [H, theta, rho] = hough(E);
    
            peaks = houghpeaks(H, 50, 'Threshold', 30);
            I= imresize(im, [167 250]);
            subplot(2, 2, j),imshow(I); hold on;

            lines = houghlines(E,theta,rho,peaks,'FillGap',5,'MinLength',15);
            for k = 1:numel(lines)
                x1 = lines(k).point1(1);
                y1 = lines(k).point1(2);
                x2 = lines(k).point2(1);
                y2 = lines(k).point2(2);
                plot([x1 x2],[y1 y2],'Color','b','LineWidth', 2)
            end    
            
    if j==1
       title('Gamma = 0.1');
    end;
  
    if j==2
       title('Gamma = 0.2');
    end;
    
    if j==3
       title('Gamma = 0.3');
    end;
    
    if j==4
       title('Gamma = 0.4');
    end;     
            
end;hold off
suptitle('Transforming Color Image to Find Edges');