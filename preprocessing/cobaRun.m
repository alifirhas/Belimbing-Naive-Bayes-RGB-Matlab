gambar = imread('belimbing.jpeg');
gray = rgb2gray('gambar')
resz = resize1 (gray)
rem = removeMan(resz)
ekstraksi1 = ekstraksiMan (double(rem));

subplot(1,3,3),imshow(rem);
subplot(1,3,2),imshow(resz);
subplot(1,3,1),imshow(gray);
%imshow (rem);