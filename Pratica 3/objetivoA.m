#Objetivo A
clear all;
close all;
pkg load image;

im = imread('moon.png');

imhist(im);

figure('Name', 'Im');
imshow(im)
imBin = im;
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j) < 105)
      imBin(i,j) = 255;
    else
      imBin(i,j) = 0;
    endif
  endfor
endfor

figure('Name', 'Im Binarizada Valor Fixo');
imshow(imBin);

imBinarizada = im;
value = input("Digite um valor para limiarizar a imagem:");

for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j) < value)
      imBinarizada(i,j) = 255;
    else
      imBinarizada(i,j) = 0;
    endif
  endfor
endfor

figure('Name', 'Im Binarizada Valor Dinâmico');
imshow(imBinarizada);

ImInvertida = 255 - im;

figure('Name', 'Imagem Negativa');
imshow(ImInvertida);

imPotFront = ImInvertida;

for i=1:size(im,1)
  for j=1:size(im,2)
    if(imBinarizada(i,j) == 255)
        imPotFront(i,j) = imPotFront(i,j)^1.3;
    endif
  endfor
endfor

figure('Name', 'Imagem Potencia Frente');
imshow(imPotFront);


imPotBack = ImInvertida;

for i=1:size(im,1)
  for j=1:size(im,2)
    if(imBinarizada(i,j) == 0)
        imPotBack(i,j) = imPotBack(i,j)^1.3;
    endif
  endfor
endfor

figure('Name', 'Imagem Potencia Frente');
imshow(imPotBack);

