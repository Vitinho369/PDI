% FILEPATH: /home/luan/Documents/Processamento-Digital-de-Imagens/pratica_09.m

% Limpa todas as variáveis do workspace e fecha todas as janelas de imagem
clear all
##close all

% Lê a imagem "ruido.png" e armazena na variável im
im = imread("test.png");

% Mostra a imagem original
figure(1);
imshow(im);

% Define se o elemento estruturante será um círculo ou um quadrado
rhombus = true;
erodir = false;

% Inicializa as variáveis altura e largura com 0
altura = 0;
largura = 0;

% Se o elemento estruturante for um círculo, cria um círculo com o tamanho especificado pelo usuário
if rhombus
    raio = input("digite o tamanho do raio:");
    altura = (raio*2)+1;
    largura = (raio*2)+1;
    EE = zeros(altura, largura);
    for i=1:size(EE,1)
        for j=1:size(EE,2)
            % Equação da distância euclidiana para criar o círculo
            distancia = sqrt((i-(raio+1))^2 + (j-(raio+1))^2);
            EE(i,j) = distancia <= raio;
        end
    end

    % Mostra o elemento estruturante criado
    figure('name', 'EE - rhombus');
    imshow(EE);
else
    % Se o elemento estruturante for um quadrado, cria um quadrado com a altura e largura especificadas pelo usuário
    while mod(altura,2) == 0
        altura = input("digite a altura do EE (IMPAR):");
    end

    while mod(largura,2) == 0
        largura = input("digite a largura do EE (IMPAR):");
    end
    EE = ones(altura, largura);
end

% Define a operação a ser realizada (erosão ou dilatação)
if erodir
    operacao = @(A, B) A & ~B;
else
    operacao = @(A, B) A | B;
end

% Calcula o espaço vertical e horizontal que será adicionado na imagem
espacoVertical = floor(altura/2);
espacoHorizontal = floor(largura/2);

% Cria uma nova imagem com borda preta e tamanho maior que a imagem original
imProcessada = zeros(size(im,1) + altura, size(im,2) + largura);
imProcessada(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal) = im;
imBase = imProcessada;

% Mostra a imagem com a borda preta
figure('name', 'imProcessada');
imshow(imProcessada);

% Percorre a imagem original pixel a pixel
for i = 1:size(im,1)
    for j = 1:size(im,2)
        % Se o pixel for branco
        if im(i,j)
            x = i + espacoVertical;
            y = j + espacoHorizontal;

            % Pega os vizinhos do pixel atual
            vizinhos = imBase(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
            vizCropados = vizinhos & EE;

            % Se a interseção entre os vizinhos e o elemento estruturante for menor que o tamanho do elemento estruturante
            % aplica a operação de erosão ou dilatação
            if(sum(sum(vizCropados)) < sum(sum(EE)))
                vizinhos = imProcessada(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal);
                imProcessada(x-espacoVertical:x+espacoVertical, y-espacoHorizontal:y+espacoHorizontal) = operacao(vizinhos, EE);
            end
        end
    end
end

% Remove a borda preta da imagem processada
imProcessada = imProcessada(1+espacoVertical:size(im,1)+espacoVertical, 1+espacoHorizontal:size(im,2)+espacoHorizontal);

% Mostra a imagem processada
figure('name', 'imProcessada')
imshow(imProcessada);
