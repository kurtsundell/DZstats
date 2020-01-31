function varargout = Two_Sample_Compare_LA_KDE(varargin)
% TWO_SAMPLE_COMPARE_LA_KDE M-file for Two_Sample_Compare_LA_KDE.fig
%      TWO_SAMPLE_COMPARE_LA_KDE, by itself, creates a new TWO_SAMPLE_COMPARE_LA_KDE or raises the existing
%      singleton*.
%
%      H = TWO_SAMPLE_COMPARE_LA_KDE returns the handle to a new TWO_SAMPLE_COMPARE_LA_KDE or the handle to
%      the existing singleton*.
%
%      TWO_SAMPLE_COMPARE_LA_KDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TWO_SAMPLE_COMPARE_LA_KDE.M with the given input arguments.
%
%      TWO_SAMPLE_COMPARE_LA_KDE('Property','Value',...) creates a new TWO_SAMPLE_COMPARE_LA_KDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Two_Sample_Compare_LA_KDE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Two_Sample_Compare_LA_KDE_OpeningFcn via varargin.

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Two_Sample_Compare_LA_KDE_OpeningFcn, ...
                   'gui_OutputFcn',  @Two_Sample_Compare_LA_KDE_OutputFcn, ...
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

% --- Executes just before Two_Sample_Compare_LA_KDE is made visible.
function Two_Sample_Compare_LA_KDE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Two_Sample_Compare_LA_KDE (see VARARGIN)
% Choose default command line output for Two_Sample_Compare_LA_KDE
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Two_Sample_Compare_LA_KDE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --- Sample 1 --- %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% --- Browser button sample 1 --- %%%%%%%%%%
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*'},'File Selector'); %get file input data
fullpathname = strcat(pathname, filename); %file path name
text = fileread(fullpathname);  %read path name
set(handles.text15, 'String', fullpathname); %show path name
d1 = [fullpathname]; %temp matrix name
data1 = csvread(d1); %matrix of sample 1
handles.data1=data1; %update handles
guidata(hObject,handles); %update handles

%%%%%%%%%% --- x min input sample 1 --- %%%%%%%%%%
function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- x max input sample 1 --- %%%%%%%%%%
function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- x interval input sample 1 --- %%%%%%%%%%
function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- Plot button sample 1 --- %%%%%%%%%%
function plot1_Callback(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data1 = handles.data1(:,1); %input data sample 1
a = str2num(get(handles.a,'String')); %x min input
b = str2num(get(handles.b,'String')); %x max input
c = str2num(get(handles.c,'String')); %x interval input
xA = a:c:b; %x linespace
A = data1(:,1); %rename data
n = length(A); %number of data points
kdeA=ssvkernel(A, xA); %create kde matrix
normA = kdeA/sum(kdeA); %normalize matrix
cumsumA = cumsum(normA); %calculate cumulative sum
axes(handles.axes6); %plot kde handle
plot(xA,kdeA,'r','LineWidth',1.5); %plot kde
grid on %turn grid on
axis([a b 0 max(kdeA)]); %set axes 
title('Kernel Density Estimate') %set title
axes(handles.axes5); %cdf plot handle
cdfplot(A(:,1)) %cdf plot sample 1
hold on; %keep plot on
aa=cdfplot(A(:,1)); %cdf plot
hold off %remove plot
set(aa,'color','r','linewidth',1.5) %set color and line thicknesss
title('Cumulative Distribution') %set title
grid on; %turn on grid
axis([a b 0 1]); %set axis
xlabel(''); %set x label
ylabel(''); %set y label
handles.data1=data1; %update handles
handles.A = A; %update handles
handles.kdeA = kdeA; %update handles
handles.xA = xA; %update handles
handles.cumsumA = cumsumA; %update handles
guidata(hObject,handles); %update handles

%%%%%%%%%% --- clear plot button sample 1 --- %%%%%%%%%%
function clear_plot1_Callback(hObject, eventdata, handles)
% hObject    handle to clear_plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes6,'reset'); %clear KDE plot
cla(handles.axes5,'reset'); %clear CDF plot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --- Sample 2 --- %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% --- Browser button sample 2 --- %%%%%%%%%%
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*'},'File Selector'); %get file input data
fullpathname = strcat(pathname, filename); %read path name
text = fileread(fullpathname); %read path name
set(handles.text13, 'String', fullpathname); %show path name
d2 = [fullpathname]; %temp matrix name
data2 = csvread(d2); %matrix of sample 2
handles.data2=data2; %update handles
guidata(hObject,handles); %update handles

