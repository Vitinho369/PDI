clear all;
close all;
pkg load image;

im = imread("space_invaders.png");

figure(1)
imshow(im)

imNova = zeros(size(im,1),size(im,2), "uint8");
rotulos = 20;
cont = 1;
vetorErros = [];

for i=2:(size(im,1)-1)
  for j=2:(size(im,2)-1)
    cont = 1;
      if(im(i,j) && !imNova(i,j))

       if(im(i-1,j-1) == 0 && im(i-1,j) == 0 &&  im(i,j-1) == 0 && im(i-1,j+1) == 0)
        imNova(i,j) = rotulos;
        rotulos += 10;
        else
          if(imNova(i-1,j-1) != 0)
              imNova(i,j) = imNova(i-1,j-1);

               if(imNova(i-1,j-1) != imNova(i-1,j) && imNova(i-1,j) !=0)
                vetorErros(imNova(i-1,j-1), cont++) = imNova(i-1,j);
              endif

              if(imNova(i-1,j-1) != imNova(i,j-1) && imNova(i,j-1) != 0)
                vetorErros(imNova(i-1,j-1), cont++) = imNova(i,j-1);
              endif

              if(imNova(i-1,j-1) != imNova(i-1,j+1) && imNova(i-1,j+1) != 0)
                vetorErros(imNova(i-1,j-1), cont++) = imNova(i-1,j+1);
              endif

           endif
            if(imNova(i-1,j) != 0)
                imNova(i,j) = imNova(i-1,j);

                if(imNova(i-1,j) != imNova(i-1,j-1) && imNova(i-1,j-1) !=0)
                vetorErros(imNova(i-1,j), cont++) = imNova(i-1,j-1);
              endif

              if(imNova(i-1,j) != imNova(i-1,j-1) && imNova(i,j-1) != 0)
                vetorErros(imNova(i-1,j), cont++) = imNova(i,j-1);
              endif

              if(imNova(i-1,j) != imNova(i-1,j+1) && imNova(i-1,j+1) != 0)
                vetorErros(imNova(i-1,j), cont++) = imNova(i-1,j+1);
              endif

            endif
           if(imNova(i,j-1) != 0)
               imNova(i,j) = imNova(i,j-1);

               if(imNova(i,j-1) != imNova(i-1,j) && imNova(i-1,j) !=0)
                vetorErros(imNova(i,j-1), cont++) = imNova(i-1,j);
              endif

              if(imNova(i,j-1) != imNova(i-1,j-1) && imNova(i-1,j-1) != 0)
                vetorErros(imNova(i,j-1), cont++) = imNova(i-1,j-1);
              endif

              if(imNova(i,j-1) != imNova(i-1,j+1) && imNova(i-1,j+1) != 0)
                vetorErros(imNova(i,j-1), cont++) = imNova(i-1,j+1);
              endif

            endif
            if(imNova(i-1,j+1) != 0)
               imNova(i,j) = imNova(i-1,j+1);

               if(imNova(i-1,j+1) != imNova(i-1,j) && imNova(i-1,j) !=0)
                vetorErros(imNova(i-1,j+1), cont++) = imNova(i-1,j);
              endif

              if(imNova(i-1,j+1) != imNova(i,j-1) && imNova(i,j-1) != 0)
                vetorErros(imNova(i-1,j+1), cont++) = imNova(i,j-1);
              endif

              if(imNova(i-1,j+1) != imNova(i-1,j-1) && imNova(i-1,j-1) != 0)
                vetorErros(imNova(i-1,j+1), cont++) = imNova(i-1,j-1);
              endif

            endif
      endif
      endif
    endfor
  endfor


figure(2)
imshow(imNova)
imNovaCorrigi = imNova;

for i=1:(size(im,1))
  for j=1:(size(im,2))
    for l=1:size(vetorErros,1)
      for c=1:size(vetorErros,2)
        if((imNovaCorrigi(i,j) == vetorErros(l,c)) && imNovaCorrigi(i,j) != 0)
            imNovaCorrigi(i,j) = l;
          endif
      endfor
    endfor
  endfor
  endfor

vetorErros

figure(3)
imshow(imNovaCorrigi)

acrescentar = true;
vetorCores = 0
for i=1:(size(im,1))
  for j=1:(size(im,2))

      acrescentar = true;
    for l=1:cont
        if(imNovaCorrigi(i,j) == vetorCores(l))
            acrescentar = false;
        endif
      endfor

    if(acrescentar == true)
        vetorCores(l+1) = imNovaCorrigi(i,j);
        cont++;
       endif
  endfor
endfor


contObjetos = size(vetorCores,2)-1;
contObjetos
