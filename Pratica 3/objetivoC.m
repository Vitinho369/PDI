#Objetivo C
clear all;
close all;
pkg load image;

im = imread('lake.png');

figure('Name', 'Histograma Lake');
imhist(im)
lagoHist = imhist(im);

for i=1:size(lagoHist,1)
  vetorHist(i) = lagoHist(i);
endfor


procuraMin = 1;
pontoMax = 0;
pontoMin = 0;

for i=1:(size(vetorHist,2)-1)
  if vetorHist(i) != 0 && procuraMin
    pontoMin = i;
    procuraMin = 0;
  endif

  if vetorHist(i) != 0
    pontoMax = i;
  endif
endfor

intervalo = floor(255/(pontoMax - pontoMin - 1));
passo = 0;

for i=pontoMin:pontoMax

  if vetorHist(i) != 0
    vetorAlargado(i) = passo;
    passo += intervalo;
  endif
endfor

linha = size(im,1);
coluna = size(im,2);
imContraste = im;

for i=1:linha
  for j=1:coluna
      for l = pontoMin:pontoMax
         if im(i,j) == l
              imContraste(i,j) = vetorAlargado(l);
         endif
        endfor
    endfor
endfor

figure('Name', 'Imagem Original')
imshow(im)

figure('Name', 'Imagem Contraste')
imshow(imContraste)