%%%%%%%%%% --- x min input sample 2 --- %%%%%%%%%%
function d_Callback(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- x max input sample 2 --- %%%%%%%%%%
function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- x interval input sample 2 --- %%%%%%%%%%
function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- Plot button sample 2 --- %%%%%%%%%%
function plot2_Callback(hObject, eventdata, handles)
% hObject    handle to plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data2 = handles.data2(:,1); %input data sample 2
d = str2num(get(handles.d,'String')); %x min input
e = str2num(get(handles.e,'String')); %x max input
f = str2num(get(handles.f,'String')); %x interval input
xB = d:f:e; %x linespace
B = data2(:,1); %rename data
n = length(B); %number of data points
kdeB=ssvkernel(B, xB); %calcuate kde matrix
normB = kdeB/sum(kdeB); %normalize matrix
cumsumB = cumsum(normB); %calculate cumulative sum
axes(handles.axes3); %plot kde handle
plot(xB,kdeB,'b','LineWidth',1.5); %plot kde
grid on %turn grid on
axis([d e 0 max(kdeB)]); %set axes 
title('Kernel Density Estimate') %set title
axes(handles.axes2); %cdf plot handle
cdfplot(B(:,1)) %cdf plot sample 2
hold on; %keep plot on
bb=cdfplot(B(:,1)); %cdf plot
hold off %remove plot
grid on;  %turn on grid
axis([d e 0 1]); %set axes
set(bb,'color','b','linewidth',1.5) %set color and line thicknesss
xlabel(''); %set x label
ylabel(''); %set y label
title('Cumulative Distribution') %set title
handles.data2=data2; %update handles
handles.B = B; %update handles
handles.kdeB = kdeB; %update handles
handles.xB = xB; %update handles
handles.cumsumB = cumsumB; %update handles
guidata(hObject,handles); %update handles

%%%%%%%%%% --- clear plot button sample 2 --- %%%%%%%%%%
function clear_plot2_Callback(hObject, eventdata, handles)
% hObject    handle to clear_plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes3,'reset'); %clear KDE plot
cla(handles.axes2,'reset'); %clear CDF plot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% --- calculate stastics --- %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% --- calculate stastics button --- %%%%%%%%%%
function stats2_Callback(hObject, eventdata, handles)
% hObject    handle to stats2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data1 = handles.data1; %input sample data 1
data2 = handles.data2; %input sample data 2
n1 = length(data1); %number of samples input 1
n2 = length(data2); %number of samples input 1
cumsumA = handles.cumsumA; %update handles
cumsumB = handles.cumsumB; %update handles
kdeA = handles.kdeA; %update handles
kdeA=kdeA(isfinite(kdeA(:, 1)), :); %make sure is number
kdeB = handles.kdeB; %update handles
kdeB=kdeB(isfinite(kdeB(:, 1)), :); %make sure is number
A = handles.A; %update handles
B = handles.B; %update handles
a = str2num(get(handles.a,'String')); %update handles
b = str2num(get(handles.b,'String')); %update handles

[h1,p1,k1] = kstest2(data1(:,1), data2(:,1)); %run and create matrix for ks test
p1 = sprintf('%.3f',p1); %print result in GUI
k1 = sprintf('%.3f',k1); %print result in GUI
set(handles.text19, 'String', p1);  %update handles
set(handles.text48, 'String', k1); %update handles

[p3,v] = kuipertest2c(data1(:,1),data2(:,1)); %run and create matrix for kuiper test
p3 = sprintf('%.3f',p3); %print result in GUI
v = sprintf('%.3f',v); %print result in GUI
set(handles.text30, 'String', p3);  %update handles
set(handles.text50, 'String', v); %update handles

R2 = r2(kdeA, kdeB); %run and create matrix for cross correlation test
R2 = sprintf('%.3f',R2); %print result in GUI
set(handles.text35, 'String', R2); %update handles

LikeAB=1-((sum(abs(kdeA-kdeB)))/2); %run and create matrix for likeness test
LikeAB = sprintf('%.3f',LikeAB); %print result in GUI
set(handles.text40, 'String', LikeAB); %update handles

