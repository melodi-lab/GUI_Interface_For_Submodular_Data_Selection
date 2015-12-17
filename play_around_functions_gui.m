function varargout = simple_gui(varargin)
% SIMPLE_GUI MATLAB code for simple_gui.fig
%      SIMPLE_GUI, by itself, creates a new SIMPLE_GUI or raises the existing
%      singleton*.
%
%      H = SIMPLE_GUI returns the handle to a new SIMPLE_GUI or the handle to
%      the existing singleton*.
%
%      SIMPLE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLE_GUI.M with the given input arguments.
%
%      SIMPLE_GUI('Property','Value',...) creates a new SIMPLE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simple_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simple_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simple_gui

% Last Modified by GUIDE v2.5 27-Aug-2015 11:26:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simple_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @simple_gui_OutputFcn, ...
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


% --- Executes just before simple_gui is made visible.
function simple_gui_OpeningFcn(hObject, eventdata, handles, varargin)

rng(1);
num_clusters = 10;
num_outliers = 20;
num_points_in_cluster = 20;
width_in_cluster = 0.1;
sigma = 0.0001;
K = 20;

mu_x = 1*rand(num_clusters,1);
mu_y = 1*rand(num_clusters,1);
out_x = 1*rand(num_outliers,1);
out_y = 1*rand(num_outliers,1);
X_Vec = [out_x];
Y_Vec = [out_y];
for i=1:num_clusters
    x = width_in_cluster*randn(num_points_in_cluster,1);
    y = width_in_cluster*randn(num_points_in_cluster, 1);
    x = x + mu_x(i);
    y = y + mu_y(i);
    X_Vec = [X_Vec; x];
    Y_Vec = [Y_Vec; y];
end

z = [x,y];
handles.z = z;
handles.X_Vec = X_Vec;
handles.Y_Vec = Y_Vec;

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simple_gui (see VARARGIN)

% Choose default command line output for simple_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simple_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simple_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function num_clusters_Callback(hObject, eventdata, handles)
% hObject    handle to num_clusters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_clusters as text
%        str2double(get(hObject,'String')) returns contents of num_clusters as a double


% --- Executes during object creation, after setting all properties.
function num_clusters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_clusters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_points_in_cluster_Callback(hObject, eventdata, handles)
% hObject    handle to num_points_in_cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_points_in_cluster as text
%        str2double(get(hObject,'String')) returns contents of num_points_in_cluster as a double


% --- Executes during object creation, after setting all properties.
function num_points_in_cluster_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_points_in_cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function width_in_cluster_Callback(hObject, eventdata, handles)
% hObject    handle to width_in_cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width_in_cluster as text
%        str2double(get(hObject,'String')) returns contents of width_in_cluster as a double
%handles.width_in_cluster
%printf('%s\n', handles.width_in_cluster);


% --- Executes during object creation, after setting all properties.
function width_in_cluster_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_in_cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_outliers_Callback(hObject, eventdata, handles)
% hObject    handle to num_outliers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_outliers as text
%        str2double(get(hObject,'String')) returns contents of num_outliers as a double


% --- Executes during object creation, after setting all properties.
function num_outliers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_outliers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_plot.
function pushbutton_plot_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.width
rng(1);
num_clusters = str2num(get(handles.num_clusters, 'String'));
num_outliers = str2num(get(handles.num_outliers, 'String'));
num_points_in_cluster = str2num(get(handles.num_points_in_cluster, 'String'));
width_in_cluster = str2num(get(handles.width_in_cluster, 'String'));
%sigma = 0.01;
%func_choice = 5 % 1 facility location, 2 min-faciity location, 3 min-min dist, 4, sum-sum dist, 5 graph-cut function, 6 min-V dist
%K = 20;
mu_x = 1*rand(num_clusters,1);
mu_y = 1*rand(num_clusters,1);
out_x = 1*rand(num_outliers,1);
out_y = 1*rand(num_outliers,1);
X_Vec = [out_x];
Y_Vec = [out_y];
for i=1:num_clusters
    x = width_in_cluster*randn(num_points_in_cluster,1);
    y = width_in_cluster*randn(num_points_in_cluster, 1);
    x = x + mu_x(i);
    y = y + mu_y(i);
    X_Vec = [X_Vec; x];
    Y_Vec = [Y_Vec; y];
end

z = [x,y];

plot(X_Vec,Y_Vec, 'r*');hold on;
plot(X_Vec(1:num_outliers),Y_Vec(1:num_outliers), 'g*'); hold off;
axis equal;
xlabel('X-axis');
ylabel('Y-axis');
title('2-D synthetic data');
legend('Points in clusters', 'Outliers');


% --- Executes on selection change in popupmenu_selection_choice.
function popupmenu_selection_choice_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_selection_choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_selection_choice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_selection_choice


