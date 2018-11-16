function varargout = DZstats(varargin)
% DZSTATS MATLAB code for DZstats.fig
%      DZSTATS, by itself, creates a new DZSTATS or raises the existing
%      singleton*.
%
%      H = DZSTATS returns the handle to a new DZSTATS or the handle to
%      the existing singleton*.
%
%      DZSTATS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DZSTATS.M with the given input arguments.
%
%      DZSTATS('Property','Value',...) creates a new DZSTATS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DZstats_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DZstats_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DZstats

% Last Modified by GUIDE v2.5 02-Mar-2015 14:52:36

% Begin initialization code - DO NOT EDIT 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DZstats_OpeningFcn, ...
                   'gui_OutputFcn',  @DZstats_OutputFcn, ...
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

% set paths for writing spreadsheets
javaaddpath('poi_library/poi-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('poi_library/xmlbeans-2.3.0.jar');
javaaddpath('poi_library/dom4j-1.6.1.jar');
javaaddpath('poi_library/stax-api-1.0.1.jar');

% End initialization code - DO NOT EDIT

% --- Executes just before DZstats is made visible.
function DZstats_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DZstats (see VARARGIN)
imshow('uhlogo.jpg', 'Parent', handles.axes1);
% Choose default command line output for DZstats
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DZstats wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = DZstats_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton_check.
function pushbutton_check_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rad_on=get(handles.uipanel1,'selectedobject');
switch rad_on
    case handles.radiobutton1
        Two_Sample_Compare_PDP;
    case handles.radiobutton2
        Two_Sample_Compare_KDE;
    case handles.radiobutton3
        Two_Sample_Compare_LA_KDE;
    otherwise
        set(handles.edit_radioselect,'string','');
end

function edit_radioselect_Callback(hObject, eventdata, handles)
% hObject    handle to edit_radioselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_radioselect as text
%        str2double(get(hObject,'String')) returns contents of edit_radioselect as a double

% --- Executes during object creation, after setting all properties.
function edit_radioselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_radioselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rad_on=get(handles.uipanel1,'selectedobject');
switch rad_on
    case handles.radiobutton1
        Intersample_Compare_PDP;
    case handles.radiobutton2
        Intersample_Compare_KDE;
    case handles.radiobutton3
       Intersample_Compare_LA_KDE;
    otherwise
        set(handles.edit_radioselect,'string','');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rad_on=get(handles.uipanel1,'selectedobject');
switch rad_on
    case handles.radiobutton1
        Subsample_Compare_PDP;
    case handles.radiobutton2
       Subsample_Compare_KDE;
    case handles.radiobutton3
       Subsample_Compare_LA_KDE;
    otherwise
        set(handles.edit_radioselect,'string','');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
references;