Sim = sum(((kdeA.*kdeB).^0.5)); %run and create matrix for likeness test
Sim = sprintf('%.3f',Sim); %print result in GUI
set(handles.text45, 'String', Sim); %update handles

handles.p1=p1; %update handles
handles.k1=k1; %update handles
handles.p3=p3; %update handles
handles.v=v; %update handles
handles.R2=R2; %update handles
handles.LikeAB=LikeAB; %update handles
handles.Sim=Sim; %update handles
guidata(hObject,handles); %update handles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --- Overlay --- %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in overlay.
function overlay_Callback(hObject, eventdata, handles)
% hObject    handle to overlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data1 = handles.data1; %update handles
data2 = handles.data2; %update handles
kdeA = handles.kdeA; %update handles
kdeB = handles.kdeB; %update handles
xA = handles.xA; %update handles
xB = handles.xB; %update handles
A = handles.A; %update handles
B = handles.B; %update handles
a = str2num(get(handles.a,'String')); %update handles
b = str2num(get(handles.b,'String')); %update handles
d = str2num(get(handles.d,'String')); %update handles
e = str2num(get(handles.e,'String')); %update handles
axes(handles.axes15); %enable handle
plot(xA,kdeA,'r','LineWidth',1.5); %plot sample 1
hold on %keep plot on for overlay
grid on %turn grid on
plot(xB,kdeB,'b','LineWidth',1.5); %plot sample 2 on same graph
maxkdeA=max(kdeA); %define max to format and fit in plot
maxkdeB=max(kdeB); %define max to format and fit in plot
maxkdeAB=[maxkdeA,maxkdeB]; %define max to format and fit in plot
axis([min(a,d) max(b,e) 0 max(maxkdeAB(:))]); %set axes
title('Kernel Density Estimate') %set title
axes(handles.axes14); %enable handle
cdfplot(A(:,1)) %plot sample 1 CDF
hold on; %keep plot on for overlay
aa=cdfplot(A(:,1)); %plot sample 1
hold off %turn hold off
set(aa,'color','r','linewidth',1.5) %set color and line thickness
hold on %keep plot on for overlay
cdfplot(B(:,1)) %plot sample 2
hold on; %keep plot on for overlay
bb=cdfplot(B(:,1)); %plot sample 2
hold off %turn hold off
grid on; %turn grid on
axis([a b 0 1]); %set axes
set(bb,'color','b','linewidth',1.5)
title('Cumulative Distribution')
xlabel(''); %set x label
ylabel(''); %set y label

%%%%%%%%%% --- clear plot button overlay --- %%%%%%%%%%
function clearplots_Callback(hObject, eventdata, handles)
% hObject    handle to clearplots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes15,'reset'); %clear KDE plot
cla(handles.axes14,'reset'); %clear CDF plot

%%%%%%%%%% --- export table button --- %%%%%%%%%%
function export_table_Callback(hObject, eventdata, handles)
% hObject    handle to export_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p1 = handles.p1; %update handles
k1 = handles.k1; %update handles
p3 = handles.p3; %update handles
v = handles.v; %update handles
R2 = handles.R2; %update handles
LikeAB = handles.LikeAB; %update handles
Sim = handles.Sim; %update handles
%create matrix for results export
rowname = {'Cross correlation Coefficient', 'Likeness', 'Similarity', ...
    'K-S p value', 'K-S test k statistic', 'Kuiper Test p value', 'Kuiper Test v statistic'};
rowname = transpose(rowname);
dat = [rowname(1,1), R2; rowname(2,1), LikeAB; rowname(3,1), Sim; rowname(4,1), p1; rowname(5,1), k1; rowname(6,1), p3; rowname(7,1), v;];
[file,path] = uiputfile('*.xls','Save file');
xlwrite([path file], dat); %write Excel file

%%%%%%%%%% --- export graphs button --- %%%%%%%%%%
function export_graphs_Callback(hObject, eventdata, handles)
% hObject    handle to export_graphs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = figure; %create new figure
copyobj(handles.axes6,f); %copy plot to new figure to enable save
copyobj(handles.axes5,f); %copy plot to new figure to enable save
copyobj(handles.axes3,f); %copy plot to new figure to enable save
copyobj(handles.axes2,f); %copy plot to new figure to enable save
copyobj(handles.axes15,f); %copy plot to new figure to enable save
copyobj(handles.axes14,f); %copy plot to new figure to enable save
