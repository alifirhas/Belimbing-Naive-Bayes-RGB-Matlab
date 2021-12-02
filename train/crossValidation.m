function [dataTest, dataTrain] = crossValidation(data, kFold, labelCol)
%CROSSVALIDATION Menguji fold terbaik untuk model training
% % Parameter
% data [matrix] = data yang akan diuji
% kFold [int]   = jumlah fold yang akan dibuat, default 3
% 
% % Return
% dataTest [matrix] = data test terbaik yang digunakan
% dataTrain [matrix] = data train terbaik yang digunakan
% 
% % Langkah
% 1. Bagi semua data menjadi k-fold
% 2. Untuk setiap fold yang ada di folds
% 3. gunakan 1 fold untuk test dan 2 fold untuk training
% 4. uji dengan naive bayes train dan naive bayes tesst
% 5. buat confussion matrix setiap test dengan membandingkan label hasil test
% dengan label data sebenarnya
% 6. selesai untuk setiap fold
% 7. Pilih fold training dengan akurasi confusion matrix paling tinggi

% Hentikan program jika fold tidak memiliki ukuran yang sama
if mod(length(data), kFold) ~= 0
    error("Fold tidak memiliki jumlah yang sama, " + length(data)+" tidak habis dibagi dengan "+kFold);
end

confusMatrices = [];
accuracy = [];
if ~exist('kFold','var') 
    kFold = 3; 
end
folds = [];
fold = [];
label = getLabel(data,labelCol);

nFoldTotal = length(data) / kFold; % Total data setiap fold

% Membuat fold sebanyak k dengan row nFoldTotal
jj = 1; % Index z di folds untuk menyimpan matrix 3 dimensi
for ii = 1:length(data)
    fold = [fold ii]; % Tempat menyimpan index data
    if mod(ii, nFoldTotal) == 0
        folds(:,:,jj) = data(fold,:);   % Data dengan index fold disimpan untuk menjadi row
        fold = [];                      % Kosongkan fold untuk menyimpan fold baru
        jj = jj + 1;                    % Ganti z index
    end
end

% Test setiap fold menggunakan naive bayes test & train
% Dan hitung masing-masing confusion matrix
[frow, fcol, fz] = size(folds);
for ff = 1:fz
    % Pisah fold test dan fold train
    dataTest = folds(:,:,ff);
    dataTrain = folds;
    dataTrain(:,:,ff) = [];
    % Gabung dataTest menjadi 1 matrix secara vertikal
    split = num2cell(dataTrain, [1 2]); % ambil size percell di z index
    dataTrain = vertcat(split{:});        % gabungkan array secara vertikal
   
    % % Proses naive bayes
    [priorPros, meanData, stdData] = naiveBayesTrain(dataTrain, labelCol);
    dataGuess = naiveBayesTest(dataTest, meanData, stdData, priorPros);

    % % Hitung confusion matrix
    [confusMatrix, acc] = confusionMatrix(dataTest, dataGuess, label, labelCol);
    confusMatrices(:,:,ff) = confusMatrix;
    accuracy = [accuracy acc];
end

% Tentukan fold training dan test yang terbaik

bestAcc = accuracy(1);
for ic = 1:length(accuracy)
    if accuracy(ic) > bestAcc
        bestAcc = accuracy(ic);
        dataTest = folds(ic);
        dataTrain = folds;
        dataTrain(ic) = [];
        % Gabung dataTest menjadi 1 matrix secara vertikal
        split = num2cell(dataTrain, [1 2]); % ambil size percell di z index
        dataTrain = vertcat(split{:});        % gabungkan array secara vertikal
    end
end

% Gabungkan 3 dimen matrix ke 2 dimen matrix vertikal
% split = num2cell(dataTrain, [1 2]); % ambil size percell di z index
% vercat(split{:}) % gabungkan array secara vertikal
end