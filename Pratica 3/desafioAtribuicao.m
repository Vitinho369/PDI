clear all;
close all;
im = imread("fractal.png");

figure("Name", "Imagem Original");
imshow(im);

imSaida = logical(im/128);

figure("Name", "ImSaida")
imshow(imSaida)
