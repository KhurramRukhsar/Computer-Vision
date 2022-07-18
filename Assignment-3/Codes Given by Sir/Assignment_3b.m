%Template matching of my own
clc
clear
A=imread('nose.jpg');
A=im2double(A);
figure(1);
imshow(A);

C=imread('eye.jpg');
C=im2double(C);
figure(2);
imshow(C);

B=imread('Khurram.jpg');
B=im2double(B);
figure(3);
imshow(B);

A=rgb2gray(A);
B=rgb2gray(B);
[Ar Ac]= size(A);
[Br Bc]= size(B);
z=normxcorr2(A,B);
[r c v]=find(z==(max(max(z))));
Nose = insertShape(B,'rectangle',[c-Ac r-Ar Ac Ar],'LineWidth',10);
figure(4);
imshow(Nose);

C=rgb2gray(C);
[Cr Cc]= size(C);
z=normxcorr2(C,B);
[r c v]=find(z==(max(max(z))));
EYE = insertShape(B,'rectangle',[c-Cc r-Cr Cc Cr],'LineWidth',10);
%figure(5);
imshow(EYE);
