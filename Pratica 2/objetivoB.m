#Objetivo B
clear all
close all

imLena = imread('Lena.png');
figure("Name","Lena");
imshow(imLena);

tic
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

toc

figure("Name", "Imagens Lena");
subplot(1,2,1), imshow(imClara);
subplot(1,2,2), imshow(imEscura);

tic
imClara2 = imLena;

imClara2(:,:)+= (imClara2(:,:) * 0.8);

imEscura2 = imLena;

imEscura2(:,:)-=(imEscura2(:,:) *0.8);
toc

figure("Name", "Imagens Lena Atribuição Direta");
subplot(1,2,1), imshow(imClara2);
subplot(1,2,2), imshow(imEscura2);

