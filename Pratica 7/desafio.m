clear all;
close all;
pkg load image;
tic
im = imread("soja.png");
imBin = (zeros(size(im,1), size(im,1)));

for i=1:size(im,1)
  for j=1:size(im,2)
      if( im(i,j,1) > 80)
          imBin(i,j) = 1;
        endif
      endfor
  endfor
im = logical(imBin);
figure(1)
imshow(im)

imNova = zeros(size(im,1),size(im,2), "uint8");
rotulos = 1;
vetorErros = [];

for i=2:(size(im,1)-1)
  for j=2:(size(im,2)-1)
    cont = 1;
      if(im(i,j) && !imNova(i,j))

       if(im(i-1,j-1) == 0 && im(i-1,j) == 0 &&  im(i,j-1) == 0 && im(i-1,j+1) == 0)
        imNova(i,j) = rotulos;
        rotulos += 1;
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

vetor = 0;
contV = 1;
for i=1:size(vetorErros,1)
for j=1:size(vetorErros,2)
  if(vetorErros(i,j) != 0)
        vetor(contV,1) = i;
        vetor(contV,2) = vetorErros(i,j);
        contV++;
    endif
  endfor
endfor

vetorErrosC = [0,0];
contL =1;
for i=1:size(vetor,1)
  flag = true;

    for l=1:contL
      if(vetorErrosC(l, 1) == vetor(i,1) && vetorErrosC(l,2) == vetor(i,2))
        flag = false;
      endif
   endfor

   if(flag && vetor(i,1) != vetor(i,2))
   contL++;
    vetorErrosC(contL,1) = vetor(i,1);
    vetorErrosC(contL,2) = vetor(i,2);
   endif
 endfor
vetorErrosC;

figure(2)
imshow(imNova)
imNovaCorrigi = imNova;

for i=1:(size(im,1))
  for j=1:(size(im,2))
    for l=2:size(vetorErrosC,1)
##      for c=1:size(vetorErros,2)
        if((imNovaCorrigi(i,j) == vetorErrosC(l,2)) && imNovaCorrigi(i,j) != 0)
            imNovaCorrigi(i,j) = vetorErrosC(l,1);
          endif
##      endfor
    endfor
  endfor
  endfor

vetorErros;

figure(3)
imshow(imNovaCorrigi)

acrescentar = true;
vetorCores = 0;
cont = 1;
x1 = 0;
y1 = 0;

imwrite(imNovaCorrigi, "imc.png");
for i=1:(size(im,1))
  for j=1:(size(im,2))

      acrescentar = true;
    for l=1:cont
        if(imNovaCorrigi(i,j) == vetorCores(l))
            acrescentar = false;
        endif
      endfor

    if(acrescentar == true)
        vetorCores(cont+1) = imNovaCorrigi(i,j);
         x1(cont) = i;
         y1(cont) = j;
        cont++;
       endif
  endfor
endfor


im2 = imread("soja.png");

cont = 1;
px1 = 0;
py1 = 0;
px3 = 0;
acrescentar = true;

for i=1:(size(im,1))
  for j=1:(size(im,2))

      acrescentar = true;
    for l=1:cont
        if(imNovaCorrigi(i,j) == vetorCores(l))
            acrescentar = false;
        endif
      endfor

    if(acrescentar == true)
         vetorCores(cont+1) = imNovaCorrigi(i,j);
         px1(cont) = i;
         py1(cont) = j;
             x = px1(cont);
            while(imNovaCorrigi(x,py1(cont)) != 0)
                x++;
            endwhile
           px3(cont) = x;
        cont++;
       endif
  endfor
endfor

px2 = zeros(size(px1));
py2 = zeros(size(py1));
py3 = 0;
for i=1:(size(im,1))
  for j=1:(size(im,2))
    for l=2:size(vetorCores,2)
      if(vetorCores(1,l) == imNovaCorrigi(i,j) && (j < py2(l-1) ||  py2(l-1) == 0))
          py2(l-1) = j;
          px2(l-1) = i;
           y = py2(l-1);
             while(imNovaCorrigi(px2(l-1),y) != 0)
                y++;
            endwhile
            py3(l-1) = y;
      endif
    endfor
  endfor
  endfor

  px = zeros(size(py1));
  for i=1:size(px2,2)
    px(1, size(px2,2) - 1) = px2(i) - 1;
  endfor

for i=1:size(px2,2)
    obj = im2(px(i):px3(i), py1(i):py3(i),:);
    figure(i)
    imshow(obj)
endfor
