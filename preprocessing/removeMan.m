function [removeBg] = removeMan(gambar)
removeBg = [];
%gambar = imread('belimbing.jpeg');
%ambil channel warna biru
blue = gambar (:,:,3);
[M,N]=size(blue);
B_seg = zeros(M,N);
%ubah gambar ke warna biner
for k = 1 : M
    for l = 1 :N
        if blue (k,l)>50
            B_seg(k,l)=0;
        else 
            B_seg(k,l)=1;
        end
    end
end
B_seg2=imfill(B_seg);
%gray = rgb2gray(gambar);
%gray(~B_seg2) = 255;
%kembalikan warna jadi rgb
% Break down and mask the planes:
r = gambar(:,:,1);
g = gambar(:,:,2);
b = gambar(:,:,3);
r(~B_seg2) = 0;
g(~B_seg2) = 0;
b(~B_seg2) = 0;
% Reconstruct the RGB image:
img = cat(3,r,g,b);

[row,col] = find(B_seg2==1);
h_RGB = imcrop(img,[min(col) min(row) max(col)-min(col) max(row)-min(row)]);

% Get the equivalent bounding box.
%props = regionprops(B_seg2, 'BoundingBox');
% Crop the image
%croppedImage = imcrop(img, props.BoundingBox);

removeBg = [removeBg h_RGB];
%imshow (removeBg);
end
%tampilkan gambar
%subplot(1,4,1),imshow(gambar);
%subplot(1,4,2),imshow(blue);
%subplot(1,4,3),imhist(blue);
%subplot(1,4,3),imshow(B_seg2);
%subplot(1,4,4),imshow(croppedImage);