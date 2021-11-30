function [ekstraksi] = ekstraksiMan(data)
ekstraksi = [];
[r,c,z]=size(data);
for x = 1:z
    channel = data (:,:,x);
    colMean = meanMan(meanMan(channel));
    colstd = stdMan(channel, colMean);
    std = stdMan(colstd, meanMan(colstd, 1),1);
    varian = std^2;
    ekstraksi = [ekstraksi varian];
end

disp (ekstraksi);
end