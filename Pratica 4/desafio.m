clear all;
close all;

mask2 = logical(imread("images/mask_2.tif"));
mask3 = logical(imread("images/mask_3.tif"));

im =  mask2;
for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) = mask2(i,j) && mask3(i,j);

    endfor
  endfor

figure("Name", "Desafio");
subplot(1,3,1),imshow(mask3);
subplot(1,3,2),imshow(mask2);
subplot(1,3,3),imshow(im);
