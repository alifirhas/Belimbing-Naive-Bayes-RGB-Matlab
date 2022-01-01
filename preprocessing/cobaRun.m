gambar = imread('tas.jpg');
resz = resize1(gambar)
rem = removeMan(resz)
ekstraksi1 = ekstraksiMan (double(rem));

subplot(1,3,3),imshow(rem);
subplot(1,3,2),imshow(resz);
subplot(1,3,1),imshow(gambar);
%imshow (rem);