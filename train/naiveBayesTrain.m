function [priorPros, meanResult, stdResult] = naiveBayesTrain(dataTrain,labelCol, write)
%NAIVE Membuat prior_probabilites dan train_result
%   Format matrix bisa dilihat di https://github.com/alifirhas/Belimbing-Naive-Bayes-RGB-Matlab/wiki/Naive-Bayes-Diagram#struktur-csv
%   dataTrain (matrix)  : Data training
%   labelCol (int)      : Kolom label di matrix
% 

% Ambil ukuran matrix data
[row, col] = size(dataTrain);

% Tentukan kolom data
dataCol = reshape(1:col,1,[]);
dataCol(labelCol) = [];

% Ambil label data yang ada di matrix
label = getLabel(dataTrain, labelCol);
labelSize = length(label);

% Tempat menyimpan mean dan stdv
meanMatrix = [];
stdMatrix = [];
priorProsMatrix = [];

for ii = 1:labelSize
    dataLabel = [];
    for jj = 1:row
        if dataTrain(jj,labelCol) == label(ii)
            dataLabel = [dataLabel; dataTrain(jj, :)];
        end
    end

    % Hitung rata-rata setiap row data
    meanData = meanMan(dataLabel(:, dataCol));
    meanMatrix = [meanMatrix; [meanData label(ii)]];

    % Hitung standar deiviasi setiap row data
    % Standar deviasi perlu mean dari row data
    stdData = stdMan(dataLabel(:, dataCol), meanData);
    stdMatrix = [stdMatrix; [stdData label(ii)]];
    
    % Hitung Initial Guess
    initialGuess = length(dataLabel) / length(dataTrain);
    priorProsMatrix = [priorProsMatrix; [initialGuess label(ii)]];
    
end

% Tampilkan hasil, bisa dimatikan, cuman buat ngecek
% disp(meanMatrix);
% disp(stdMatrix);
% disp(priorProsMatrix);

% Assign value di return, kalau mau dipakai
meanResult = meanMatrix;
stdResult = stdMatrix;
priorPros = priorProsMatrix;

% Tulis hasil di csv
if ~exist('write','var')
    write = 0;
end
if write ~= 0
    writematrix(meanResult, 'model/mean.csv');
    writematrix(stdResult, 'model/std.csv');
    writematrix(priorPros, 'model/prior_pros.csv');
end

end

