clear all
close all

#Objetivo A
im = zeros(256,256);
im = uint8(im);
figure("Name", "Imagem vazia");
imshow(im);


cont = 0;
imDegrade = im;
for i=1:size(im,1)
  for j=1:size(im,2)
    imDegrade(i,j) += cont;
  endfor
  cont+=1;
endfor

figure("Name", "Imagem com degrade");
imshow(imDegrade);

imGrade = imDegrade;

for i=1:size(im,1)
  for j=1:size(im,2)
    if((j > 8 && j < 24) || (j > 232 && j < 248 ) ||
        (i > 8 && i < 24) || (i > 232 && i < 248))
        imGrade(i,j) = 126;
      endif
  endfor
endfor

figure("Name", "Imagem com grade");
imshow(imGrade);

figure("Name", "Imagens em uma janela");

subplot(1,3,1), imshow(im);
subplot(1,3,2), imshow(imDegrade);
subplot(1,3,3), imshow(imGrade);

#Objetivo B

imLena = imread('Lena.png');
figure("Name","Lena");
imshow(imLena);

tic()
imClara = imLena;

for i=1:size(imClara,1)
  for j=1:size(imClara,2)
     imClara(i,j)+= (imClara(i,j) * 0.8);
  endfor
endfor

imEscura = imLena;

for i=1:size(imEscura,1)
  for j=1:size(imEscura,2)
    imEscura(i,j) -= (imEscura(i,j) *0.8);
  endfor
endfor

toc()

figure("Name", "Imagens Lena");
subplot(1,2,1), imshow(imClara);
subplot(1,2,2), imshow(imEscura);

tic()
imClara2 = imLena;

imClara2(:,:)+= (imClara2(:,:) * 0.8);

imEscura2 = imLena;

imEscura2(:,:)-=(imEscura2(:,:) *0.8);
toc()

figure("Name", "Imagens Lena Atribuição Direta");
subplot(1,2,1), imshow(imClara2);
subplot(1,2,2), imshow(imEscura2);

#Objetivo C
cont = 255;
imDegrade = imLena;

for i=1:size(imDegrade,1)
  for j=1:size(imDegrade,2)
      imDegrade(i,j) = imDegrade(i,j) - cont;
      cont--;
  endfor
  cont = 255;
endfor


imPosterizada = imLena;

for i=1:size(imPosterizada,1)
  for j=1:size(imPosterizada,2)
    if(imPosterizada(i,j) < 87)
        imPosterizada(i,j) = 0;
     elseif(imPosterizada(i,j) > 169)
          imPosterizada(i,j) = 255;
       else
          imPosterizada(i,j) = 126;
       endif
  endfor
endfor

figure("Name", "Lena Degrade e Posterizada");
 imshow(imPosterizada);
