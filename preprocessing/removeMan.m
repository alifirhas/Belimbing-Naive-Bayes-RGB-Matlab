function [removeBg] = removeMan(gambar)
removeBg = [];
%gambar = imread('belimbing - matang.jpeg');
blue = gambar (:,:,3);%ambil channel warna biru
[M,N]=size(blue); %array size
B_seg = zeros(M,N); %simpan dalam array

%ubah gambar ke warna biner
for k = 1 : M %perulangan sebanyak baris
    for l = 1 :N %perulangan sebanyak kolom
        if blue (k,l)>50 %cek nilai k dan l
            B_seg(k,l)=0; %lebih dari 50 ubah nilai jadi 0 
        else 
            B_seg(k,l)=1; %kurang dari 50 ubah nilai jadi i
        end
    end
end

B_seg2=imfill(B_seg); %isi daerah gambar 

%kembalikan warna jadi rgb
% Break down and mask the planes:
r = gambar(:,:,1);
g = gambar(:,:,2);
b = gambar(:,:,3);

%daerah backround tetap menjadi hitam
r(~B_seg2) = 0;
g(~B_seg2) = 0;
b(~B_seg2) = 0;

img = cat(3,r,g,b);% Reconstruct the RGB image
[row,col] = find(B_seg2==1);%mencari nilai 
%crop berdasarkan nilai row, col
h_RGB = imcrop(img,[min(col) min(row) max(col)-min(col) max(row)-min(row)]);

removeBg = [removeBg h_RGB];
%imshow (removeBg);
end
%tampilkan gambar
%subplot(1,4,1),imshow(gambar);
% subplot(1,4,2),imshow(blue);
% subplot(1,4,3),imhist(blue);
% subplot(1,4,3),imshow(B_seg2);
% subplot(1,4,4),imshow(removeBg);