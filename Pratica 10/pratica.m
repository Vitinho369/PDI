clear all;
close all;

im = imread("lena.jpg");
imgray = rgb2gray(im);

##filtro =[1 1 1,
##1 1 1,
##1 1 1];


filtro = [-1 -1 -1,
-1 8 -1,
-1 -1 -1];

imNova = zeros(size(imgray,1)+2, size(imgray,2)+2, "uint8");

for i=2:size(imNova,1)-1
  for j=2:size(imNova,2)-1
      imNova(i,j) = imgray(i-1, j-1);
    endfor
  endfor

 figure("Name","imNova");
 imshow(imNova);
divider = sum(sum(filtro));

if(divider ==0)
  divider=1; #Faz o filtro ficar não-linear e não normalizado
endif

imresult = double(imgray);;
imNova = double(imNova);
for i=2:size(imNova,1)-1
  for j=2:size(imNova,2)-1
      imresult(i-1,j-1) = ((imNova(i-1, j-1) * filtro(1,1)) +  (imNova(i-1,j) * filtro(1,2))
                     + (imNova(i-1,j+1) * filtro(1,3)) + (imNova(i,j-1) * filtro(2,1) )
                     + (imNova(i,j) * filtro(2,2)) + (imNova(i,j+1) * filtro(2,3))
                     + (imNova(i+1,j-1) * filtro(3,1)) + (imNova(i+1,j) * filtro(3,2))
                     + (imNova(i+1,j+1) * filtro(3,3)))/divider;
    endfor
  endfor


imresult = uint8(imresult);
figure("Name","imNova");
imshow(imresult);
