clear all
close all

#Objetivo A
m1 =  imread('circulo.png');

figure('Name', 'Circulo');
imshow(m1);

m1

m2 = uint8(m1);

for i=1 : size(m2,1)
  for j=1 : size(m2, 2)
    if(m2(i,j))
      m2(i,j,:) = 126;
    else
      m2(i,j,:) = 0;
    endif
  endfor
endfor

figure('Name', 'Circulo Cinza');
imshow(m2)

imwrite(m2, "Circulo_cinza.png");

#Objetivo B

im = imread('lena.png');

figure('Name', 'Lena');
imshow(im);

size(im)

for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) += 80;
  endfor
endfor

figure('Name', 'Lena + 80');
imshow(im);

for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) -= 80;
  endfor
endfor

figure('Name', 'Lena - 80');
imshow(im);

im = imread('lena.png');

value = input("Digite um valor para aumentar as intensidades: ");

for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) += value;
  endfor
endfor

figure('Name', 'Lena + valor');
imshow(im);
