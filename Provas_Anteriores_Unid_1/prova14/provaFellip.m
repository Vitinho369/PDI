clear all
close all
pkg load image;
im = imread('foto5.jpg');
imVerte = im;
mascara = imread('mascara4.jpg');
img5 = imread('img5.jpg');
ass = imread('ass.jpg');
ass = 255 - ass(:,:);
const = 256;
t = 0;
for i = 1: size(ass,1)
  for j = 1: size(ass,2)
    ass(i,j) = ass(i,j) - const;
    const -= 5;
  endfor
  const = 256;
endfor
cont = 400;
for i = 1: size(im,1)
  imVerte(i,:) = im(cont,:);
  cont = cont - 1;
endfor
for i = 1: size(im,1)
  for j = 1: size(im, 2)
    if(i < 10 || i > 390 || j < 10 || j > 390)
      imVerte(i,j,:) = 255 - imVerte(i,j,:);
    endif
  endfor
endfor
for i = 1: size(im,1)
  for j = 1: size(im, 2)
    if(mascara(i,j) > 100)
      imVerte(i,j,:) = mascara(i,j);
    endif
  endfor
endfor
for i = 1: size(im,1)
  for j = 1: size(im, 2)
    if(mascara(i,j) > 101 && mascara(i,j) < 151)
      imVerte(i,j,:) = img5(i,j,:);
    endif
  endfor
endfor
for i = 1: size(im,1)
  for j = 1: size(im, 2)
    if(mascara(i,j) > 151 && mascara(i,j) < 210)
      imVerte(i,j,:) = 0;
    endif
  endfor
endfor
cont = 1;
x = 1;
y = 1;
for i = 1: size(im,1)
  for j = 1: size(im,2)
    if(imVerte(i,j,:) == 0 && i > 300)
      for x = 1: size(ass,1)
        for y = 1: size(ass,2)
          imVerte(i+x,j+y,:) = ass(x,y);
        endfor
      endfor
      if(x == 32)
        break;
      endif
    endif
  endfor
        if(x == 32)
        break;
      endif
endfor
figure(2);
imshow(imVerte);
