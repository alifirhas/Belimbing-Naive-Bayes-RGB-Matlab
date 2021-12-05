function [sum] = sumMan(data, axis)
%SUMMAN Menghitung sum data secara manual
% % Parameter
%   data [matrix] = data yang ingin dihitung jumlah total
%   axis (enum(0,1) : Pilih hitung mean col atau row
% 
% % Return
%   sum (matrix) : sum dari col/row sesuai dengan pilihan

sum = [];                  % Tempat meyimpan hasil akhir
[row, col] = size(data);    % Ambil size matrix

% Hitung sum col jika axis = 0, row jika axis = 1;
if ~exist('axis','var')
    axis = 0; % Default value dari axis
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

