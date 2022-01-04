function [ekstraksi] = ekstraksiMan(data)
%data = imread('belimbing - matang.jpeg');
ekstraksi = [];
[r,c,z]=size(data); %array size
for x = 1:z %perulangan sebanyak z
    channel = data (:,:,x); %cari channel
    colMean = meanMan(meanMan(channel)); %rata rata per channel
    colstd = stdMan(channel, colMean); %kolom standar deviasi
    std = stdMan(colstd, meanMan(colstd, 1),1);% baris standar deviasi
    varian = std^2; %varian
    ekstraksi = [ekstraksi varian]; %simpan dalam array
end
disp(colMean);
disp(std);
disp (ekstraksi);
end