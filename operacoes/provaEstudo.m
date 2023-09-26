close all;
clear all;

pkg load image;

im = imread("lena.png");

figure(1)
imshow(im)

for i=1:size(im,1)
  im2(:,size(im,2) - i + 1) = im(i,:);
end

figure(2)
imshow(im2)
