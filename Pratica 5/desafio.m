clear all;
close all;
pkg load image;

im = imread("neuron.jpg");

figure("Name", "Imagem Original");
imshow(im);

imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);

figure("Name", "Canais da imagem");
subplot(1,3,1), imshow(imR), title("Canal R");
subplot(1,3,2), imshow(imG), title("Canal G");
subplot(1,3,3), imshow(imB), title("Canal B");

imSaida1 = imR - imG - imB;

figure("Name","Histograma Canal R");
imhist(imR);
figure("Name","Histograma Canal G");
imhist(imG);
figure("Name","Histograma Canal B");
imhist(imB);

figure("Name","ImSaida1");
imshow(imSaida1);

largura = size(im,1);
altura = size(im,2);

imSaida2 = zeros(largura, altura, "logical");

for i=1:largura
  for j=1:altura
    imSaida2(i,j) = imR(i,j) > 140 && imB(i,j) < 125  && imG(i,j) < 160;
    endfor
  endfor

figure("Name","ImSaida2");
imshow(imSaida2);
