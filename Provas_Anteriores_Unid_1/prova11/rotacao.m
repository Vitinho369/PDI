clear all;
close all;

im = imread("foto2.jpg");

figure("Name", "Torre");
imshow(im);
  for i=1:size(im,1)
    imRotacionada(:,size(im,2) - i +1,:) = im(i,:,:);
  endfor


figure("Name", "Torre Rotacionada");
imshow(imRotacionada);

