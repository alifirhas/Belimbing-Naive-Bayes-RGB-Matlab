function [dataOutput] = naiveBayesTest(dataTest,meanData, stdData, priorPros)
%NAIVEBAYESTEST Menentukan label data menggunakan model
%   test akan memprediksi label yang dimiliki data test
%   berdasarkan likelihood data yang didapatkan
% % Parameter
%   dataTest (matrix)   : data test (data tanpa label) minimal satu row
%   meanData (matrix)   : didapatkan dari meanData.csv
%   stdData (matrix)    : didapatkan dari std.csv
%   priorPros (matrix)  : didapatkan dari prior_pros.csv
%
% Return
%   dataOutput (matrix)   : data test dengan label guest

dataOutput = [];
label = getLabel(priorPros, 2);
[row col] = size(dataTest);
scores = [];

% Hitung semua likelihood data dan label
% Loop seluruh row data
for jj = 1:row
    % Loop setiap label untuk menghitung scores(nilai likelihood total)
    % Penggunaan log base e menghindari nilai underflow
    score = [];
    initialGuess = [];
    for ii = 1:length(label)
        test = dataTest(jj,:);
        initialGuess = log(priorPros(ii,1));
        meanLabel = meanData(ii,:);
        stdLabel = stdData(ii,:);
        % Hitung likelihood setiap label
        for kk = 1:length(test)
            num = test(kk);
            mean = meanLabel(kk);
            std = stdLabel(kk);
            initialGuess = initialGuess + log(likelihoodMan(num, mean, std));
        end
        score = [score initialGuess];
    end
    scores = [scores; score];
end

% Tentukan label masing-masing data berdasarkan scores
% Proses dilakukan disini agar loop tidak menjadi rumit
scores = abs(scores);
[rowsc, colsc] = size(scores);
for mm = 1:rowsc
    score = scores(mm,:);
    label = label(1);
    maxScore = score(1);
    for nn = 1:colsc
        if score(nn) > maxScore
            maxScore = score(nn);
            label = nn;
        end
    end
    dataOutput = [dataOutput; dataTest(mm,:) label];
end

end

