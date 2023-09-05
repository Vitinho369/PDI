clear all
close all
im = imread('moon.png');

levels = input("Digite quantos níveis você deseja posterizar a imagem:");
posterization = 255/(levels);
constant = posterization;
cont  = 0;
for l=1:levels
  for i=1:size(im,1)
    for j=1:size(im,2)
      if(im(i,j) > cont && im(i,j) < posterization)
          im(i,j) = (cont + posterization)/2;
    endif

  endfor
endfor

  cont = posterization;
  posterization += constant;
endfor

figure(1);
imshow(im);
