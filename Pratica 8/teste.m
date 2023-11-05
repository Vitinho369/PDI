##clear all
##close all
im = imread("Imagem.png");

imDobroM = zeros(size(im,1)*2, size(im,2)*2,3, "double");
imMedia = double(im);
l=1;
c=2;
for i=1:size(im,1)
    for j=1:size(im,2)
        imDobroM(i*2,j*2,:) = imMedia(i,j,:);
 endfor
endfor


for i=3:2:size(imDobroM,1)-2
    for j=3:2:size(imDobroM,2)-2
        imDobroM(i,j,:) = (imDobroM(i-1,j-1,:) + imDobroM(i-1,j+1,:)+imDobroM(i+1,j-1,:) + imDobroM(i+1,j+1,:))/4;
 endfor
endfor

for i=3:2:size(imDobroM,1)-2
    for j=2:2:size(imDobroM,2)-2
        imDobroM(i,j,:) = (imDobroM(i-1,j,:) + imDobroM(i+1,j,:))/2;
    endfor
 endfor

for i=2:2:size(imDobroM,1)-2
    for j=3:2:size(imDobroM,2)-2
        imDobroM(i,j,:) = (imDobroM(i,j-1,:) + imDobroM(i,j+1,:))/2;
    endfor
 endfor

imDobroM = uint8(imDobroM);

figure("Name", "Im Dobro (Bilinear)");
imshow(imDobroM);
