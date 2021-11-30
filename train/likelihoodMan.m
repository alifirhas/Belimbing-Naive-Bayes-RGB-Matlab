function [dataOutput] = likelihoodMan(num, mean, std)
%LIKELIHOOD Menghitung likelihood dari data test dengan data test
%   Menggunakan model(mean, std, prior probabilites) yang dihasilkan test
%   num (int)   : angka dari col data
%   mean (int)  : mean dari label
%   std (int)   : std dari label

firstHalf = 1 / (sqrt(2*pi())*std);
secondHalf = exp(1)^((-(num-mean)^2)/(2*(std^2)));
disp(firstHalf);
disp(secondHalf);
dataOutput = firstHalf * secondHalf;

end

