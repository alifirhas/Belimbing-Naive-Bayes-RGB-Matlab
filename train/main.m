% Directory path diambil dari root "/"
% Untuk menggunakan file difolder lain harus add path dulu
dataTrain = readmatrix('/data/dummy.csv');

labelCol = 4;

[priorPros, trainResults] = naiveBayesTrain(dataTrain, labelCol);
