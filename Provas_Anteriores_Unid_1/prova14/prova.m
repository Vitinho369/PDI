clear all;
close all;

pkg load image;

mascara4 = imread("mascara4.jpg");
figure("Name", "mascara4")
imshow(mascara4)

img5 = imread("img5.jpg");


figure("Name", "img5")
imshow(img5)

foto5 = imread("foto5.jpg");

for i=1:size(foto5,1)
    foto5Rot(size(foto5,2)-i+1,:,:) = foto5(i,:,:);
  endfor

for i=1:size(foto5,1)
  for j=1:size(foto5,2)

    if i < 10 || i > 390 || j < 10 || j > 390
      foto5Rot(i,j,:) = 255-foto5Rot(i,j,:);
    endif
  endfor
 endfor
figure("Name", "foto5")
imshow(foto5Rot)

ass = imread("ass.jpg");

figure("Name", "assass")
imshow(ass)

assInvert = 255 - ass;

cont = 256;

for i=1:size(assInvert,1)
  for j=1:size(assInvert,2)
      assInvert(i,j) = assInvert(i,j) - cont;
      cont = cont -5;
    endfor
    cont = 256;
  endfor

imSaida(:,:,1) = mascara4;
imSaida(:,:,2) = mascara4;
imSaida(:,:,3) = mascara4;
pontoJ = 1;
pontoI = 1
achei =0

#INICIO - ACHAR O QUADRADO PRA COLOCAR A ASSINATURA
for i=1:size(mascara4,1)
  for j=1:size(mascara4,2)

  if(mascara4(i,j) >= 180 && mascara4(i,j) <= 200)
    if achei == 0
      pontoI = i
      pontoJ = j
      achei  =1;
    endif

      imSaida(i,j,:) = 0;
    elseif (mascara4(i,j) >= 65 && mascara4(i,j) <= 110)
      imSaida(i,j,:) = foto5Rot(i,j,:);

      elseif (mascara4(i,j) >= 120 && mascara4(i,j) <= 150)
      imSaida(i,j,:) = img5(i,j,:);
    endif

endfor
endfor


a = 1;
b = 1;
for i=pontoI+20:pontoI+20+size(ass,1)-1
  for j=pontoJ:pontoJ+size(ass,2)-1
      imSaida(i,j,:) = assInvert(a,b);
      b++;
      endfor
      b=1;
      a++;
endfor

figure("Name", "imSaida")
imshow(imSaida)

