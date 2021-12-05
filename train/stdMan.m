function [std] = stdMan(data, meanData, axis)
%STDMAN Menghitung std row matrix secara manual 
%   ! stdMan memerlukan mean dari semua row
%   Standar deviasi disini menggunakan quadran
% % Parameter
%   data (matrix)       : Matrix dimensi apapun
%   meanData (matrix)   : Matrix mean dari data
%   axis (enum(0,1) : Pilih hitung mean col atau row
% 
% Return
%   std (matrix) : std dari col/row sesuai dengan pilihan

std = [];                   % Tempat meyimpan hasil akhir
[row, col] = size(data);    % Ambil size matrix

% Hitung std col jika axis = 0, row jika axis = 1;
if ~exist('axis','var')
    axis = 0; % Default value dari axis
end

if axis == 0
    % Hitung std di col
    for ii = 1:col
        dataRow = data(:,ii);
        dataRowSize = length(dataRow);
        sumRow = 0;

        for jj = 1:dataRowSize
            sumRow = sumRow + (dataRow(jj)-meanData(ii))^2;
        end
        meanRow = sqrt(sumRow / (row-1));
        std = [std meanRow];
    end
else
    % Hitung std di row
    for ii = 1:row
        dataCol = data(ii,:);
        dataColSize = length(dataCol);
        sumCol = 0;

        for jj = 1:dataColSize
            sumCol = sumCol + (dataCol(jj)-meanData(ii))^2;
        end
        meanCol = sqrt(sumCol / (col-1));
        std = [std meanCol];
    end    
end


