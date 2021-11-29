function [mean] = meanMan(data)
%MEANMAN Menghitung mean row matrix secara manual 
%   data (matrix)   : Matrix dimensi apapun

mean = [];
[row, col] = size(data);

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
    
end

