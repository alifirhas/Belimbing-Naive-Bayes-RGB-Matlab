function [outputData] = labelString2Int(inputData, labelCol)
%LABELSTRING2INT Ubah label string ke label int
%   OutputData (array)  : Data dengan label int
%   InputData  (array)  : Data dengan label string
%   labelCol   (int)    : letak kolom label
% 
%   ! Sepertinya tidak dipakai, kemungkinan akan dihapus
% 

label = getLabel(inputData, labelCol);
newLabel = [];

for i = 1:length(label)
    newLabel = [newLabel i];
end

for i = 1:length(label)
    for r = 1:length(inputData)
        if inputData(r, 4) == label(i)
            inputData(r,4) = newLabel(i);
        end
    end
end

outputData = inputData;

end

