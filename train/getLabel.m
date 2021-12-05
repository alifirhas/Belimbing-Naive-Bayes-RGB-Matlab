function [outputData] = getLabel(inputData, labelCol)
%GETLABEL Ambil semua label yang ada di data
% % Parameter
%   OutputData (matrix) : Tempat label
%   InputData  (matrix) : Data yang disaring
%   labelCol   (int)    : letak kolom label
% % Return
%   outputData (matrix)   : Label yang ada pada data

outputData = inputData(:,labelCol);
outputData = unique(outputData);

end

