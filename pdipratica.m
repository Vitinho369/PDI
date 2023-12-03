clear all;
close all;
pkg load image;

im = imread("img7.jpg");
imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);

figure("Name", "ImR");
imshow(imR);
figure("Name", "ImG");
imshow(imG);
figure("Name", "ImB");
imshow(imB);

mask = imR > 20;

imNova = mask / im;

figure("Name", "mask");
imshow(mask);


figure("Name", "imnova");
imshow(imNova);

