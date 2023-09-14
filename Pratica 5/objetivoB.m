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

imFinal = im .* imMask;

figure("Name","Imagem Final");
imshow(imFinal);
