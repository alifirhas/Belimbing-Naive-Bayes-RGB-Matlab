function [sum] = sumMan(data, axis)
%SUMMAN Menghitung sum data secara manual
% % Parameter
% data [matrix] = data yang ingin dihitung jumlah total
% axis [int]    = memilih sum row atau col

sum = [];
[row, col] = size(data);

% Jika axis 0 makan sum col, jika tidak sum row
if ~exist('axis','var')
    axis = 0;
end

if axis == 0
    % Sum col
    for ii = 1:col
        dataRow = data(:,ii);
        dataRowSize = length(dataRow);
        sumRow = 0;

        for jj = 1:dataRowSize
            sumRow = sumRow + dataRow(jj);
        end
        
        sum = [sum sumRow];
    end
else
    % Sum row
    for ii = 1:row
        dataCol = data(ii,:);
        dataColSize = length(dataCol);
        sumCol = 0;

        for jj = 1:dataColSize
            sumCol = sumCol + dataCol(jj);
        end
        
        sum = [sum sumCol];
    end
end

end

