clear all;
close all;

im = imread("lena.png");

figure("Name", "Lena Original");
imshow(im);
for i=1:size(im,1)
    imRot(size(im,2)-i+1,:) = im(:,i); #Espelhamento 90°s Antihorário
  endfor

figure("Name", "Lena Antihorario");
imshow(imRot);


for i=1:size(im,1)
    imRot2(:,size(im,2)-i+1) = im(i,:); #Espelhamento 90° Horario
  endfor

figure("Name", "Lena Horario");
imshow(imRot2);

