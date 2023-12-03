clear all;
close all;

im = imread("lena.jpg");
imgray = rgb2gray(im);

##filtro =[1 1 1,
##1 1 1,
##1 1 1];


##filtro = [-1 -1 -1,
##-1 8 -1,
##-1 -1 -1];

filtro = [ -1 -1 -1;
            0  0  0;
            1  1  1];

imBorda = zeros(size(imgray,1)+2, size(imgray,2)+2, 3, "uint8");

for i=2:size(imBorda,1)-1
  for j=2:size(imBorda,2)-1
      imBorda(i,j,:) = imgray(i-1, j-1,:);
    endfor
  endfor

 figure("Name","imBorda");
 imshow(imBorda);
divider = sum(sum(filtro));

if(divider ==0)
  divider=1; #Faz o filtro ficar não-linear e não normalizado
endif

imresult = imgray;
imBorda = double(imBorda);
for i=2:size(imBorda,1)-1
  for j=2:size(imBorda,2)-1
      imresult(i-1,j-1) = ((imBorda(i-1, j-1) * filtro(1,1)) +  (imBorda(i-1,j) * filtro(1,2))
                     + (imBorda(i-1,j+1) * filtro(1,3)) + (imBorda(i,j-1) * filtro(2,1) )
                     + (imBorda(i,j) * filtro(2,2)) + (imBorda(i,j+1) * filtro(2,3))
                     + (imBorda(i+1,j-1) * filtro(3,1)) + (imBorda(i+1,j) * filtro(3,2))
                     + (imBorda(i+1,j+1) * filtro(3,3)))/divider;
    endfor
  endfor

figure("Name","imResult");
imshow(imresult);
