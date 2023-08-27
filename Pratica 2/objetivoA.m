#Objetivo A
clear all
close all

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


