function varargout = HomeTraining(varargin)
% HOMETRAINING MATLAB code for HomeTraining.fig
%      HOMETRAINING, by itself, creates a new HOMETRAINING or raises the existing
%      singleton*.
%
%      H = HOMETRAINING returns the handle to a new HOMETRAINING or the handle to
%      the existing singleton*.
%
%      HOMETRAINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMETRAINING.M with the given input arguments.
%
%      HOMETRAINING('Property','Value',...) creates a new HOMETRAINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HomeTraining_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HomeTraining_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HomeTraining

% Last Modified by GUIDE v2.5 06-Dec-2021 23:11:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HomeTraining_OpeningFcn, ...
                   'gui_OutputFcn',  @HomeTraining_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before HomeTraining is made visible.
function HomeTraining_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HomeTraining (see VARARGIN)
% % Tampilan data untuk table-table
% Tampilkan jika file ada
if ~isfile('/model/confusionMatrix.csv')
    %baca file csv
    confusionMatrix = readmatrix('/model/confusionMatrix.csv');
    %tampilkan pada tabel
    set(handles.uitable4, 'data', confusionMatrix);
end

if ~isfile('/model/prior_pros.csv')
    priorProbabilities = readmatrix('/model/prior_pros.csv');
    set(handles.uitable3, 'data', priorProbabilities);
end

if ~isfile('/data/dataEkstraksi.csv')
    ekstraksiRGB = readmatrix('/data/dataEkstraksi.csv');
    set(handles.uitable1, 'data', ekstraksiRGB);
end

if ~isfile('/data/data_training/dataTrain.csv')
    dataTrain = readmatrix('/data/data_training/dataTrain.csv');
    %simpan data dalam array
    [row, col] = size(dataTrain);
    set(handles.edit3,'String',row)
end

if ~isfile('/data/data_test/dataTest.csv')
    dataTest = readmatrix('/data/data_test/dataTest.csv');
    [row, col] = size(dataTest);
    set(handles.edit4,'String',row)
end


% Choose default command line output for HomeTraining
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HomeTraining wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HomeTraining_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.(browse)
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

myFolder = uigetdir('D:\');%dapatkan folder dari ui
if ~isfolder(myFolder)%cek folder ada atau tidak
    %pesan error jika folder tidak ada
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));    %tampilkan pesan dialog
    myFolder = uigetdir();    % Ask for a new one 
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end

% Get a list of all files in the folder with the desired file name pattern.
filePattern1 = fullfile(myFolder, '*.jpeg'); 
filePattern2 = fullfile(myFolder, '*.jpg'); 
theFiles = [dir(filePattern1); dir(filePattern2)];

handles.theFiles = theFiles;
handles.theFiles2 = theFiles;
guidata(hObject,handles);
set(handles.edit1,'String',myFolder)%tampilkan nama folder
set(handles.pushbutton3,'Enable','on')%pushbutton3 aktif

function edit1_Callback(hObject, eventdata, handles)%(alamat)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Proses.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%dapatkan file yg dipilih
theFiles = handles.theFiles;
disp(length(theFiles));

% image preprocessing
%perulangan sebanyak file
for k = 1 : length(theFiles)
    %dapatkan nama file
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
    
    fileLabel = strsplit(fullFileName);    %pisah nama file
    labelExt = string(fileLabel(4)); % Convert cell to string
    labelExt = strsplit(labelExt, "."); % Pisah ekstensi
    label = lower(string(labelExt(1))); % Convert cell to string
    
    %pelabelan berdasarkan nama file
    if (label == 'matang')
        label = 1;
    elseif (label == 'sedang')
        label = 2;
    else
        label = 3;
    end
    
    imageArray = imread(fullFileName);    %baca gambar
    resz = resize1 (imageArray);    %resize dengan fungsi resize1
    rem = removeMan(resz);    %remove dengan fungsi removeMan
    ekstraksi1 = ekstraksiMan(double(rem));    %ekstrak warna 
    dataModel(k,:) = ([ekstraksi1,label]);%simpan hasil ekstrak dalam array
end
% % Tulis data
writematrix(dataModel, 'data/dataEkstraksi.csv');
data=readmatrix('data/dataEkstraksi.csv');

clc
% % Proses training
% Masih tidak dilakukan test dan menunggu label
kFold = str2double(get(handles.edit2,'String'));
labelCol = 4;
% % % Pilih data yang terbaik
[dataTest, dataTrain, OutConfusMatrix, bestAcc] = crossValidation(data, kFold, labelCol);
disp("===================================");
disp(OutConfusMatrix);
disp(bestAcc);
writematrix(OutConfusMatrix, 'model/confusionMatrix.csv');
writematrix(bestAcc, 'model/accuracy.csv');
% % % Simpan data
writematrix(dataTest, 'data/data_test/dataTest.csv');
writematrix(dataTrain, 'data/data_training/dataTrain.csv');
% % % Buat model
write = 1;
[priorPros, meanResult, stdResult] = naiveBayesTrain(dataTrain, labelCol, write);

% % Tampilkan data
set(handles.uitable1, 'data', data); % Data RGB
set(handles.uitable3, 'data', priorPros); % data prior probabilites
set(handles.uitable4, 'data', OutConfusMatrix); % data confusion matrix
axes(handles.axes1);                    % Grafik RGB
[rowDTrain, colDTrain] = size(dataTrain); % Ambil banyak data train
set(handles.edit3,'String',rowDTrain);  % Tampil jumlah data train di input
[rowDTest, colDTest] = size(dataTest); % Ambil banyak data test
set(handles.edit4,'String',rowDTest); % Tampil jumlah data test di input

cla('reset')
plot(data)
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])
table(handles.uitable1)
cla('reset')
set(handles.pushbutton3,'Enable','off') %button proses tidak aktif
set(handles.edit1,'String','D:/')

% --- Executes on button press in pushbutton5.(<<)
function pushbutton5_Callback(~, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%tombol untuk -1
val = str2double(get(handles.edit2,'String'))-1;
if val < 1
    val = 1; %value tidak bisa kurang dari 1
end
set(handles.edit2,'String',val)

% --- Executes on button press in pushbutton6.(>>)
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%tombol untuk +1
val = str2double(get(handles.edit2,'String'))+1;
if val > 10
    val = 10; %nilai tidak bisa lebih dari 10
end
set(handles.edit2,'String',val)


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.(input
% k-fold)
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.(data
% training)
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.(data
% testing)
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HomeApp

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HomeTesting

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HomeTraining

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HomeProfil