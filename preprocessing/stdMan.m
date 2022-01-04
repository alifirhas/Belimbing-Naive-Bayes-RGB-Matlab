function [std] = stdMan(data, meanData, axis)
%STDMAN Menghitung std row matrix secara manual 
%   ! stdMan memerlukan mean dari semua row
%   Standar deviasi disini menggunakan quadran
%   data (matrix)       : Matrix dimensi apapun
%   meanData (matrix)   : Matrix mean dari data

std = [];
[row, col] = size(data);

if ~exist('axis','var')
    axis = 0;
end

if axis == 0
    for ii = 1:col
        dataRow = data(:,ii);
        dataRowSize = length(dataRow);
        sumRow = 0;

        for jj = 1:dataRowSize
            sumRow = sumRow + (dataRow(jj)-meanData(ii))^2;
        end
        disp(sumRow);
        meanRow = sumRow / (row-1);
        std = [std meanRow];
    end
else
    for ii = 1:row
        dataCol = data(ii,:);
        dataColSize = length(dataCol);
        sumCol = 0;

        for jj = 1:dataColSize
            sumCol = sumCol + (dataCol(jj)-meanData(ii))^2;
        end
        disp(sumCol);
        meanCol = sumCol / (col-1);
        std = [std meanCol];
    end    
end
end

