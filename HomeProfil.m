function varargout = HomeProfil(varargin)
% HOMEPROFIL MATLAB code for HomeProfil.fig
%      HOMEPROFIL, by itself, creates a new HOMEPROFIL or raises the existing
%      singleton*.
%
%      H = HOMEPROFIL returns the handle to a new HOMEPROFIL or the handle to
%      the existing singleton*.
%
%      HOMEPROFIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEPROFIL.M with the given input arguments.
%
%      HOMEPROFIL('Property','Value',...) creates a new HOMEPROFIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HomeProfil_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HomeProfil_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HomeProfil

% Last Modified by GUIDE v2.5 20-Dec-2021 21:32:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HomeProfil_OpeningFcn, ...
                   'gui_OutputFcn',  @HomeProfil_OutputFcn, ...
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


% --- Executes just before HomeProfil is made visible.
function HomeProfil_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HomeProfil (see VARARGIN)

% Choose default command line output for HomeProfil
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HomeProfil wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HomeProfil_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% kalo punya tolong isi
% gambar logo polije
% axes(handles.axes1)
% cover = imread('cover.jpeg');
% imshow (cover);

% gambar logo jti
% axes(handles.axes2)
% cover = imread('cover.jpeg');
% imshow (cover);


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
Homeprofil
