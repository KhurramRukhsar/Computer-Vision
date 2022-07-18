clc
clear
a=imread('SMME.jpg');
a=im2double(a);
b=imread('RD.jpg');
b=im2double(b);

%% Correlation and Convolution of two images 


a=imresize(a, [200, 300]); % image size must be same to take correlation

b=imresize(b, [200, 300]); % image size must be same to take correlation
imshow(b)
c=corr2(a(:,:,1),b(:,:,1)); % Note: correlation coefficents for both variables
d=corr2(b(:,:,1),b(:,:,1));

e=conv2(a(:,:,1),b(:,:,1)); % Note: correlation coefficents for both variables
f=conv2(b(:,:,1),b(:,:,1));


%% NCC
a=rgb2gray(a);
b=rgb2gray(b);
c=normxcorr2(a,b);
surf(c);
shading flat;
[ypeak,xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(a,1);
xoffSet = xpeak-size(a,2);
imshow(b)
drawrectangle(gca,'Position',[xoffSet,yoffSet,size(a,2),size(a,1)],'FaceAlpha',0);

%% Edge detection 
BW1 = edge(a(:,:,1),'sobel');
BW2 = edge(a(:,:,1),'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');



%%    Derivative, DOG, LoG

Der=gradient(a)

DoG=gradient(imgaussfilt(a));
figure;
imshowpair(Der,DoG,'montage')
title('Derivativer                                   Derivative of Gaussian');



%%    Derivative, DOG, LoG of random
clc
clear
BN=imread('BN.jpg');
BN=rgb2gray(BN);
% BN=im2double(BN);
%rand_img=rand(30,30)
%imshow(rand_img)
[Gmag,Gdir]=imgradient(BN);

Gaus=imgaussfilt((BN), 5);
[Gmag1,Gdir1]=imgradient(Gaus);
figure;
imshowpair(Gdir,Gdir1,'montage')
title('Derivative                                   Derivative of Gaussian');


% %%    Laplacian of Gaussian
% clc
% clear
% BN=imread('BN.jpg');
% BN=rgb2gray(BN);
% % BN=im2double(BN);
% %rand_img=rand(30,30)
% %imshow(rand_img)
% [Gmag,Gdir]=imgradient(BN);
% 
% Gaus=imgaussfilt((BN), 5);
% [Gmag1,Gdir1]=imgradient(Gaus);
% Lap=locallapfilt(Gaus,0.5,0.4);
% figure
% imshowpair(Gaus,Lap,'montage')
% title('Gaussian                                   Laplacian');
% 
% figure
% imshowpair(Gdir,Gaus,'montage')
% title('Derivative                                 Gaussian');
% 
% 
% figure
% imshowpair(Gdir1,Lap,'montage')
% title('DoG                                  LoG');
% 
% 
% 
% %%    Erosion and dilation
% 
% clc
% clear
% originalBW = imread('text.png');
% se = strel('line',11,90);
% erodedBW = imerode(originalBW,se);
% dilateBW = imdilate(originalBW,se);
% 
% figure
% imshow(originalBW)
% 
% figure
% imshow(erodedBW), title('Eroded')
% 
% figure, imshow(dilateBW), title('Dilated')
% 
% originalI = imread('cameraman.tif');
% se = offsetstrel('ball',5,5)
% erodedI = imerode(originalI,se);
% dilatedI = imdilate(originalI,se);
% figure
% imshow(originalI)
% figure
% imshow(erodedI)
% figure
% imshow(dilatedI)
% 
