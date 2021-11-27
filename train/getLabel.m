function [outputData] = getLabel(inputData, labelCol)
%GETLABEL Ambil semua label yang ada di data
%   OutputData (array)  : Tempat label
%   InputData  (array)  : Data yang disaring
%   labelCol   (int)    : letak kolom label

outputData = inputData(:,labelCol);
outputData = unique(outputData);

end

