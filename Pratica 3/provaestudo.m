clear all;
close all;

pkg load image;

im = imread("lake.png");

figure("Name", "Im Original");
imshow(im);

vetor = imhist(im);

vetorOring(1,:) = vetor(:,1);

minimo = 0
maximo = 0

for i=1:size(vetorOring,2)
   if vetorOring(i) != 0
      minimo = i
      break
   endif
end


for i=size(vetorOring,2):-1:1
   if vetorOring(i) != 0
      maximo = i
      break
   endif
end

intervalo = round(256/(maximo - minimo +1));

cont = 0

vetorAlargado = zeros(size(vetorOring));
for i=minimo:maximo
   if vetorOring(i) !=0
     vetorAlargado(i)  = cont;
     cont += intervalo;
   endif
end
imAlargada = im;
for i=1:size(im,1)
   for j=1:size(im,2)
     for l=minimo:maximo
       if im(i,j) == l
         imAlargada(i,j) = vetorAlargado(l);
       endif
       endfor
   endfor
endfor

figure("Name", "Im alargada")
imshow(imAlargada)
