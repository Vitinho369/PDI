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

for i=1:size(img9,1)
      img9Invert(:,size(img9,2) - i + 1,:) = img9(i,:,:);
  endfor
imshow(img9Invert)

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
          imSaida(i,j,:) = img9Invert(i,j,:);

        elseif imSaida(i,j) >= 70 && imSaida(i,j) <= 100
          imSaida(i,j,:) = foto9Invert2(i,j,:);

        endif
  endfor
endfor

pontoJ = 1;
pontoI = 1
achei =0

#INICIO - ACHAR O QUADRADO PRA COLOCAR A ASSINATURA
for i=1:size(mascara3,1)
  for j=1:size(mascara3,2)

  if(mascara3(i,j) >= 120 && mascara3(i,j) <= 150)
    if achei == 0
      pontoI = i
      pontoJ = j
      achei  =1;
    endif
    imSaida(i,j,:) = 0;
    endif


endfor
endfor


a = 1;
b = 1;
for i=pontoI+40:pontoI+40+size(ass,1)-1
  for j=pontoJ:pontoJ+size(ass,2)-1
      imSaida(i,j,:) = assInvert(a,b);
      b++;
      endfor
      b=1;
      a++;
endfor

figure("Name","ImSaida");
imshow(imSaida)
