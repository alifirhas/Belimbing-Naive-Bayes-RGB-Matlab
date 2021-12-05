function [dataOutput] = likelihoodMan(num, mean, std)
%LIKELIHOOD Menghitung likelihood dari data dengan model
%   Menggunakan model(mean, std, prior probabilites) yang dihasilkan test
% % Parameter
%   num (int)   : angka dari col data
%   mean (int)  : mean dari label
%   std (int)   : std dari label
% 
% % Return
%   dataOutput (float) : Hasil perhitungan yang ada

firstHalf = 1 / (sqrt(2*pi())*std);
secondHalf = exp(1)^((-(num-mean)^2)/(2*(std^2)));
dataOutput = firstHalf * secondHalf;

end

