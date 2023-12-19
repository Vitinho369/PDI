clear all;
close all;
pkg load image;


for i=1:4
  name = ["Fotos_Pdi_2/image",num2str(i),".jpg"];
  im = imread(name);


im2 = imresize(im, 0.2);
name = ["Im2_",num2str(i)];
figure("Name", name);
imshow(im2);

im2 = im2(:,:,2);
tamanho_janela = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
imagem_filtrada = medfilt2(im2, tamanho_janela);
name = ["imagem_filtrada_",num2str(i)];
figure("Name",name)
imshow(imagem_filtrada);

ime = imagem_filtrada(:,:) > 130;
ee = [
1, 1, 1, 1, 1;
1, 1, 1, 1, 1;
1, 1, 1, 1, 1;
1, 1, 1, 1, 1;
1, 1, 1, 1, 1;];

ime2 = imerode(ime,ee);
ime2 = imdilate(ime2,ee);
name = ["ime2_",i];
figure("Name",name)
imshow(ime2);

im2 = imresize(im, 0.2);

imfinal = ime2 .* im2;
name = "imfinal_"+num2str(i);
figure("Name",name)
imshow(imfinal);
endfor
