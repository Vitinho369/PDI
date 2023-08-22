close all
clear all
im = imread('lena.png');

levels = input("Digite quantos níveis você deseja posterizar a imagem:");
divisorPost = 255/(levels);
multiplyerPost = 255/(levels);

divisorPost += (divisorPost/(levels));
multiplyerPost += (multiplyerPost/(levels))*2;

imPosterizada = ((multiplyerPost) * (im/divisorPost));
figure("name","Im final 1")
imshow(imPosterizada)
