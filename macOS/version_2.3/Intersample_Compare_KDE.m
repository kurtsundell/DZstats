function varargout = Intersample_Compare_KDE(varargin)
% INTERSAMPLE_COMPARE_KDE M-file for Intersample_Compare_KDE.fig
%      INTERSAMPLE_COMPARE_KDE, by itself, creates a new INTERSAMPLE_COMPARE_KDE or raises the existing
%      singleton*.
%
%      H = INTERSAMPLE_COMPARE_KDE returns the handle to a new INTERSAMPLE_COMPARE_KDE or the handle to
%      the existing singleton*.
%
%      INTERSAMPLE_COMPARE_KDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERSAMPLE_COMPARE_KDE.M with the given input arguments.
%
%      INTERSAMPLE_COMPARE_KDE('Property','Value',...) creates a new INTERSAMPLE_COMPARE_KDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Intersample_Compare_KDE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Intersample_Compare_KDE_OpeningFcn via varargin.
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Intersample_Compare_KDE_OpeningFcn, ...
                   'gui_OutputFcn',  @Intersample_Compare_KDE_OutputFcn, ...
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

% --- Executes just before Intersample_Compare_KDE is made visible.
function Intersample_Compare_KDE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Intersample_Compare_KDE (see VARARGIN)
% Choose default command line output for Intersample_Compare_KDE
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Intersample_Compare_KDE_OutputFcn(hObject, eventdata, handles) 
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
%%%%%%%%%%%%%%%%%%%%%%%%%%% --- Input --- %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% --- Browser button --- %%%%%%%%%%
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*'},'File Selector');
fullpathname = strcat(pathname, filename);
text = fileread(fullpathname);
set(handles.text15, 'String', fullpathname); %show path name
d1 = [fullpathname];
data = csvread(d1);
[dataR,dataC]=size(data);
nsamples=dataC/2;
nsamp = num2str(nsamples);
set(handles.text65,'String',nsamp);
handles.data=data;
handles.nsamples=nsamples;
guidata(hObject,handles);

%%%%%%%%%% --- x min input --- %%%%%%%%%%
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

%%%%%%%%%% --- x max input --- %%%%%%%%%%
function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- x interval input --- %%%%%%%%%%
function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- Plot button --- %%%%%%%%%%
function plot1_Callback(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = handles.data;
nsamples = handles.nsamples;
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
c = str2num(get(handles.c,'String'));
x = a:c:b;
x = transpose(x);
tin=linspace(1,length(x),length(x));
pdp_out = zeros(length(x),nsamples+1);
pdp_cdf_out = zeros(length(x),nsamples+1);
bandwidth_out=ceil(transpose(1:1:nsamples));
for i = 1:nsamples;
mi = data(:,i*2-1);
mi = mi(isfinite(mi(:,1)),:);
mi(mi==0) = [];
[bandwidthi,kdeAi,xmesh1i,cdfi]=kde(mi,length(tin),a,b);
pdpi=transpose(interp1(xmesh1i, kdeAi, tin));
bandwidth_out(i,2) = bandwidthi;
pdp_out(:,i+1) = pdpi;
pdp_out(:,1) = x;
pdp_cdfi = transpose(pdpi);
pdp_normi = pdp_cdfi/sum(pdp_cdfi);
cumsumi = cumsum(pdp_normi);
pdp_cdf_out(:,i+1) = (cumsumi);
pdp_cdf_out(:,1) = x;
end
F = max(pdp_out(:,2:nsamples+1));
F=max(F);
for i = 1:nsamples;
axes(handles.axes21);
colours = colormap(jet((nsamples)));
colorbar;
hCbar = colorbar;
set(hCbar, 'Ticks',(1/(nsamples*2)):(1/(nsamples)):1-(1/(nsamples*2)))
hCbarLabels = {1:1:nsamples};
set(hCbar, 'TickLabels', hCbarLabels);
plot(pdp_out(:,1),pdp_out(:,i+1),'color',colours((i),:),'linewidth',1.5);
hold on
axis([a b 0 F])
grid on
title('Kernel Density Estimate')
end
for i = 1:nsamples;
axes(handles.axes20);
datai = data(:,i*2-1);
datai =datai(isfinite(datai(:,1)),:);
datai(datai==0) = [];
colours = colormap(jet((nsamples)));
cdf(i) = cdfplot(datai);
set(cdf(i),'color',colours((i),:),'linewidth',1.5);
hold on;
grid on;
axis([a b 0 1])
title('Cumulative Distribution Function');
xlabel('');
ylabel('');
end
bandwidth_out1 = num2str(bandwidth_out);
set(handles.listbox1,'String',bandwidth_out1);
handles.pdp_out=pdp_out;
handles.pdp_cdf_out=pdp_cdf_out;
handles.bandwidth_out=bandwidth_out;
handles.nsamples=nsamples;
guidata(hObject,handles);

%%%%%%%%%% --- Clear Plots button --- %%%%%%%%%%
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes21,'reset');
cla(handles.axes20,'reset');
set(handles.listbox1, 'String', '');

