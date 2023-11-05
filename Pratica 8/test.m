clear all
close all
im = imread("Imagem.png");

imMedia = double(im);
imDobroM = zeros(size(im,1)*2, size(im,2)*2,3, "double");

for i=1:size(im,1)
    for j=1:size(im,2)
              imDobro2M(i*2,j*2,:) = imMedia(i,j,:);
  endfor
endfor
imDobro2M = uint8(imDobro2M);
  figure(1)
  imshow(imDobro2M)
for i=1:size(im,1)
    for j=1:size(im,2)
      imDobroM(i*2,j*2,:) = imMedia(i,j,:);
      if i > 1 && j > 1
                imDobroM((i*2),(j*2)-1,:) = (imDobroM((i*2),(j*2),:) + imDobroM((i*2),(j*2)-2,:))/2;
                imDobroM((i*2)-1,(j*2),:) = (imDobroM((i*2)-2,(j*2),:)+imDobroM((i*2),(j*2),:))/2;
                imDobroM((i*2)-1,(j*2)-1,:) = (imDobroM((i*2),(j*2),:) + imDobroM((i*2),(j*2)-2,:) + imDobroM((i*2)-2,(j*2),:)+imDobroM((i*2),(j*2),:))/4;

         else if i <= size(im,1) && j <= size(im,2)
##                imDobroM((i*2)+1,(j*2),:) = imDobroM((i*2),(j*2),:);
##                imDobroM((i*2),(j*2)+1,:) = imDobroM((i*2),(j*2),:);
                imDobroM((size(im,1)-i+1)*2,j,3) = 255;
                 imDobroM(j,(size(im,1)-i+1)*2,3) = 255;
         endif
        endif
 endfor
endfor

imDobroM = uint8(imDobroM);

figure("Name", "Im Dobro (Bilinear)");
imshow(imDobroM);
