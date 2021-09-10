%Examen primer parcial
%% Lectura de imagen 
imgOr = imread('manos.jpg');
imgMask=imadjust(imgOr)+40;
imshow(imgMask);

%% Detección de imagenes prewitt
[basura umbral]=edge(imgMask, 'prewitt');
factorAjuste=0.6;
bws = edge(imgMask,'prewitt',umbral*factorAjuste);
figure(2);
imshow(bws);
axis off;
title('Mascara de gradiente binario');


%% Mejorar bordes - Strelling - 
se90=strel('line',7,90);
se0=strel('line',7,0);

%% Dilatación de bordes
bwdil = imdilate(bws,[se90 se0]);
figure(3);
imshow(bwdil);
axis off;
title('Mascara con gradiente de dilatación');

%% Rellenar espacios
for i=0:10
    bwfill = imfill(bwdil,'holes');
end
figure(4);
imshow(bwfill);
axis off;
title('Mascara con relleno');

%% Limpieza de bordes
bwNoBorder = imclearborder(bwfill,1);%1,4,6,8 ...
figure(5);
imshow(bwNoBorder);
axis off;
title('Mascara sin bordes');

%% Objeto Aislado
imgFinal=imgOr.*uint8(bwNoBorder);
figure(6);
imshow(imgFinal);
axis off;
title('Mascara sin bordes');

%% filtrado de imagen huesos
filt=(1/(5*5))*ones(5);
for a=1:5
    imf=conv2(img,filt,'same');
end
imshow(imf/100);

%% filtrado de imagen musculos
musculos = filter2(fspecial('gaussian',[33 33], .5),imf)/16;
bw = imbinarize(musculos);
imshow(bw);
%% filtrado de imagen huesos
huesos = filter2(fspecial('gaussian',[33 33], .5),img)/130;
bw = imbinarize(huesos);
imshow(bw);
%% 3d
surf(imf/100); shading interp;
view([-30,-45]);
colormap bone;
axis off;