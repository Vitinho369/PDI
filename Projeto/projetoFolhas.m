clear all;
close all;
pkg load image;

i=2;
##for i=1:4
  name = ["Fotos_Pdi_2/image",num2str(i),".jpg"];
  im = imresize(imread(name),0.2);

  name = ["im",num2str(i)];
  figure("Name",name)
  imshow(im);

##  name = ["imR",num2str(i)];
##  figure("Name",name)
##  imshow(im(:,:,1));
##
##  name = ["imG",num2str(i)];
##  figure("Name",name)
##  imshow(im(:,:,2));

  name = ["imB",num2str(i)];
  figure("Name",name)
  imbw = (im(:,:,3) < 135) .* im;
  imshow(imbw);
##endfor
