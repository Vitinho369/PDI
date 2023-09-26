clear all;
close all;

im = imread("lena.png");

figure("Name", "Lena Original");
imshow(im);
for i=1:size(im,1)
    imE(:,i) = im(:,size(im,2)-i+1); # Espelhamento Horizontal
  endfor


figure("Name", "Lena Espelhamento Horizontal");
imshow(imE);

for i=1:size(im,1)
    imRot3(size(im,2)-i+1,:) = im(i,:); #Espelhamento 180° Antihorario
  endfor

figure("Name", "Lena Horario");
imshow(imRot3);


