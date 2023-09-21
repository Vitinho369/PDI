clear all;
close all;

pkg load image;

mascara = imread("mascara1.jpg");
figure("Name", "Mascara")
imshow(mascara)

foto2 = imread("foto2.jpg");
figure("Name", "foto2")
imshow(foto2)


img2 = imread("img2.jpg");
figure("Name", "img2")
imshow(img2)

ass = imread("ass.jpg");
figure("Name", "ass")
imshow(ass)


imSaida(:,:,1) = mascara(:,:);
imSaida(:,:,2) = mascara(:,:);
imSaida(:,:,3) = mascara(:,:);

for i=1:size(mascara,1)
  for j=1:size(mascara,2)
    if mascara(i,j) >= 0 && mascara(i,j) <= 30
      imSaida(i,j,:) = img2(i,j,:)+40;
    endif
    endfor
  endfor

  figure("Name","ImSaida")
  imshow(imSaida)

foto2Rot = foto2;
for i=1:size(foto2,2)
  foto2Rot(size(foto2,2)-i+1,:,:) = foto2(:,i,:);
endfor

figure("Name","Imrotacionada")
imshow(foto2Rot)

for i=1:size(mascara,1)
  for j=1:size(mascara,2)
    if i < 10 || i > 390 || j < 10 || j > 390
      foto2Rot(i,j,:) = 255 - foto2Rot(i,j,:);
    endif
 endfor
endfor

figure("Name","Imrotacionada")
imshow(foto2Rot)

for i=1:size(mascara,1)
  for j=1:size(mascara,2)
    if mascara(i,j) >= 60 && mascara(i,j) <= 100
      imSaida(i,j,:) = foto2Rot(i,j,:);
    endif
 endfor
endfor


figure("Name","ImSaida")
imshow(imSaida);
corrigass = 255-ass;

figure("Name","corrigass")
imshow(corrigass);
for i=1:size(corrigass,1)
  cont = 256;
  for j=1:size(corrigass,2)
    corrigass(i,j) = corrigass(i,j) - (cont);
    cont = cont -5;
endfor
endfor

figure("Name","corrigass")
imshow(corrigass);
for i=1:size(mascara,1)
  for j=1:size(mascara,2)
      if i > size(ass,1) || j > size(ass,2)
        corrigass(i,j)  = 0;
      endif
    endfor
  endfor
figure("name","corrigass")
imshow(corrigass)
pontoJ = 1;
pontoI = 1
achei =0

#INICIO - ACHAR O QUADRADO PRA COLOCAR A ASSINATURA
for i=1:size(mascara,1)
  for j=1:size(mascara,2)

  if(mascara(i,j) >= 120 && mascara(i,j) <= 150)
    pontoI = i;
    pontoJ = j;
    achei  =1;
    endif
    if(achei == 1)
      break
    endif

endfor
  if(achei == 1)
   break
  endif
endfor


for i=1:size(mascara,1)
  for j=1:size(mascara,2)

  if(mascara(i,j) >= 120 && mascara(i,j) <= 150)
    imSaida(i,j,:) = 0;
  endif
endfor
endfor

a = 1;
b = 1;
for i=pontoI+40:pontoI+40+size(ass,1)
  for j=pontoJ:pontoJ+size(ass,2)
      imSaida(i,j,:) = corrigass(a,b);
      b++;
      endfor
      b=1;
      a++;
endfor

#FIM - ACHAR O QUADRADO PRA COLOCAR A ASSINATURA
figure("Name","ImSaida")
imshow(imSaida);
