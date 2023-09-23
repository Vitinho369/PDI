clear all;
close all;

pkg load image;

land_34 = imread("land_34.png");
figure("Name","land_34");
imshow(land_34);


##land_34Cortes = zeros(size(land_34,1),size(land_34,2),3,"uint8");
land_34Cortes = land_34;

cont = 2;
contAnt = 0;
for i=1:4:size(land_34Cortes,1)
  for j=1:4:size(land_34Cortes,2)
    if j > contAnt && j < cont
      land_34Cortes(:,j,:) = land_34(:,j,:);
    endif
endfor
  contAnt = cont;
  cont += 2;
endfor

figure("Name","land_34Cortes")
imshow(land_34Cortes);
