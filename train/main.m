% =============================================================
% NAIVE BAYES
% % Naive Bayes Train ===============
% Directory path diambil dari root "/"
% Untuk menggunakan file difolder lain harus add path dulu
% dataTrain = readmatrix('/data/dataEkstraksi.csv');
% labelCol = 4;
% write = 0;
% 
% % Membuat model test dari data training
% [priorPros, meanResult, stdResult] = naiveBayesTrain(dataTrain, labelCol, write);
% disp(priorPros);
% disp(meanResult);
% disp(stdResult);

% data = readmatrix('/data/dummy.csv');
% labelCol = 4;
% write = 1;
% kFold = 3; 
% folds = [];
% fold = [];
% label = getLabel(data,labelCol);
% 
% nFoldTotal = length(data) / kFold; % Total data setiap fold
% 
% % Membuat fold sebanyak k dengan row nFoldTotal
% jj = 1; % Index z di folds untuk menyimpan matrix 3 dimensi
% for ii = 1:length(data)
%     fold = [fold ii]; % Tempat menyimpan index data
%     if mod(ii, nFoldTotal) == 0
%         folds(:,:,jj) = data(fold,:);   % Data dengan index fold disimpan untuk menjadi row
%         fold = [];                      % Kosongkan fold untuk menyimpan fold baru
%         jj = jj + 1;                    % Ganti z index
%     end
% end
% 
% [frow, fcol, fz] = size(folds);
% for ff = 1:fz
%     % Pisah fold test dan fold train
%     dataTest = folds(:,:,ff);
%     dataTrain = folds;
%     dataTrain(:,:,ff) = [];
%     % Gabung dataTest menjadi 1 matrix secara vertikal
%     split = num2cell(dataTrain, [1 2]); % ambil size percell di z index
%     dataTrain = vertcat(split{:});        % gabungkan array secara vertikal
%     
% end

% % Naive Bayes Test ===============
% Menguji data test dengan model
% ! Cara manual dengan membaca file
% meanData = [];
% stdData = [];
% priorPros = [];
% % Cek jika file ada, baca matrix dan assign value
% if ~isfile('/model/mean.csv')
%     meanData = readmatrix('/model/mean.csv');
% end
% 
% if ~isfile('/model/std.csv')
%     stdData = readmatrix('/model/std.csv');
% end
% 
% if ~isfile('/model/prior_pros.csv')
%     priorPros = readmatrix('/model/prior_pros.csv');
% end

% Data dummy untuk test
% dataTest = [
%     [1,2,3];
%     [5,6,7];
%     [9,0,8];
%     [10,68,6];
%     [5,57,13];
%     [6,34,7];
%     [13,1,2];
%     [6,8,78];
%     [64,52,8];
% ];

% labelGuess = naiveBayesTest(dataTest, meanData, stdData, priorPros);
% disp(labelGuess);

% =============================================================
% Confusion matrix
% dataTrain = readmatrix('/data/dummy.csv');
% % folds = crossValidation(dataTrain);
% % disp(folds);
% label = getLabel(dataTrain, 4);
% dataTest = dataTrain([1,2,3,4],:);
% dataGuess = dataTrain([1,2,3,4],:);
% dataTest(3,4) = 2;
% dataGuess(3,4) = 2;
% dataGuess(4,4) = 3;
% labelCol = 4;
% [confusMatrix, accuracy] = confusionMatrix(dataTest, dataGuess, label, labelCol);
% disp(confusMatrix);
% disp(accuracy);

% =============================================================
% K-fold Cross Validation
% data = readmatrix('/data/dataEkstraksi.csv');
% kFold = 3;
% labelCol = 4;
% clc
% [dataTest, dataTrain, OutConfusMatrix, bestAcc] = crossValidation(data, kFold, labelCol);
