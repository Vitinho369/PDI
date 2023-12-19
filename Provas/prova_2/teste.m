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
bin = imGraosSemRuido;
labels = zeros(size(bin));
label = 0;

function unique_viz = calc_unique (viz)
    unique_viz = [];
    for s = 1 : length(viz)
        flag = false;
        for t = 1 : length(unique_viz)
            if viz(s) == unique_viz(t)
                flag = true;
            endif
        endfor
        if(!flag && viz(s) != 0)
            unique_viz = [unique_viz, viz(s)];
        endif
    endfor
endfunction

errors = [];

for i = 1:size(bin,1)
    for j = 1:size(bin,2)
        if bin(i,j)
            viz = [labels(i-1,j), labels(i,j-1)];
            unique_viz = calc_unique(viz);
            if(length(unique_viz) == 0)
                label++;
                labels(i,j) = label;
            elseif(length(unique_viz) == 1)
                labels(i,j) = unique_viz(1);
            elseif(length(unique_viz) == 2)
                labels(i,j) = unique_viz(1);
                errors = [errors;unique_viz];
            end
        endif
    endfor
endfor

figure("Name","Labels")
imshow(labels)
imNovaCorrigi = imGraosSemRuido;
for i=1:(size(imGraosSemRuido,1))
  for j=1:(size(imGraosSemRuido,2))
    for l=1:size(errors,1)
        if((imNovaCorrigi(i,j) == errors(l,2)) && imNovaCorrigi(i,j) != 0)
            imNovaCorrigi(i,j) = errors(l,1);
          endif
    endfor
  endfor
  endfor
