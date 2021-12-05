function [confusMatrix,accuracy] = confusionMatrix(dataTest,dataGuess, label, labelCol)
%CONFUSIONMATRIX Menghitung confusion matrix
% % Parameter
%   dataTest [matrix] = data sesunggunya yang memiliki label
%   dataGuess [matrix] = data dengan label hasil tebakan naive bayes test
% 
% % Return
%   confusMatrix [matrix] = tempat confusion matrix, memiliki nama lain agar tidak
%   overide nama method
%   accuracy [int]        = akurasi confusion matrix

labelLen = length(label);
confusMatrix = zeros(labelLen,labelLen);

% Buat confusion matrix
for ii = 1:length(dataTest)
    % confusMatrix(dataTest(ii, labelCol), dataGuess(ii, labelCol)) = confusMatrix(dataTest(ii, labelCol), dataGuess(ii, labelCol)) + 1;
    % Dibawah versi kode panjang kebawah dari yang diatas
    place = confusMatrix(dataTest(ii, labelCol), dataGuess(ii, labelCol));
    place = place + 1;
    confusMatrix(dataTest(ii, labelCol), dataGuess(ii, labelCol)) = place;
end

% Hitung akurasi
% totalData bisa diganti panjang data tapi mengikuti rumus
totalData = sumMan(sumMan(confusMatrix), 1);    
dataBenar = [];
for db = 1:length(confusMatrix)
    dataBenar = [dataBenar confusMatrix(db,db)];
end

dataBenar = sumMan(dataBenar, 1);
accuracy = (dataBenar / totalData) * 100; % Simbol persen ditambah sendiri

end

