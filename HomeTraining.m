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
myFolder = uigetdir('D:\');
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.jpeg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);

handles.theFiles = theFiles;
handles.theFiles2 = theFiles;
guidata(hObject,handles);
set(handles.edit1,'String',myFolder)
set(handles.pushbutton3,'Enable','on')

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
theFiles = handles.theFiles;
% % Ekstraksi warna
% TODO: Ambil label (matang(1), sedang(2), mentah(3) dari nama file
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
    fileLabel = strsplit(fullFileName);
    labelExt = string(fileLabel(4)); % Convert cell to string
    labelExt = strsplit(labelExt, "."); % Pisah ekstensi
    label = lower(string(labelExt(1))); % Convert cell to string
    if (label == 'matang')
        label = 1;
    elseif (label == 'sedang')
        label = 2;
    else
        label = 3;
    end
    imageArray = imread(fullFileName);
    resz = resize1 (imageArray);
    rem = removeMan(resz);
    ekstraksi1 = ekstraksiMan (double(rem));
    dataModel(k,:) = ([ekstraksi1,label])
end
% % Tulis data
writematrix(dataModel, 'data/dataEkstraksi.csv');
data=readmatrix('data/dataEkstraksi.csv');

% % % Proses training
% % Masih tidak dilakukan test dan menunggu label
% kFold = str2double(get(handles.edit2,'String'));
% labelCol = 4;
% % % % Pilih data yang terbaik
% [dataTest, dataTrain] = crossValidation(data, kFold, labelCol);
% % % % Simpan data
% writematrix(dataTest, 'data/dataTest/dataTest.csv');
% writematrix(dataTrain, 'data/dataTrain/dataTrain.csv');
% % % % Buat model
% write = 1;
% [priorPros, meanResult, stdResult] = naiveBayesTrain(dataTrain, labelCol, write);

% % Tampilkan data
set(handles.uitable1, 'data', data);
axes(handles.axes1)
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
cla('reset')%gagal reset :v
set(handles.pushbutton3,'Enable','off')
set(handles.edit1,'String','D:/')

% --- Executes on button press in pushbutton5.(<<)
function pushbutton5_Callback(~, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.edit2,'String'))-1;
if val < 1
val = 1;
end
set(handles.edit2,'String',val)

% --- Executes on button press in pushbutton6.(>>)
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.edit2,'String'))+1;
if val > 10
val = 10;
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
