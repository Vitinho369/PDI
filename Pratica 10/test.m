clear all;
##close all;

function imBorda = adicionarBordas(im)
    % Adicionar bordas pretas para evitar problemas com a convolução
    imBorda = zeros(size(im,1)+2, size(im,2)+2);
    for i = 1:size(im,1)
        for j = 1:size(im,2)
            imBorda(i+1,j+1) = im(i,j);
        end
    end

    % Copiando as bordas da imagem original
    for i = 1:size(im,1)
        imBorda(i+1,1) = im(i,1);
        imBorda(i+1,size(im,2)+2) = im(i,size(im,2));
    end

    for j = 1:size(im,2)
        imBorda(1,j+1) = im(1,j);
        imBorda(size(im,1)+2,j+1) = im(size(im,1),j);
    end
end

function im = filtrar(im, filtro)
    imFiltrada = adicionarBordas(im);

    % Convolução/Filtragem
    for i = 2:size(imFiltrada,1)-1
        for j = 2:size(imFiltrada,2)-1
            viz = imFiltrada(i-1:i+1, j-1:j+1);
            viz = viz.*filtro;
            im(i-1,j-1) = sum(sum(viz));
        end
    end
end


% -------------------------------


% Lendo a imagem
im = imread("lena.jpg");

% Transformando em escala de cinzas
imCinza = rgb2gray(im);

figure(1);
imshow(imCinza);


filtro = [  0 -1  0;
           -1  5 -1;
            0 -1  0];

figure('name', 'SHarpening')
imshow(filtrar(imCinza, filtro))


filtro = [ -1 -1 -1;
            0  0  0;
            1  1  1];

figure('name', 'Sobel')
imshow(filtrar(imCinza, filtro))
