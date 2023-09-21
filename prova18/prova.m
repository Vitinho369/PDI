pkg load image;

clear all;
close all;

ass = imread("ass.jpg");
figure("Name","Ass");

assInvert = 255 - ass;
cont = 256;
for i=1:size(assInvert,1)
  for j=1:size(assInvert,2)
      assInvert(i,j) = assInvert(i,j) - cont;
      cont -= 4;
    endfor
    cont = 256;
  endfor
imshow(assInvert)


img9 = imread("img9.jpg");
figure("Name","img9");
imshow(img9)

foto9 = imread("foto9.jpg");
figure("Name","foto9");

for i=1:size(foto9,1)
      foto9Invert(size(foto9,2) - i + 1,:,:) = foto9(i,:,:);
  endfor

imshow(foto9Invert)
for i=1:size(foto9,1)##ESPELHAMENTO HORIZONTAL
      foto9Invert2(:,i,:) = foto9Invert(:,size(foto9,2) - i + 1,:);
  endfor


for i=1:size(foto9Invert2,1)
  for j=1:size(foto9Invert2,2)
    if (i > 180 && i < 210) || (j > 180 && j < 210)
        foto9Invert2(i,j,:) = 255 - foto9Invert2(i,j,:);
    endif
endfor
endfor

figure("Name","foto9Invert2");
imshow(foto9Invert2)


mascara3 = imread("mascara3.jpg");
figure("Name","mascara3");
imshow(mascara3)

imSaida(:,:,1) = mascara3;
imSaida(:,:,2) = mascara3;
imSaida(:,:,3) = mascara3;

for i=1:size(imSaida,1)
  for j=1:size(imSaida,2)
        if imSaida(i,j) >= 0 && imSaida(i,j) <= 30
        imSaida(i,j,:) = img9(i,j,:);
        endif
  endfor
endfor

figure("Name","ImSaida");
imshow(imSaida)
