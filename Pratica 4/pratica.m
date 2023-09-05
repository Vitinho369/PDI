clear all;
close all;

object3 = imread("images/object_3.jpg");
figure("Name", "Object 3");
object3(:,:) = 255 - object3(:,:);
imshow(object3);

object5 = imread("images/object_5.jpg");

object5(:,:) = 255 - object5  (:,:);
figure("Name", "Object 5");
imshow(object5);

mask1 = imread("images/mask_1.bmp");

figure("Name", "Mask 1");
imshow(mask1);

background5 = imread("images/background_5.jpg");

figure("Name", "Background 5");
imshow(background5);

for i=1:size(background5,1)
  l = size(background5,2);
  for j=1:size(background5,2)
    background(i,j) = background5(i,l);
    l--;
  endfor
  endfor

figure("Name", "Background 5 Invertido");
imshow(background);

##background(:,:) = 255 - background(:,:);
quadro = zeros(size(object3,1),size(object3,2), "uint8");

for i=1:size(quadro,1)
  for j=1:size(quadro,2)
    quadro(i,j) = mask1(i,j) * background(i,j);
    endfor
  endfor

figure("Name", "Quadro soma");
imshow(quadro);
for i=1:size(quadro,1)
  for j=1:size(quadro,2)
    quadro(i,j) =object5(i,j)+quadro(i,j);
    quadro(i,j) = quadro(i,j)+object3(i,j);
    endfor
  endfor

##quadro(:,:) = 255 - quadro(:,:);
##quadro += (object3 - object5);
figure("Name", "Quadro soma 2");
imshow(quadro);
