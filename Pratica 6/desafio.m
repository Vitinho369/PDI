clear all;
close all;

im = imread("mapa_menor.png");

figure("Name", "Mapa");
imshow(im);

imR = im(:,:,1);
imB = im(:,:,3);

imDiametro = im;
imLimiarBola = imB > 150;
larguraBola = size(imLimiarBola,2);

px = size(imLimiarBola,1);
py = size(imLimiarBola,2);


while(!imLimiarBola(px,py))
    py--;
  if(py < 1)
    py = larguraBola;
     px--;
    endif
endwhile
py = py;
qy = py;
qx = 0;

for i=1:size(imLimiarBola,1)
    if(imLimiarBola(i,py))
      qx = i;
      break;
    endif
  endfor

for i=qx:px
    imDiametro(i,qy,:) = 255;
endfor
diametro = ((px - qx)^2 + (py - qy)^2)^(1/2)


imLimiarQuad = imR > 150;
imDistancia = im;

larguraQuad = size(imLimiarQuad);
x1 = 1;
y1 = 1;

while(!imLimiarQuad(x1,y1))
  y1++;
  if(y1 > larguraQuad)
    y1 = 1;
    x1++;
  endif
endwhile
imDistancia(x1,y1,:) = 255;

x2 = size(imLimiarQuad,1);
y2 = size(imLimiarQuad,2);

while(!imLimiarQuad(x2,y2))
  y2--;
  if(y2 < 1)
    y2 = size(imLimiarQuad,2);
    x2--;
  endif
endwhile
imDistancia(x2,y2,:) = 255;

distanciaEuclidiana = ((x1 - x2)^2 + (y1 - y2)^2)^(1/2)

distanciaKm = (distanciaEuclidiana*10)/diametro

for i=x1:x2
  imDistancia(i,y1,3) = 255;
  imDistancia(i,y2,1) = 255;
endfor

imDistancia(i,y1,2) = 255;
altura = ((((i - x1)^2 + (y1 - y1)^2)^(1/2))*10)/diametro

for i=y1:y2
  imDistancia(x1,i,1) = 255;
  imDistancia(x2,i,3) = 255;
endfor

imDistancia(x2,i,1) = 0;
imDistancia(x2,i,2) = 0;
imDistancia(x2,i,3) = 0;
base = ((((x2 - x2)^2 + (i - y1)^2)^(1/2))*10)/diametro
area = base*altura
figure("Name", "Distancia entre os pontos");
imshow(imDistancia)

