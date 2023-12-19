clear all;
close all;
pkg load image;

im = imread("imagens/prv2.jpg");

largura = size(im,1);
altura = size(im,2);
figure("Name","prv2");
imshow(im);

mascara = im(:,:,2) < 55;

imAlterada = mascara;
imAlterada2 = mascara;

figure("Name", "mascara");
imshow(mascara);

imwrite(mascara, "test.png");
medida = 2;
elementoEE = logical(zeros((medida*2)+1, (medida*2)+1));
largura = floor(size(elementoEE,1)/2);
altura = floor(size(elementoEE,2)/2);

for i=1:size(elementoEE,1)
  for j=1:size(elementoEE,2)
    if sqrt((i - medida - 1).^2 + (j - medida - 1).^2 ) <= medida
        elementoEE(i,j) = 1;
      endif
  endfor
endfor

espacoVertical = altura;
espacoHorizontal = largura;

% Cria uma nova imagem com borda preta e tamanho maior que a imagem original
imProcessada = zeros(size(im,1) + altura, size(im,2) + largura);
imProcessada2 = zeros(size(im,1) + altura, size(im,2) + largura);
imProcessada(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal) = mascara;
imProcessada2(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal) = mascara;
imBase = imProcessada;

##medida = medida*2;
figure("Name", "Rombus")
imshow(elementoEE);

    for i=1:size(im,1)
      for j=1:size(im,2)
         if mascara(i,j)
            x = i + espacoVertical;
            y = j + espacoHorizontal;

            % Pega os vizinhos do pixel atual
            vizinhos = imBase(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
            vizCropados = vizinhos & elementoEE;

            % Se a interseção entre os vizinhos e o elemento estruturante for menor que o tamanho do elemento estruturante
            % aplica a operação de erosão ou dilatação
            if(sum(sum(vizCropados)) < sum(sum(elementoEE)))
                vizinhos = imProcessada(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
                imProcessada(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal) =  vizinhos | elementoEE;
            end
        end

      endfor
    endfor

% Remove a borda preta da imagem processada
imProcessada = imProcessada(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal);

% Mostra a imagem processada
figure('name', 'imProcessada')
imshow(imProcessada);


    for i=1:size(im,1)
      for j=1:size(im,2)
         if mascara(i,j)
            x = i + espacoVertical;
            y = j + espacoHorizontal;

            % Pega os vizinhos do pixel atual
            vizinhos = imBase(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
            vizCropados = vizinhos & elementoEE;

            % Se a interseção entre os vizinhos e o elemento estruturante for menor que o tamanho do elemento estruturante
            % aplica a operação de erosão ou dilatação
            if(sum(sum(vizCropados)) < sum(sum(elementoEE)))
                vizinhos = imProcessada2(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
                imProcessada2(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal) =  vizinhos & ~elementoEE;
            end
        end

      endfor
    endfor

imProcessada4 = zeros(size(im,1) + altura, size(im,2) + largura);

imProcessada4(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal) = imProcessada;
imBase = imProcessada4;

    for i=1:size(im,1)
      for j=1:size(im,2)
         if imProcessada(i,j)
            x = i + espacoVertical;
            y = j + espacoHorizontal;

            % Pega os vizinhos do pixel atual
            vizinhos = imBase(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
            vizCropados = vizinhos & elementoEE;

            % Se a interseção entre os vizinhos e o elemento estruturante for menor que o tamanho do elemento estruturante
            % aplica a operação de erosão ou dilatação
            if(sum(sum(vizCropados)) < sum(sum(elementoEE)))
                vizinhos = imProcessada4(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
                imProcessada4(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal) =  vizinhos | elementoEE;
            end
        end

      endfor
    endfor

imProcessada4 = imProcessada4(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal);
figure("Name","imProcessada4");
imshow(imProcessada4);

imFinal = imProcessada4 & ~imProcessada;

figure("Name", "Imfinal");
imshow(imFinal);

imRuido = imread("imagens/ruido1.jpg");
imBorda = zeros(size(imRuido,1)+2, size(imRuido,2)+2, 3, "uint8");
imBorda = imRuido;
for i=2:size(imBorda,1)-1
  for j=2:size(imBorda,2)-1
     imBorda(i,j,:) = imRuido(i-1,j-1,:);
    endfor
  endfor

  figure("Name","Borda");
  imshow(imBorda);
imBordaNova = imBorda;

for i=2:size(imBorda,1)-1
  for j=2:size(imBorda,2)-1
      viz = imBorda(i-1:i+1,j-1:j+1);
      cont=1;
      for l=1:size(viz,1)
        for c=1:size(viz,2)
             vizVector(1,cont) = viz(l,c);
             cont++;
        endfor
        endfor
      vizVector = sort(vizVector);

      imBordaNova(i,j,:) = vizVector(1,5);
    endfor
  endfor

figure("Name", "Viz");
imshow(imBordaNova);

filtro = [-1, -1,-1;
-1, 36,-1;
-1,-1,-1];

imBorda = double(imBordaNova);
divider = sum(sum(filtro));
##imBordaNova(2:size(im,1)+1, 2:size(im,2)+1) = imBordaNova;

imresult = imBordaNova;
for i=2:size(imBorda,1)-1
  for j=2:size(imBorda,2)-1
      imresult(i-1,j-1,:) = ((imBorda(i-1, j-1,:) * filtro(1,1)) +  (imBorda(i-1,j,:) * filtro(1,2))
                     + (imBorda(i-1,j+1,:) * filtro(1,3)) + (imBorda(i,j-1,:) * filtro(2,1) )
                     + (imBorda(i,j,:) * filtro(2,2)) + (imBorda(i,j+1,:) * filtro(2,3))
                     + (imBorda(i+1,j-1,:) * filtro(3,1)) + (imBorda(i+1,j,:) * filtro(3,2))
                     + (imBorda(i+1,j+1,:) * filtro(3,3)))/divider;
    endfor
  endfor

imc = imBordaNova-imresult;
figure("Name","imResult");
imshow(imc);
imR = imBordaNova + imc;
figure("Name","imResult");
imshow(imR);
