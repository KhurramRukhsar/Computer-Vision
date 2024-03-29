
% clc
% clear
% A=imread('nose.jpg');
% A=im2double(A);
% figure(1);
% imshow(A);
% B=imread('Khurram.jpg');
% B=im2double(B);
% figure(2);
% imshow(B);
% A=rgb2gray(A);
% B=rgb2gray(B);
% [Ar Ac]= size(A);
% [Br Bc]= size(B);
% z=normxcorr2(A,B);
% [r c v]=find(z==(max(max(z))));
% RGB = insertShape(B,'rectangle',[c-Ac r-Ar Ac Ar],'LineWidth',10);
% figure(3);
% imshow(RGB);



clc
clear
A=imread('RD.jpg');
A=im2double(A);
figure(1);
imshow(A);
B=imread('Sample.jpg');
B=im2double(B);
figure(2);
imshow(B);
A=rgb2gray(A);
B=rgb2gray(B);
[Ar Ac]= size(A);
[Br Bc]= size(B);


z=normxcorr2(A,B);
z = imcrop(z , [Ac Ar Bc Br]);
[r c v]=find(z==(max(max(z))));
RGB = insertShape(B,'rectangle',[c-Ac r-Ar Ac Ar],'LineWidth',10);
% RGB = insertShape(B,'circle',[Ac/2 Ar/2],'LineWidth',10);
figure(3);
imshow(RGB);