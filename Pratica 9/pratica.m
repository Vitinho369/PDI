clear all;
##close all;

im = logical(imread("brain.png"));
imAlterada = im;
figure("Name","Brain");
imshow(im);
largura = size(im,1);
altura = size(im,2);

elementoE = input("Voce deseja um elemento estruturante quadrado ou rhombus? 1 - quadrado, 0 - rhombus ");

if elementoE == 1
  medida = input("Digite a largura do quadrado: ");

  elementoEE = logical(ones(medida, medida));

elseif elementoE == 0
    medida = input("Digite o raio do elemento rhombus: ");
    elementoEE = logical(zeros((medida*2)+1, (medida*2)+1));

    for i=1:size(elementoEE,1)
      for j=1:size(elementoEE,2)
        if sqrt((i - medida - 1).^2 + (j - medida - 1).^2 ) <= medida
            elementoEE(i,j) = 1;
          endif
      endfor
    endfor
 endif


figure("Name","Elemento estruturante");
imshow(elementoEE);

erodir = input("Voce deseja erodir ou dilatar a imagem? 1 - erodir, 0 - dilatar ");
##imAlterada = uint8(imAlterada);
if erodir == 0
  printf("dilatar")

    for i=1:size(im,1)
      for j=1:size(im,2)
        if i+ medida < size(im,1) && j+medida < size(im,2)
          corte = im(i:i+medida, j:j+medida,:);

          if sum(sum(corte)) != 0 && sum(sum(corte)) != sum(sum(elementoEE))
               for l=1:size(elementoEE,1)
                for c=1:size(elementoEE,2)
                    imAlterada(i+l-1,j+c-1,:) = imAlterada(i+l-1,j+c-1,:)  || elementoEE(l,c,:);
                endfor
              endfor

          endif
        endif

      endfor
    endfor
##    imAlterada = logical(imAlterada);
    figure("Name", "Imagem dilatada");
    imshow(imAlterada);
  elseif erodir == 1
    printf("erodir")


    for i=1:size(im,1)
      for j=1:size(im,2)
        if i+ medida < size(im,1) && j+medida < size(im,2)
          corte = im(i:i+medida, j:j+medida,:);

          if sum(sum(corte)) != 0 && sum(sum(corte)) != sum(sum(elementoEE))
              for l=1:size(elementoEE,1)
                for c=1:size(elementoEE,2)
                  if i+l < largura && j+c < altura && imAlterada(i+l,j+c,:) == 0 && elementoEE(l,c,:) == 1
                    imAlterada(i,j,:) = 0;
                    break;
                  endif
                endfor
              endfor
          endif
        endif

      endfor
    endfor

##    imAlterada = logical(imAlterada);
    figure("Name", "Imagem erodida");
    imshow(imAlterada);
  else
    printf("opcao invalida")
  endif
