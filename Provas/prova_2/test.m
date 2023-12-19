clear all;
close all;

imGraos = imread("1_graos.png");

figure("Name","imGraos");
imshow(imGraos);

elementoEE = [1 1 1;
1 1 1;
1 1 1];

imGraosSemRuido = imGraos;

for i=1:size(imGraosSemRuido,1)
      for j=1:size(imGraosSemRuido,2)

    if imGraos(i,j)
      corte = imGraosSemRuido(i:i+2, j:j+2,:);
      corteV = corte & elementoEE;

      if sum(sum(corteV)) != 0 && sum(sum(corteV)) != sum(sum(elementoEE))
           imGraosSemRuido(i:i+2, j:j+2,:) = corte  | elementoEE;
      endif
    endif
  endfor
endfor

figure("Name","imGraosSemRuido");
imshow(imGraosSemRuido);

im = imGraosSemRuido;

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

figure("Name", "imNova")
imshow(imNova)
imNovaCorrigi = imNova;

for i=1:(size(im,1))
  for j=1:(size(im,2))
    for l=2:size(vetorErrosC,1)
        if((imNovaCorrigi(i,j) == vetorErrosC(l,2)) && imNovaCorrigi(i,j) != 0)
            imNovaCorrigi(i,j) = vetorErrosC(l,1);
          endif
    endfor
  endfor
  endfor

vetorErros;

figure("Name", "imNovaCorrigi")
imshow(imNovaCorrigi)

acrescentar = true;
vetorCores = 0;
cont = 1;

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
        cont++;
       endif
  endfor
endfor

qtdRegioes = size(vetorCores,2)-1;
qtdRegioes
