#Objetivo C
clear all
close all

cont = 255;
imDegrade = imLena;

for i=1:size(imDegrade,1)
  for j=1:size(imDegrade,2)
      imDegrade(i,j) = imDegrade(i,j) - cont;
      cont--;
  endfor
  cont = 255;
endfor


figure("Name", "Lena Degrade");
imshow(imDegrade);
imPosterizada = imLena;

for i=1:size(imPosterizada,1)
  for j=1:size(imPosterizada,2)
    if(imPosterizada(i,j) < 86)
        imPosterizada(i,j) = 0;
     elseif(imPosterizada(i,j) > 169)
          imPosterizada(i,j) = 255;
       else
          imPosterizada(i,j) = 126;
       endif
  endfor
endfor

print("teste");
figure("Name", "Lena Degrade e Posterizada");
imshow(imPosterizada);
