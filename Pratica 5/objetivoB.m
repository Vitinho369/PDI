close all;
clear all;
pkg load image;
im = imread("milho.png");

imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);


figure("Name", "Canais da imagem");
subplot(1,3,1), imshow(imR), title("Canal R");
subplot(1,3,2), imshow(imG), title("Canal G");
subplot(1,3,3), imshow(imB), title("Canal B");

figure("Name","Histograma do Canal R");
imhist(imR);

imMask = imR > 150;

figure("Name","Im Mask");
imshow(imMask);

imFinal1 = im .* imMask;

figure("Name","Imagem Final 1");
imshow(imFinal1);

largura = size(imMask,1);
altura = size(imMask,2);

imFinal2 = zeros(largura, altura, 3, "uint8");

for i=1:largura
  for j=1:altura
      if imMask(i,j)
        imFinal2(i,j,:) = im(i,j,:);
      else
        imFinal2(i,j,:) = imMask(i,j);
      endif
    endfor
  endfor

figure("Name","Imagem Final 2");
imshow(imFinal2);

