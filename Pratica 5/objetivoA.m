close all;
clear all;

im = imread('cores.jpg');

figure("Name","Imagem Original");
imshow(im);

imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);

figure("Name","Canais da imagem RGB");
subplot(1,3,1),imshow(imR), title("Canal R");
subplot(1,3,2),imshow(imG), title("Canal G");
subplot(1,3,3),imshow(imB), title("Canal B");

imCinza = 0.2989 * imR + 0.5870 * imG + 0.1140 * imB;

figure("Name","Imagem em tons de cinza");
imshow(imCinza);
