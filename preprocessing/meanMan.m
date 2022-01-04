function [mean] = meanMan(data, axis)
%MEANMAN Menghitung mean row matrix secara manual 
%   data (matrix)   : Matrix dimensi apapun

mean = [];
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
            sumRow = sumRow + dataRow(jj);
        end

        meanRow = sumRow / row;
        mean = [mean meanRow];
    end
else
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

