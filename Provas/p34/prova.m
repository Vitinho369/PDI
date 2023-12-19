%Vitor Carvalho Silva
clear all;
close all;

pkg load image;

text_34 = imread("text_34.png");
figure("Name","text_34");
imshow(text_34);

tads_34 = imread("tads_34.png");
figure("Name","tads_34");
imshow(tads_34);

mask_34 = imread("mask_34.png");
figure("Name","mask_34");
imshow(mask_34);

land_34 = imread("land_34.png");
figure("Name","land_34");
imshow(land_34)
animal_34 = imread("animal_34.png");

figure("Name","animal_34 Invertida");
imshow(animal_34);
animal_34 = rgb2gray(animal_34);


for i=1:size(animal_34,1)
  for j=1:size(animal_34,2)
    animal_34Esp(j,i) = animal_34(j,size(animal_34,2)-i+1);
  endfor
 endfor

figure("Name","animal_34 Espelhada");
imshow(animal_34Esp);

land_34Invertida = 255 - land_34;
figure("Name","Land_34 invertida");
imshow(land_34Invertida);
land_34Cortes = zeros(size(land_34,1),size(land_34,2),3,"uint8");
##land_34Cortes = land_34;

cont = 6;
contAnt = 0;
for i=1:size(land_34Cortes,1)
  for j=1:size(land_34Cortes,2)
    if j > contAnt && j < cont
      land_34Cortes(:,j,:) = land_34(:,j,:);
    endif
endfor
  contAnt = cont;
  cont += 6;
endfor

figure("Name","land_34Cortes")
imshow(land_34Cortes);


for i=1:size(tads_34,1)
  for j=1:size(tads_34,2)
    if  tads_34(i,j,:)  > 190
      tads_34(i,j,:) = text_34(i,j,:);
    else
      tads_34(i,j,:) = 0;
      endif
    endfor
  endfor

figure("Name","tads_34")
imshow(tads_34);

for i=1:size(mask_34,1)
  for j=1:size(mask_34,2)
    if mask_34(i,j,:) == 127
      mask_34(i,j,2) = 255;
      mask_34(i,j,1) = 0;
      mask_34(i,j,3) = 0;

      elseif mask_34(i,j,:) == 0
         mask_34(i,j,:) = land_34Invertida(i,j,:);

         elseif mask_34(i,j,:) == 180
          mask_34(i,j,:) = animal_34Esp(i,j,:);

        elseif mask_34(i,j,:) == 255
          mask_34(i,j,:) = 0;

         elseif mask_34(i,j,:) == 60
          mask_34(i,j,:) = land_34Cortes(i,j,:);
    endif
    endfor
  endfor

l=1;
c=1;
for i=1:size(tads_34,1)+1
  for j=size(mask_34,2)-size(tads_34,2)+1:size(mask_34,2)
       mask_34(i,j,:) = tads_34(l,c,:);
      c++;
     endfor
    c=1;
    l++;
    if(l > size(tads_34,1))
      l=1;
    endif
  endfor
figure("Name","mask_34");
imshow(mask_34);