% --- Executes during object creation, after setting all properties.
function popupmenu_selection_choice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_selection_choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma_Callback(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma as text
%        str2double(get(hObject,'String')) returns contents of sigma as a double


% --- Executes during object creation, after setting all properties.
function sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_Callback(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K as text
%        str2double(get(hObject,'String')) returns contents of K as a double


% --- Executes during object creation, after setting all properties.
function K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_selection.
function pushbutton_selection_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


num_clusters = str2num(get(handles.num_clusters, 'String'));
num_outliers = str2num(get(handles.num_outliers, 'String'));
num_points_in_cluster = str2num(get(handles.num_points_in_cluster, 'String'));
width_in_cluster = str2num(get(handles.width_in_cluster, 'String'));
K = str2num(get(handles.K, 'String'));
sigma = str2num(get(handles.sigma, 'String'));

rng(1);
mu_x = 1*rand(num_clusters,1);
mu_y = 1*rand(num_clusters,1);
out_x = 1*rand(num_outliers,1);
out_y = 1*rand(num_outliers,1);
X_Vec = [out_x];
Y_Vec = [out_y];
for i=1:num_clusters
    x = width_in_cluster*randn(num_points_in_cluster,1);
    y = width_in_cluster*randn(num_points_in_cluster, 1);
    x = x + mu_x(i);
    y = y + mu_y(i);
    X_Vec = [X_Vec; x];
    Y_Vec = [Y_Vec; y];
end

z = [x,y];
%clf;
%delete(PlotData);
plot(X_Vec,Y_Vec, 'r*');hold on;
plot(X_Vec(1:num_outliers),Y_Vec(1:num_outliers), 'g*'); hold on;

mat = [X_Vec, Y_Vec];
A=repmat(diag(mat*mat'), 1,length(mat));
B=repmat(diag(mat*mat')', length(mat), 1);
dist = A+B-2*mat*mat';
dist = sqrt(dist);
dist_vec = reshape(dist, [], 1);

val = get(handles.popupmenu_selection_choice, 'Value');
str = get(handles.popupmenu_selection_choice, 'String');
selection_choice = str(val);
%sigma
%dist


switch selection_choice{1}
    case 'Facility Location + Gaussian Kernel'
        set(handles.displayEquation, 'String', 'Facility location')
        sim_matrix = exp(-(dist.^2)/sigma);
        list = greedy_facility_location(sim_matrix, K);
    case 'Facility Location + Linear Kernel'
        sim_matrix = -dist;
        list = greedy_facility_location(sim_matrix, K);
    case 'Robust Facility Location + Gaussian Kernel'
        sim_matrix = exp(-(dist.^2)/sigma);
        list = greedy_min_facility_location(sim_matrix, K);
    case 'Robust Facility Location + Linear Kernel'
        sim_matrix = -dist;
        list = greedy_min_facility_location(sim_matrix, K);
    case 'Min-pairwise Distance Function' 
        list = greedy_min_pairwise_distance(dist, K);
    case 'Sum-pairwise Distance Function'
        list = greedy_sum_pairwise_distance(dist, K);
    case 'Graph-cut Function + Gaussian Kernel'
        lambda1 = 1;
        lambda2 = 1;
        sim_matrix = exp(-(dist.^2)/sigma);
        list = greedy_graphcut_function(sim_matrix, K, lambda1, lambda2);
    case 'Graph-cut Function + Linear Kernel'
        lambda1 = 1;
        lambda2 = 1;
        sim_matrix = -dist;
        list = greedy_graphcut_function(sim_matrix, K, lambda1, lambda2);
    case 'Min-V-Distance Function'
        list = greedy_min_V_pairwise_distance(dist, K);
    case '-SumSumPairwise Similarity + Gaussian Kernel'
        sim_matrix = exp(-(dist).^2/sigma);
        list = greedy_neg_sum_sum_pairwise_similarity(sim_matrix, K);
    case '-SumSumPairwise Similarity + Linear Kernel'
        sim_matrix = -(dist);
        list = greedy_neg_sum_sum_pairwise_similarity(sim_matrix, K);
    case 'LogDet + Gaussian Kernel'
        sim_matrix = exp(-(dist).^2/sigma);
        gamma = 1;
        list = greedy_log_det_similarity(sim_matrix, K, gamma);
end

for i=1:K
    s = strcat('\leftarrow ', num2str(i));
    text(X_Vec(list(i)), Y_Vec(list(i)), s, 'HorizontalAlignment', 'left', 'fontsize', 40);
end
plot(X_Vec(list),Y_Vec(list), 'rO');hold off;

axis equal;
xlabel('X-axis');
ylabel('Y-axis');
title('2-D synthetic data');
legend('Points in clusters', 'Outliers');


% --- Executes on selection change in popupmenu_seed_options.
function popupmenu_seed_options_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_seed_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_seed_options contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_seed_options


% --- Executes during object creation, after setting all properties.
function popupmenu_seed_options_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_seed_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
