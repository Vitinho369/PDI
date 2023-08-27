#Objetivo B
clear all
close all

im = imread('lena.png');

figure('Name', 'Lena');
imshow(im);

size(im)

for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) += 80;
  endfor
endfor

figure('Name', 'Lena + 80');
imshow(im);

for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) -= 80;
  endfor
endfor

figure('Name', 'Lena - 80');
imshow(im);

im = imread('lena.png');

value = input("Digite um valor para aumentar as intensidades: ");

for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) += value;
  endfor
endfor

figure('Name', 'Lena + valor');
imshow(im);

