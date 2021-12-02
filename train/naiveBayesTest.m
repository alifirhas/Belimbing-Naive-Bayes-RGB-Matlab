function [dataOutput] = naiveBayesTest(dataTest,meanData, stdData, priorPros)
%NAIVEBAYESTEST Menentukan label data menggunakan model
%   test akan memprediksi label yang dimiliki data test
%   berdasarkan likelihood data yang didapatkan
%   dataTest (matrix)   : data test minimal satu row
%   meanData (matrix)   : didapatkan dari meanData.csv
%   stdData (matrix)    : didapatkan dari std.csv
%   priorPros (matrix)  : didapatkan dari prior_pros.csv

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
for mm = 1:length(scores)
    score = scores(mm,:);
    label = label(1);
    maxScore = score(1);
    for nn = 1:score
        if score(nn) > maxScore
            maxScore = score(nn);
            label = nn;
        end
    end
    dataOutput = [dataOutput; dataTest(mm,:) label];
end

end

