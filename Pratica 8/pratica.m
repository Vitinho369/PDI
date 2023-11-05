clear all
close all
im = imread("Imagem.png");

imReduzidaD = zeros(size(im,1)/2, size(im,2)/2,3, "uint8");

figure("Name", "Im")
imshow(im)

l = 1;
c = 1;
for i=1:2:size(im,1)-1
  for j=1:2:size(im,2)-1
       imReduzidaD(l,c,:) = im(i,j,:);
       c++;
    endfor
     l++;
     c=1;
  endfor


figure("Name", "Im Reduzida (downsampling)")
imshow(imReduzidaD)

imReduzidaM = zeros(size(im,1)/2, size(im,2)/2,3, "double");
imMedia = double(im);
l = 1;
c = 1;
for i=1:2:size(im,1)
  for j=1:2:size(im,2)

      if i > 1 && j > 1 && i < size(im,1) && j < size(im,2)
       imReduzidaM(l,c,:) = (imMedia(i-1,j,:) + imMedia(i,j-1,:) + imMedia(i,j+1,:) +  imMedia(i+1,j,:))/4;
      else if i < size(im,1) && j < size(im,2)
       imReduzidaM(l,c,:) = (imMedia(i,j+1,:) +  imMedia(i+1,j,:))/2;
       else
       imReduzidaM(l,c,:) = (imMedia(i,j-1,:) +  imMedia(i-1,j,:))/2;
       endif
     endif
     c++;
    endfor
     l++;
     c=1;
  endfor

imReduzidaM = uint8(imReduzidaM);
figure("Name", "Im Reduzida (média aritmetica)")
imshow(imReduzidaM)

imDobroV = zeros(size(im,1)*2, size(im,2)*2,3, "uint8");

for i=1:size(im,1)
    for j=1:size(im,2)
        imDobroV(i*2,j*2,:) = im(i,j,:);
        imDobroV((i*2),(j*2)-1,:) = im(i,j,:);
        imDobroV((i*2)-1,(j*2),:) = im(i,j,:);
        imDobroV((i*2)-1,(j*2)-1,:) = im(i,j,:);
    endfor
  endfor

figure("Name", "Im Dobro (Vizinho mais próximo)");
imshow(imDobroV);


imDobroM = zeros(size(im,1)*2, size(im,2)*2,3, "double");
l=1;
c=1;
for i=1:size(im,1)
    for j=1:size(im,2)
        imDobroM(l,c,:) = imMedia(i,j,:);
        c+=2;
 endfor
 l+=2;
 c=1;
endfor

tic
for i=2:2:size(imDobroM,1)-1
    for j=2:2:size(imDobroM,2)-1
        imDobroM(i,j,:) = (imDobroM(i-1,j-1,:) + imDobroM(i-1,j+1,:)+imDobroM(i+1,j-1,:) + imDobroM(i+1,j+1,:))/4;
 endfor
endfor

for i=2:2:size(imDobroM,1)-1
    for j=1:2:size(imDobroM,2)
        imDobroM(i,j,:) = (imDobroM(i-1,j,:) + imDobroM(i+1,j,:))/2;
    endfor
 endfor

for i=1:2:size(imDobroM,1)
    for j=2:2:size(imDobroM,2)-1
        imDobroM(i,j,:) = (imDobroM(i,j-1,:) + imDobroM(i,j+1,:))/2;
    endfor
 endfor

for i=1:size(imDobroM,1)
  imDobroM(i,size(imDobroM,2),:) = imDobroM(i,size(imDobroM,2)-1,:);
endfor

for j=1:size(imDobroM,2)
  imDobroM(size(imDobroM,1),j,:) = imDobroM(size(imDobroM,1)-1,j,:);
endfor
toc
imDobroM = uint8(imDobroM);

figure("Name", "Im Dobro (Bilinear)");
imshow(imDobroM);

imDobroC = zeros(size(im,1)*2, size(im,2)*2,3, "double");
l=1;
c=1;

for i=1:size(im,1)
    for j=1:size(im,2)
        imDobroC(l,c,:) = imMedia(i,j,:);
        c+=2;
 endfor
 l+=2;
 c=1;
endfor

imDobroC = uint8(imDobroC);

figure("Name", "Im Dobro (Bicubica)");
imshow(imDobroC);

imDobroC = double(imDobroC);
tic
for i=4:size(imDobroM,1)-4
    for j=4:size(imDobroM,2)-4
      if imDobroC(i,j,:) == 0
        imDobroC(i,j,:) = (imDobroC(i-1,j-1,:) + imDobroC(i-1,j-3,:) +
        imDobroC(i+1,j-1,:) + imDobroC(i+1,j+1,:) +
        imDobroC(i-1,j+1,:) + imDobroC(i+1,j-3,:) +
        imDobroC(i-1,j+3,:) + imDobroC(i+1,j+3,:) +
        imDobroC(i+3,j-1,:) + imDobroC(i+3,j+1,:) +
        imDobroC(i-3,j-1,:) + imDobroC(i-3,j+1,:) +
        imDobroC(i+3,j+3,:) + imDobroC(i+3,j-3,:) +
        imDobroC(i-3,j+3,:))/16;
      endif
 endfor
endfor

for i=4:size(imDobroM,1)-1
    for j=5:size(imDobroM,2)-1
        if imDobroC(i,j,:) == 0
          imDobroC(i,j,:) =  (imDobroC(i-1,j,:) + imDobroC(i+1,j,:) +  imDobroC(i,j-1,:) + imDobroC(i,j+1,:))/4 ;
       endif
 endfor
endfor



for i=2:size(imDobroM,1)-1
    for j=2:size(imDobroM,2)-1

        if imDobroC(i,j,:) == 0
          imDobroC(i,j,:) =  (imDobroC(i-1,j+1,:) + imDobroC(i+1,j-1,:) +  imDobroC(i-1,j-1,:) + imDobroC(i+1,j+1,:))/4 ;
          endif
      endfor
    endfor


for i=2:size(imDobroM,1)-1
    for j=2:size(imDobroM,2)-1
        if imDobroC(i,j,:) == 0
          imDobroC(i,j,:) =  (imDobroC(i,j+1,:) + imDobroC(i,j-1,:) +  imDobroC(i-1,j,:) + imDobroC(i+1,j,:))/4 ;
          endif
      endfor
    endfor

for i=1:size(imDobroM,1)
    for j=2:size(imDobroM,2)-1
        if imDobroC(i,j,:) == 0
          imDobroC(i,j,:) = imDobroC(i,j+1,:);
          endif
      endfor
    endfor
toc

imDobroC = uint8(imDobroC);

figure("Name", "Im Dobro (Bicubica)");
imshow(imDobroC);
