clear all;
close all;
tic
pkg load image;

im = imread("fractal.png");

figure("Name", "Imagem Original");
imshow(im);


for i=1:8
  vetorImagens(:,:, i) = logical(zeros(size(im,1),size(im,2)));
endfor

for i=1:size(im,1)
  for j=1:size(im,2)
   divisor = im(i,j);
    cont =1;
  do
    numBin = 1-mod(divisor, 2);
    divisor = floor(divisor/2);
    vetorImagens(i,j,cont) = numBin;
    cont++;
  until !(divisor != 0 && cont <9)

  endfor
endfor

for i=1:8
  figure(i+1);
  imshow(vetorImagens(:,:,i));
endfor

figure("Name", "Imagem fatiada - bit 7")
imshow(vetorImagens(:,:,7))

figure("Name", "Imagem fatiada - bit 8")
imshow(vetorImagens(:,:,8))

imSaida = vetorImagens(:,:,7) + vetorImagens(:,:,8);

figure("Name", "ImSaida")
imshow(imSaida)
toc