%%%%%%%%%% --- Cross-correlation button --- %%%%%%%%%%
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pdp_out=handles.pdp_out;
nsamples = handles.nsamples;
for (r=1:nsamples);
for (i=1:nsamples);
[R2(i,r)] = r2(pdp_out(:,r+1),pdp_out(:,i+1));
end
end
f = figure('Name', 'R-squared crossplot value', 'Position', [100 100 450 250]);
dat = [R2];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- Likeness button --- %%%%%%%%%%
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pdp_out=handles.pdp_out;
nsamples = handles.nsamples;
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
agemin = a;
agemax = b;
for (r=1:nsamples);
for (i=1:nsamples);
pdpr = pdp_out(:,r+1);
pdpi = pdp_out(:,i+1);
[LikeAB(i,r)]= 1-((sum(abs(pdpr-pdpi)))/2);    
end
end
f = figure('Name', 'Likeness value', 'Position', [100 100 450 250]);
dat = [LikeAB];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- Similarity button --- %%%%%%%%%%
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pdp_out=handles.pdp_out;
nsamples = handles.nsamples;
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
for (r=1:nsamples);
for (i=1:nsamples); 
[Sim(r,i)] = sum(((pdp_out(:,r+1).*pdp_out(:,i+1)).^0.5));
end
end
f = figure('Name', 'Similarity value', 'Position', [100 100 450 250]);
dat = [Sim];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- K-S test button --- %%%%%%%%%%
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = handles.data;
nsamples = handles.nsamples;
for (r=1:nsamples);
for (i=1:nsamples);
[hks(i,r),pks(i,r),kks(i,r)] = kstest2(nonzeros(data(:,r*2-1)),nonzeros(data(:,i*2-1)));
end
end
f = figure('Name', 'K-S Test p-value not including uncertainty', 'Position', [100 100 450 250]);
dat = [pks];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);
f = figure('Name', 'K-S Test k-statistic not including uncertainty', 'Position', [100 100 450 250]);
dat = [kks];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- Kuiper test button --- %%%%%%%%%%
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = handles.data;
nsamples = handles.nsamples;
for (r=1:nsamples);
for (i=1:nsamples);
[pku(i,r),vku(i,r)] = kuipertest2c(nonzeros(data(:,r*2-1)),nonzeros(data(:,i*2-1)));
end
end
f = figure('Name', 'Kuiper Test p-value not including uncertainty', 'Position', [100 100 450 250]);
dat = [pku];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);
f = figure('Name', 'Kuiper Test v-statistic not including uncertainty', 'Position', [100 100 450 250]);
dat = [vku];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- Export KDEs to spreadsheet button --- %%%%%%%%%%
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pdp_out=handles.pdp_out;
[file,path] = uiputfile('*.xls','Save file');
xlwrite([path file], pdp_out);

%%%%%%%%%% --- Export KDE sample bandwidths to spreadsheet button --- %%%%%%%%%%
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bandwidth_out=handles.bandwidth_out;
[file,path] = uiputfile('*.xls','Save file');
xlwrite([path file], bandwidth_out);

%%%%%%%%%% --- Export graphs button --- %%%%%%%%%%
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = figure;
copyobj(handles.axes21,f);
copyobj(handles.axes20,f);

%%%%%%%%%% --- Run all tests and export spreadsheet button --- %%%%%%%%%%
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = handles.data;
pdp_out=handles.pdp_out;
pdp_cdf_out=handles.pdp_cdf_out;
nsamples = handles.nsamples;
for (r=1:nsamples);
for (i=1:nsamples);
[hks(i,r),pks(i,r),kks(i,r)] = kstest2(nonzeros(data(:,r*2-1)),nonzeros(data(:,i*2-1)));
end
end
for i = 1:nsamples;
li = data(:,i*2-1);
l(i) = length(li(isfinite(li(:,1)),:));
end
for (r=1:nsamples);
for (i=1:nsamples);
[pku(i,r),vku(i,r)] = kuipertest2c(nonzeros(data(:,r*2-1)),nonzeros(data(:,i*2-1)));
end
end
for (r=1:nsamples);
for (i=1:nsamples);
[R2(i,r)] = r2(pdp_out(:,r+1),pdp_out(:,i+1));
end
end
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
agemin = a;
agemax = b;
for (r=1:nsamples);
for (i=1:nsamples);
pdpr = pdp_out(:,r+1);
pdpi = pdp_out(:,i+1);
[LikeAB(i,r)]= 1-((sum(abs(pdpr-pdpi)))/2);
end
end
for (r=1:nsamples);
for (i=1:nsamples); 
[Sim(r,i)] = sum(((pdp_out(:,r+1).*pdp_out(:,i+1)).^0.5));
end
end
header1=cell(1,nsamples);
name1 = {'Cross Correlation Coefficient'};
header1(1,1) = name1;
R2_cell = num2cell(R2);
header2=cell(2,nsamples);
name2 = {'Likeness value'};
header2(2,1) = name2;
LikeAB_cell = num2cell(LikeAB);
header3=cell(2,nsamples);
name3 = {'Similarity value'};
header3(2,1) = name3;
Sim_cell = num2cell(Sim);
header4=cell(2,nsamples);
name4 = {'K-S test p value'};
header4(2,1) = name4;
pks_cell = num2cell(pks);
header5=cell(2,nsamples);
name5 = {'K-S test D statistic'};
header5(2,1) = name5;
kks_cell = num2cell(kks);
header6=cell(2,nsamples);
name6 = {'Kuiper test p value'};
header6(2,1) = name6;
pku_cell = num2cell(pku);
header7=cell(2,nsamples);
name7 = {'Kuiper test V statistic'};
header7(2,1) = name7;
kku_cell = num2cell(vku);
all_cell = [header1;R2_cell;;header2;LikeAB_cell;header3;Sim_cell;header4;pks_cell;header5;kks_cell;header6;pku_cell;header7;kku_cell];
[file,path] = uiputfile('*.xls','Save file');
xlwrite([path file], all_cell);

%%%%%%%%%% --- Bandwidth Results --- %%%%%%%%%%
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
