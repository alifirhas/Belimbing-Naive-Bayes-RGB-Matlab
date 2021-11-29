function [std] = stdMan(data, meanData)
%STDMAN Menghitung std row matrix secara manual 
%   ! stdMan memerlukan mean dari semua row
%   Standar deviasi disini menggunakan quadran
%   data (matrix)       : Matrix dimensi apapun
%   meanData (matrix)   : Matrix mean dari data

std = [];
[row, col] = size(data);

for ii = 1:col
    dataRow = data(:,ii);
    dataRowSize = length(dataRow);
    sumRow = 0;
    
    for jj = 1:dataRowSize
        sumRow = sumRow + (dataRow(jj)-meanData(ii))^2;
    end
    
    meanRow = sumRow / row;
    std = [std meanRow];
end


end

