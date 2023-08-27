#Objetivo B
clear all;
close all;
pkg load image;

imDance = imread("dance.png");
imDanceD = imread("dance_depth.png");

figure('Name', 'Imagem Dance');
imshow(imDance)

figure('Name', 'Imagem Dance Depth');
imshow(imDanceD)


figure('Name', 'Histograma Dance');
imhist(imDance)

figure('Name', 'Histograma Dance Depht');
imhist(imDanceD)

imMulherRoi = imDance;

for i=1:size(imDance,1)
  for j=1:size(imDance,2)
    if imDanceD(i,j) > 90 && imDanceD(i,j) < 165
      imMulherRoi(i,j,:) = 255;
    else
      imMulherRoi(i,j,:) = 0;
    endif
  endfor
endfor

figure('Name', 'Im MulherRoi');
imshow(imMulherRoi);

imMulher = imMulherRoi;

for i=1:size(imMulher,1)
  for j=1:size(imMulher,2)
    if imMulherRoi(i,j,:) == 255
      imMulher(i,j,:) = imDance(i,j,:);
    endif
    endfor
  endfor

figure('Name', 'Im Mulher');
imshow(imMulher);


imHomemRoi = imDance;

for i=1:size(imDance,1)
  for j=1:size(imDance,2)
    if imDanceD(i,j) > 190
      imHomemRoi(i,j,:) = 255;
    else
      imHomemRoi(i,j,:) = 0;
    endif
  endfor
endfor

figure('Name', 'Im HomemRoi');
imshow(imHomemRoi);

imHomem = imHomemRoi;

for i=1:size(imHomem,1)
  for j=1:size(imHomem,2)
    if imHomemRoi(i,j,:) == 255
      imHomem(i,j,:) = imDance(i,j,:);
    endif
    endfor
  endfor

figure('Name', 'Im Homem');
imshow(imHomem);


