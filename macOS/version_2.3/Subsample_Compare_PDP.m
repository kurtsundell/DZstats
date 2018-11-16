function varargout = Subsample_Compare_PDP(varargin)
% SUBSAMPLE_COMPARE_PDP M-file for Subsample_Compare_PDP.fig
%      SUBSAMPLE_COMPARE_PDP, by itself, creates a new SUBSAMPLE_COMPARE_PDP or raises the existing
%      singleton*.
%
%      H = SUBSAMPLE_COMPARE_PDP returns the handle to a new SUBSAMPLE_COMPARE_PDP or the handle to
%      the existing singleton*.
%
%      SUBSAMPLE_COMPARE_PDP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBSAMPLE_COMPARE_PDP.M with the given input arguments.
%
%      SUBSAMPLE_COMPARE_PDP('Property','Value',...) creates a new SUBSAMPLE_COMPARE_PDP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Subsample_Compare_PDP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Subsample_Compare_PDP_OpeningFcn via varargin.
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Subsample_Compare_PDP_OpeningFcn, ...
                   'gui_OutputFcn',  @Subsample_Compare_PDP_OutputFcn, ...
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

% --- Executes just before Subsample_Compare_PDP is made visible.
function Subsample_Compare_PDP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Subsample_Compare_PDP (see VARARGIN)
% Choose default command line output for Subsample_Compare_PDP
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Subsample_Compare_PDP_OutputFcn(hObject, eventdata, handles) 
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

%%%%%%%%%% --- n random subsamples --- %%%%%%%%%%
function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- t number of trials --- %%%%%%%%%%
function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%% --- Plot button --- %%%%%%%%%%
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=handles.data;
nsamples = handles.nsamples;
ttrials = str2num(get(handles.edit19,'String'));
nsubsamples = str2num(get(handles.edit18,'String'));
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
c = str2num(get(handles.c,'String'));
x = a:c:b;
x = transpose(x);
rand_out = zeros(nsubsamples,nsamples*2);
for j = (1:ttrials);
for i = (1:nsamples);
datai = data(:,(i*2-1):(i*2));
datai = datai(isfinite(datai(:,1)),:);
trimi = find(datai(:,1),1,'last');
maxi = max(trimi);
trimi = data(1:maxi,(i*2-1):(i*2));
randsubsampi = randsamp(trimi,nsubsamples);
rand_out(:,(i*2-1:i*2),j) = (randsubsampi);
end
end
rand_pdp_out = zeros(length(x),nsamples,ttrials);
rand_pdp_cdf_out = zeros(length(x),nsamples,ttrials);
for j = (1:ttrials);
for i = (1:nsamples);
rand_pdp_out(:,i,j) = pdp5(rand_out(:,i*2-1,j), rand_out(:,i*2,j), a, b, c);
end
end
for j = (1:ttrials);
for i = (1:nsamples);
rand_pdp_norm(:,i,j) = rand_pdp_out(:,i,j)/sum(rand_pdp_out(:,i,j));
rand_pdp_cdf_out(:,i,j) = cumsum(rand_pdp_norm(:,i,j));
end
end
for i = 1:nsamples;
axes(handles.axes21);
colours = colormap(jet((nsamples)));
colorbar;
hCbar = colorbar;
set(hCbar, 'Ticks',(1/(nsamples*2)):(1/(nsamples)):1-(1/(nsamples*2)))
hCbarLabels = {1:1:nsamples};
set(hCbar, 'TickLabels', hCbarLabels);
plot(x,rand_pdp_out(:,i,1),'color',colours((i),:),'linewidth',1.5);
hold on
grid on
title('Probability Density Plot')
end
for i = 1:nsamples;
axes(handles.axes20);
datai = rand_out(:,i*2-1);
datai =datai(isfinite(datai(:,1)),:);
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
handles.rand_pdp_out=rand_pdp_out;
handles.rand_pdp_cdf_out=rand_pdp_cdf_out;
handles.rand_out=rand_out;
guidata(hObject,handles);

