% Directory path diambil dari root "/"
% Untuk menggunakan file difolder lain harus add path dulu
% dataTrain = readmatrix('/data/dummy.csv');

% labelCol = 4;

% Membuat model test dari data training
% [priorPros, meanResult, stdResult] = naiveBayesTrain(dataTrain, labelCol);

% Menguji data test dengan model
% % ! Cara manual dengan membaca file
meanData = [];
stdData = [];
priorPros = [];

% Cek jika file ada, baca matrix dan assign value
if ~isfile('/model/mean.csv')
    meanData = readmatrix('/model/mean.csv');
end

if ~isfile('/model/std.csv')
    stdData = readmatrix('/model/std.csv');
end

if ~isfile('/model/prior_pros.csv')
    priorPros = readmatrix('/model/prior_pros.csv');
end

dataTest = [
    [1,2,3];
    [5,6,7];
    [9,0,8];
    [10,68,6];
    [5,57,13];
    [6,34,7];
    [13,1,2];
    [6,8,78];
    [64,52,8];
];

labelGuess = naiveBayesTest(dataTest, meanData, stdData, priorPros);
disp(labelGuess);
