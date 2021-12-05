function [mean] = meanMan(data, axis)
%MEANMAN Menghitung mean row matrix secara manual 
% % Parameter
%   data (matrix)   : Matrix dimensi apapun
%   axis (enum(0,1) : Pilih hitung mean col atau row
%
% Return
%   mean (matrix) : mean dari col/row sesuai dengan pilihan

mean = [];                  % Tempat meyimpan hasil akhir
[row, col] = size(data);    % Ambil size matrix

% Hitung mean col jika axis = 0, row jika axis = 1;
if ~exist('axis','var')
    axis = 0; % Default value dari axis
end

if axis == 0
    % Hitung mean di col
    for ii = 1:col
        dataRow = data(:,ii);
        dataRowSize = length(dataRow);
        sumRow = 0;

        for jj = 1:dataRowSize
            sumRow = sumRow + dataRow(jj);
        end

        meanRow = sumRow / row;
        mean = [mean meanRow];
    end
else
    % Hitung mean di row
    for ii = 1:row
        dataCol = data(ii,:);
        dataColSize = length(dataCol);
        sumCol = 0;

        for jj = 1:dataColSize
            sumCol = sumCol + dataCol(jj);
        end

        meanCol = sumCol / col;
        mean = [mean meanCol];
    end
end

    
    
end

