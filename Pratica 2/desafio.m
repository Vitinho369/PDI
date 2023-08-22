close all
clear all
im = imread('lena.png');

levels = input("Digite quantos níveis você deseja posterizar a imagem:");
divsorPost = 255/(levels);
multiplyerPost = 255/(levels);

divsorPost += (divsorPost/(levels));
multiplyerPost += (multiplyerPost/(levels))*2;

imPosterizada = ((multiplyerPost) * (im/divsorPost));
figure("name","Im final 1")
imshow(imPosterizada)
