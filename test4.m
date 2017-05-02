%VOLITELNE PARAMETRE
% Zvoleny obrazok
im = imread('triangle.jpg');

% Velkost Gaussovej masky
N =7;

% Velkost sigmy
sigma =1.9;

% Maska pre Laplacian
A=[1 1 1;1 -8 1;1 1 1];

%%

%Transformácia RGB obrázku na cierno biely
% gray = (0.2989 * double(im(:,:,1)) + 0.5870 * double(im(:,:,2)) + 0.1140 * double(im(:,:,3)))/255;
gray = rgb2gray(im);

%Pridanie sumu
grayNoise = imnoise(gray,'Gaussian',0.04,0.003);
grayNoise = im2double(grayNoise)

%Generácia Gaussovej masky
ind = -floor(N/2) : floor(N/2);
[X Y] = meshgrid(ind, ind);
h = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
h = h / sum(h(:));

out=Funkcia_konv(grayNoise,h,N)
grayGauss = out;
% imshow(out)

grayLOG=Funkcia_konv(grayGauss,A,3)
A2=A(end:-1:1,end:-1:1)
G=conv2(grayGauss,A2,'same');

%% Vykreslenie obrazkov
%Povodny obrazok

imshow(im)
figure

%Cierno biely obrazok
imshow(gray)
figure

%Obrazok so sumom
imshow(grayNoise)
figure

%Obrazok po aplikovani Gaussa
imshow(grayGauss)
figure

%Obrazok po aplikovani Laplaciana
imshow(grayLOG)
figure

%Porovnanie s funckiou conv2
imshow(G)