%%%%%%%%%% --- Clear Plots button --- %%%%%%%%%%
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes21,'reset');
cla(handles.axes20,'reset');

%%%%%%%%%% --- Cross-correlation button --- %%%%%%%%%%
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rand_pdp_out=handles.rand_pdp_out;
nsamples = handles.nsamples;
nsubsamples = str2num(get(handles.edit18,'String'));
ttrials = str2num(get(handles.edit19,'String'));
for (r=1:nsamples);
for (c=1:nsamples);
for (p=1:ttrials);
[R2(r,c,p)] = r2(rand_pdp_out(:,r,p),rand_pdp_out(:,c,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_R2(r,c)] = mean(R2(r,c,:));
[std_R2(r,c)] = std(R2(r,c,:));
end
end
header1=cell(1,nsamples);
name1 = {'n'};
header1(1,1) = name1;
header1a=cell(1,nsamples);
name1a = {nsubsamples};
header1a(1,1) = name1a;
header1b=cell(1,nsamples);
name1b = {'trials'};
header1b(1,1) = name1b;
header1c=cell(1,nsamples);
name1c = {ttrials};
header1c(1,1) = name1c;
header2=cell(2,nsamples);
name2 = {'Mean Cross Correlation Coefficient'};
header2(2,1) = name2;
mean_R2_cell = num2cell(mean_R2);
header3=cell(2,nsamples);
name3 = {'Standard deviation Cross Correlation Coefficient'};
header3(2,1) = name3;
std_R2_cell = num2cell(std_R2);
f = figure('Name', 'Mean and standard deviation of Cross Correlation Coefficient', 'Position', [100 100 450 250]);
dat = [header1;header1a;header1b;header1c;header2;mean_R2_cell;header3;std_R2_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- Likeness button --- %%%%%%%%%%
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rand_pdp_out=handles.rand_pdp_out;
nsamples = handles.nsamples;
nsubsamples = str2num(get(handles.edit18,'String'));
ttrials = str2num(get(handles.edit19,'String'));
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
for r = (1:nsamples);
for c = (1:nsamples);
for p = (1:ttrials);
[like_out(r,c,p)] = like(rand_pdp_out(:,r,p), rand_pdp_out(:,c,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_like_out(r,c)] = mean(like_out(r,c,:));
[std_like_out(r,c)] = std(like_out(r,c,:));
end
end
header1=cell(1,nsamples);
name1 = {'n'};
header1(1,1) = name1;
header1a=cell(1,nsamples);
name1a = {nsubsamples};
header1a(1,1) = name1a;
header1b=cell(1,nsamples);
name1b = {'trials'};
header1b(1,1) = name1b;
header1c=cell(1,nsamples);
name1c = {ttrials};
header1c(1,1) = name1c;
header2=cell(2,nsamples);
name2 = {'Mean Likeness value'};
header2(2,1) = name2;
mean_like_cell = num2cell(mean_like_out);
header3=cell(2,nsamples);
name3 = {'Standard deviation Likeness value'};
header3(2,1) = name3;
std_like_cell = num2cell(std_like_out);
f = figure('Name', 'Mean and standard deviation of Likeness values', 'Position', [100 100 450 250]);
dat = [header1;header1a;header1b;header1c;header2;mean_like_cell;header3;std_like_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- Similarity button --- %%%%%%%%%%
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rand_pdp_out=handles.rand_pdp_out;
nsamples = handles.nsamples;
nsubsamples = str2num(get(handles.edit18,'String'));
ttrials = str2num(get(handles.edit19,'String'));
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
for r = (1:nsamples);
for c = (1:nsamples);
for p = (1:ttrials);
[Sim(r,c,p)] = similarity(rand_pdp_out(:,r,p), rand_pdp_out(:,c,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_Sim(r,c)] = mean(Sim(r,c,:));
[std_Sim(r,c)] = std(Sim(r,c,:));
end
end
header1=cell(1,nsamples);
name1 = {'n'};
header1(1,1) = name1;
header1a=cell(1,nsamples);
name1a = {nsubsamples};
header1a(1,1) = name1a;
header1b=cell(1,nsamples);
name1b = {'trials'};
header1b(1,1) = name1b;
header1c=cell(1,nsamples);
name1c = {ttrials};
header1c(1,1) = name1c;
header2=cell(2,nsamples);
name2 = {'Mean Similarity value'};
header2(2,1) = name2;
mean_Sim_cell = num2cell(mean_Sim);
header3=cell(2,nsamples);
name3 = {'Standard deviation Similarity value'};
header3(2,1) = name3;
std_Sim_cell = num2cell(std_Sim);
f = figure('Name', 'Mean and standard deviation of Similarity values', 'Position', [100 100 450 250]);
dat = [header1;header1a;header1b;header1c;header2;mean_Sim_cell;header3;std_Sim_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);

%%%%%%%%%% --- K-S test button --- %%%%%%%%%%
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nsamples = handles.nsamples;
ttrials = str2num(get(handles.edit19,'String'));
nsubsamples = str2num(get(handles.edit18,'String'));
rand_out = handles.rand_out;
for (r=1:nsamples);
for (c=1:nsamples);
for (p=1:ttrials);
[hks(r,c,p),pks(r,c,p),kks(r,c,p)] = kstest2(rand_out(:,r*2-1,p),rand_out(:,c*2-1,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_pks(r,c)] = mean(pks(r,c,:));
[std_pks(r,c)] = std(pks(r,c,:));
[mean_kks(r,c)] = mean(kks(r,c,:));
[std_kks(r,c)] = std(kks(r,c,:));
end
end
header1=cell(1,nsamples);
name1 = {'n'};
header1(1,1) = name1;
header1a=cell(1,nsamples);
name1a = {nsubsamples};
header1a(1,1) = name1a;
header1b=cell(1,nsamples);
name1b = {'trials'};
header1b(1,1) = name1b;
header1c=cell(1,nsamples);
name1c = {ttrials};
header1c(1,1) = name1c;
header2=cell(2,nsamples);
name2 = {'Mean K-S test p value'};
header2(2,1) = name2;
mean_pks_cell = num2cell(mean_pks);
header3=cell(2,nsamples);
name3 = {'Standard deviation of K-S test p values'};
header3(2,1) = name3;
std_pks_cell = num2cell(std_pks);
header5=cell(2,nsamples);
name5 = {'Mean K-S test D statistic'};
header5(2,1) = name5;
mean_kks_cell = num2cell(mean_kks);
header6=cell(2,nsamples);
name6 = {'Standard deviation of K-S test D statistic'};
header6(2,1) = name6;
std_kks_cell = num2cell(std_kks);
f = figure('Name', 'Mean and standard deviation of K-S Test p values', 'Position', [100 100 450 250]);
dat = [header1;header1a;header1b;header1c;header2;mean_pks_cell;header3;std_pks_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);
f = figure('Name','Mean and standard deviation of K-S Test D statistic', 'Position', [100 100 450 250]);
dat2 = [header1;header1a;header1b;header1c;header5;mean_kks_cell;header6;std_kks_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat2);

%%%%%%%%%% --- Kuiper test button --- %%%%%%%%%%
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nsamples = handles.nsamples;
ttrials = str2num(get(handles.edit19,'String'));
nsubsamples = str2num(get(handles.edit18,'String'));
rand_out = handles.rand_out;
for (r=1:nsamples);
for (c=1:nsamples);
for (p=1:ttrials);
[pku(r,c,p),vku(r,c,p)] = kuipertest2c(rand_out(:,r*2-1,p),rand_out(:,c*2-1,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_pku(r,c)] = mean(pku(r,c,:));
[std_pku(r,c)] = std(pku(r,c,:));
[mean_vku(r,c)] = mean(vku(r,c,:));
[std_vku(r,c)] = std(vku(r,c,:));
end
end
header1=cell(1,nsamples);
name1 = {'n'};
header1(1,1) = name1;
header1a=cell(1,nsamples);
name1a = {nsubsamples};
header1a(1,1) = name1a;
header1b=cell(1,nsamples);
name1b = {'trials'};
header1b(1,1) = name1b;
header1c=cell(1,nsamples);
name1c = {ttrials};
header1c(1,1) = name1c;
header2=cell(2,nsamples);
name2 = {'Mean Kuiper test p values'};
header2(2,1) = name2;
mean_pku_cell = num2cell(mean_pku);
header3=cell(2,nsamples);
name3 = {'Standard deviation of Kuiper test p values'};
header3(2,1) = name3;
std_pku_cell = num2cell(std_pku);
header4=cell(1,nsamples);
name4 = {'Trials = ', ttrials, 'n = ', nsubsamples};
header4(1,1:4) = name4;
header5=cell(2,nsamples);
name5 = {'Mean Kuiper test V statistic values'};
header5(2,1) = name5;
mean_vku_cell = num2cell(mean_vku);
header6=cell(2,nsamples);
name6 = {'Standard deviation of Kuiper test V statistic values'};
header6(2,1) = name6;
std_vku_cell = num2cell(std_vku);
f = figure('Name', 'Mean and standard deviation of Kuiper Test p values', 'Position', [100 100 450 250]);
dat = [header1;header1a;header1b;header1c;header2;mean_pku_cell;header3;std_pku_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat);
f = figure('Name', 'Mean and standard deviation of Kuiper Test V statistic values', 'Position', [100 100 450 250]);
dat2 = [header1;header1a;header1b;header1c;header5;mean_vku_cell;header6;std_vku_cell];
t = uitable('Units', 'normalized', 'Position', [.1, .1, 1.9, .9], 'Data', dat2);

%%%%%%%%%% --- Run all tests and export spreadsheet button --- %%%%%%%%%%
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nsamples = handles.nsamples;
ttrials = str2num(get(handles.edit19,'String'));
nsubsamples = str2num(get(handles.edit18,'String'));
rand_out = handles.rand_out;
rand_pdp_cdf_out=handles.rand_pdp_cdf_out;
rand_pdp_out=handles.rand_pdp_out;
for (r=1:nsamples);
for (c=1:nsamples);
for (p=1:ttrials);
[hks(r,c,p),pks(r,c,p),kks(r,c,p)] = kstest2(rand_out(:,r*2-1,p),rand_out(:,c*2-1,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_pks(r,c)] = mean(pks(r,c,:));
[std_pks(r,c)] = std(pks(r,c,:));
[mean_kks(r,c)] = mean(kks(r,c,:));
[std_kks(r,c)] = std(kks(r,c,:));
[min_pks(r,c)] = min(pks(r,c,:));
[max_pks(r,c)] = max(pks(r,c,:));
[min_kks(r,c)] = min(kks(r,c,:));
[max_kks(r,c)] = max(kks(r,c,:));
end
end
header1=cell(1,nsamples);
name1 = {'n'};
header1(1,1) = name1;
header1a=cell(1,nsamples);
name1a = {nsubsamples};
header1a(1,1) = name1a;
header1b=cell(1,nsamples);
name1b = {'trials'};
header1b(1,1) = name1b;
header1c=cell(1,nsamples);
name1c = {ttrials};
header1c(1,1) = name1c;
header2=cell(2,nsamples);
name2 = {'Mean K-S test p values'};
header2(2,1) = name2;
mean_pks_cell = num2cell(mean_pks);
header3=cell(2,nsamples);
name3 = {'Standard deviation of K-S test p values'};
header3(2,1) = name3;
std_pks_cell = num2cell(std_pks);
header5=cell(2,nsamples);
name5 = {'Mean K-S test D statistic values'};
header5(2,1) = name5;
mean_kks_cell = num2cell(mean_kks);
header6=cell(2,nsamples);
name6 = {'Standard deviation of K-S test D statistic'};
header6(2,1) = name6;
std_kks_cell = num2cell(std_kks);
headerA=cell(2,nsamples);
nameA = {'Minimum of K-S test p values'};
headerA(2,1) = nameA;
min_pks_cell = num2cell(min_pks);
headerB=cell(2,nsamples);
nameB = {'Maximum of K-S test p values'};
headerB(2,1) = nameB;
max_pks_cell = num2cell(max_pks);
headerC=cell(2,nsamples);
nameC = {'Minimum of K-S test D statistic'};
headerC(2,1) = nameC;
min_kks_cell = num2cell(min_kks);
headerD=cell(2,nsamples);
nameD = {'Maximum of K-S test D statistic'};
headerD(2,1) = nameD;
max_kks_cell = num2cell(max_kks);
for (r=1:nsamples);
for (c=1:nsamples);
for (p=1:ttrials);
[pku(r,c,p),vku(r,c,p)] = kuipertest2c(rand_out(:,r*2-1,p),rand_out(:,c*2-1,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_pku(r,c)] = mean(pku(r,c,:));
[std_pku(r,c)] = std(pku(r,c,:));
[mean_vku(r,c)] = mean(vku(r,c,:));
[std_vku(r,c)] = std(vku(r,c,:));
[min_pku(r,c)] = min(pku(r,c,:));
[max_pku(r,c)] = max(pku(r,c,:));
[min_vku(r,c)] = min(vku(r,c,:));
[max_vku(r,c)] = max(vku(r,c,:));
end
end
header11=cell(2,nsamples);
name11 = {'Mean Kuiper test p values'};
header11(2,1) = name11;
mean_pku_cell = num2cell(mean_pku);
header12=cell(2,nsamples);
name12 = {'Standard deviation of Kuiper test p values'};
header12(2,1) = name12;
std_pku_cell = num2cell(std_pku);
header13=cell(2,nsamples);
name13 = {'Mean Kuiper test V statistic values'};
header13(2,1) = name13;
mean_vku_cell = num2cell(mean_vku);
header14=cell(2,nsamples);
name14 = {'Standard deviation of Kuiper test V statistic values'};
header14(2,1) = name14;
std_vku_cell = num2cell(std_vku);
headerI=cell(2,nsamples);
nameI = {'Minimum Kuiper test p values'};
headerI(2,1) = nameI;
min_pku_cell = num2cell(min_pku);
headerJ=cell(2,nsamples);
nameJ = {'Maximum Kuiper test p values'};
headerJ(2,1) = nameJ;
max_pku_cell = num2cell(max_pku);
headerK=cell(2,nsamples);
nameK = {'Minimum Kuiper test V statistic values'};
headerK(2,1) = nameK;
min_vku_cell = num2cell(min_vku);
headerL=cell(2,nsamples);
nameL = {'Maximum of Kuiper test V statistic values'};
headerL(2,1) = nameL;
max_vku_cell = num2cell(max_vku);
for (r=1:nsamples);
for (c=1:nsamples);
for (p=1:ttrials);
[R2(r,c,p)] = r2(rand_pdp_out(:,r,p),rand_pdp_out(:,c,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_R2(r,c)] = mean(R2(r,c,:));
[std_R2(r,c)] = std(R2(r,c,:));
[min_R2(r,c)] = min(R2(r,c,:));
[max_R2(r,c)] = max(R2(r,c,:));
end
end
header15=cell(2,nsamples);
name15 = {'Mean Cross Correlation Coefficient'};
header15(2,1) = name15;
mean_R2_cell = num2cell(mean_R2);
header16=cell(2,nsamples);
name16 = {'Standard deviation Cross Correlation Coefficient'};
header16(2,1) = name16;
std_R2_cell = num2cell(std_R2);
headerM=cell(2,nsamples);
nameM = {'Minimum Cross Correlation Coefficient'};
headerM(2,1) = nameM;
min_R2_cell = num2cell(min_R2);
headerN=cell(2,nsamples);
nameN = {'Maximum Cross Correlation Coefficient'};
headerN(2,1) = nameN;
max_R2_cell = num2cell(max_R2);
a = str2num(get(handles.a,'String'));
b = str2num(get(handles.b,'String'));
for r = (1:nsamples);
for c = (1:nsamples);
for p = (1:ttrials);
[like_out(r,c,p)] = like(rand_pdp_out(:,r,p), rand_pdp_out(:,c,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_like_out(r,c)] = mean(like_out(r,c,:));
[std_like_out(r,c)] = std(like_out(r,c,:));
[min_like_out(r,c)] = min(like_out(r,c,:));
[max_like_out(r,c)] = max(like_out(r,c,:));
end
end
header17=cell(2,nsamples);
name17 = {'Mean Likeness value'};
header17(2,1) = name17;
mean_like_cell = num2cell(mean_like_out);
header18=cell(2,nsamples);
name18 = {'Standard deviation Likeness value'};
header18(2,1) = name18;
std_like_cell = num2cell(std_like_out);
headerO=cell(2,nsamples);
nameO = {'Minimum Likeness value'};
headerO(2,1) = nameO;
min_like_cell = num2cell(min_like_out);
headerP=cell(2,nsamples);
nameP = {'Maximum Likeness value'};
headerP(2,1) = nameP;
max_like_cell = num2cell(max_like_out);
for r = (1:nsamples);
for c = (1:nsamples);
for p = (1:ttrials);
[Sim(r,c,p)] = similarity(rand_pdp_out(:,r,p), rand_pdp_out(:,c,p));
end
end
end
for (r=1:nsamples);
for (c=1:nsamples);
[mean_Sim(r,c)] = mean(Sim(r,c,:));
[std_Sim(r,c)] = std(Sim(r,c,:));
[min_Sim(r,c)] = min(Sim(r,c,:));
[max_Sim(r,c)] = max(Sim(r,c,:));
end
end
header19=cell(2,nsamples);
name19 = {'Mean Similarity value'};
header19(2,1) = name19;
mean_Sim_cell = num2cell(mean_Sim);
header20=cell(2,nsamples);
name20 = {'Standard deviation Similarity value'};
header20(2,1) = name20;
std_Sim_cell = num2cell(std_Sim);
headerQ=cell(2,nsamples);
nameQ = {'Minimum Similarity value'};
headerQ(2,1) = nameQ;
min_Sim_cell = num2cell(min_Sim);
headerR=cell(2,nsamples);
nameR = {'Maximum Similarity value'};
headerR(2,1) = nameR;
max_Sim_cell = num2cell(max_Sim);
all_cell = [header1;header1a;header1b;header1c;header15;mean_R2_cell;header16;std_R2_cell;headerM;min_R2_cell;headerN;max_R2_cell;header17; ...
    mean_like_cell;header18;std_like_cell;headerO;min_like_cell;headerP;max_like_cell;header19;mean_Sim_cell;header20;std_Sim_cell;headerQ; ...
    min_Sim_cell;headerR;max_Sim_cell;header2;mean_pks_cell;header3;std_pks_cell;header5;mean_kks_cell;header6;std_kks_cell;headerA; ...
    min_pks_cell;headerB;max_pks_cell;headerC;min_kks_cell;headerD;max_kks_cell;header11;mean_pku_cell;header12;std_pku_cell;header13; ...
    mean_vku_cell;header14;std_vku_cell;headerI;min_pku_cell;headerJ;max_pku_cell;headerK; ...
    min_vku_cell;headerL;max_vku_cell;];
[file,path] = uiputfile('*.xls','Save file');
xlwrite([path file], all_cell);

%%%%%%%%%% --- Export graphs button --- %%%%%%%%%%
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = figure;
copyobj(handles.axes21,f);
copyobj(handles.axes20,f);
