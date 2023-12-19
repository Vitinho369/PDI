clear all;
close all;
pkg load image;
im = imread("test.jpeg");

figure(1)
imshow(im(:,:,1))


figure(2)
imshow(im(:,:,2))


figure(3)
imshow(im(:,:,3))

im2 = im(:,:,2) > 190;

ee = [1,1,1;
1,1,1;
1,1,1];
im2 = imerode (im2,ee);

figure(4)
imshow(im2)

