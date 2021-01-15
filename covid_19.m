function varargout = covid_19(varargin)
% COVID_19 MATLAB code for covid_19.fig
%      COVID_19, by itself, creates a new COVID_19 or raises the existing
%      singleton*.
%
%      H = COVID_19 returns the handle to a new COVID_19 or the handle to
%      the existing singleton*.
%
%      COVID_19('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COVID_19.M with the given input arguments.
%
%      COVID_19('Property','Value',...) creates a new COVID_19 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before covid_19_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to covid_19_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help covid_19

% Last Modified by GUIDE v2.5 15-Apr-2020 12:01:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @covid_19_OpeningFcn, ...
                   'gui_OutputFcn',  @covid_19_OutputFcn, ...
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


% --- Executes just before covid_19 is made visible.
function covid_19_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to covid_19 (see VARARGIN)
% Choose default command line output for covid_19
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
bg = axes('units', 'normalized', 'position', [0 0 1 1]);
wr = imread('gradientbiru.png');
imagesc(wr);
set(bg, 'handlevisibility', 'off', 'visible', 'off');

% UIWAIT makes covid_19 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = covid_19_OutputFcn(~, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in ambildata.
function ambildata_Callback(hObject, eventdata, handles)
% hObject    handle to ambildata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('covid_19.xlsx');
set(handles.tabel, 'Data', data);
guidata(hObject,handles);


% --- Executes on button press in plotgrafik.
function plotgrafik_Callback(hObject, eventdata, handles)
% hObject    handle to plotgrafik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.grafik)
data = xlsread('covid_19.xlsx');
bulan = data(:,1);
Jumlah = data(:,2);
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
title('GRAFIK PENYEBARAN COVID-19','fontsize',14,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
ylabel('Jumlah', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
xlabel('Bulan', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
hold on
guidata(hObject,handles);


% --- Executes on button press in Grid.
function Grid_Callback(hObject, eventdata, handles)
% hObject    handle to Grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Grid
checkboxStatus = get(handles.Grid,'Value');
if(checkboxStatus)
grid on
hold on
else
grid off
hold on
end
guidata(hObject,handles);

% --- Executes on selection change in bg.
function bg_Callback(hObject, eventdata, handles)
% hObject    handle to bg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns bg contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bg
switch get(handles.bg,'Value');
    case 1
        set(handles.grafik, 'color', 'w');
        set(gca, 'GridColor', [0 0 0])
        hold on
    case 2
        set(handles.grafik, 'color', [0.5 0.09 0.09]);
        set(gca, 'GridColor', [1 1 1])
        hold on
    case 3
        set(handles.grafik, 'color', [0.09 0.09 0.5]);
        set(gca, 'GridColor', [1 1 1])
        hold on
    case 4
        set(handles.grafik, 'color', [0.36 0.80 0.36]);
        set(gca, 'GridColor', [0 0 0])
        hold on
    case 5
        set(handles.grafik, 'color', [0.98 0.85 0.1]);
        set(gca, 'GridColor', [0 0 0])
        hold on
    otherwise
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function bg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Default.
function Default_Callback(hObject, eventdata, handles)
% hObject    handle to Default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Default
Def = get(handles.Default,'Value');
axes(handles.grafik)
data = xlsread('covid_19.xlsx');
bulan = data(:,1);
Jumlah = data(:,2);
title('GRAFIK PENYEBARAN COVID-19','fontsize',14,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
ylabel('Jumlah', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
xlabel('Bulan', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
if(Def)
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
else
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
end
guidata(hObject,handles);


% --- Executes on button press in Merah.
function Merah_Callback(hObject, eventdata, handles)
% hObject    handle to Merah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Merah
Red = get(handles.Merah,'Value');
axes(handles.grafik)
data = xlsread('covid_19.xlsx');
bulan = data(:,1);
Jumlah = data(:,2);
title('GRAFIK PENYEBARAN COVID-19','fontsize',14,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
ylabel('Jumlah', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
xlabel('Bulan', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
if(Red)
plot(bulan,Jumlah,'-ro', 'LineWidth', 1.5);
else
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
end
guidata(hObject,handles);


% --- Executes on button press in Biru.
function Biru_Callback(hObject, eventdata, handles)
% hObject    handle to Biru (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Biru
blu = get(handles.Biru,'Value');
axes(handles.grafik)
data = xlsread('covid_19.xlsx');
bulan = data(:,1);
Jumlah = data(:,2);
title('GRAFIK PENYEBARAN COVID-19','fontsize',14,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
ylabel('Jumlah', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
xlabel('Bulan', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
if(blu)
plot(bulan,Jumlah,'-bo', 'LineWidth', 1.5);
else
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
end
guidata(hObject,handles);


% --- Executes on button press in Hijau.
function Hijau_Callback(hObject, eventdata, handles)
% hObject    handle to Hijau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Hijau
grn = get(handles.Hijau,'Value');
axes(handles.grafik)
data = xlsread('covid_19.xlsx');
bulan = data(:,1);
Jumlah = data(:,2);
title('GRAFIK PENYEBARAN COVID-19','fontsize',14,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
ylabel('Jumlah', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
xlabel('Bulan', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
if(grn)
plot(bulan,Jumlah,'-go', 'LineWidth', 1.5);

else
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
end
guidata(hObject,handles);


% --- Executes on button press in Kuning.
function Kuning_Callback(hObject, eventdata, handles)
% hObject    handle to Kuning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Kuning
ylw = get(handles.Kuning,'Value');
axes(handles.grafik)
data = xlsread('covid_19.xlsx');
bulan = data(:,1);
Jumlah = data(:,2);
title('GRAFIK PENYEBARAN COVID-19','fontsize',14,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
ylabel('Jumlah', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
xlabel('Bulan', 'fontsize',13,'color','w','fontname','Caviar Dreams', 'fontweight', 'bold');
if(ylw)
plot(bulan,Jumlah,'-yo', 'LineWidth', 1.5);
else
plot(bulan,Jumlah,'-ko', 'LineWidth', 1.5);
end
guidata(hObject,handles);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tabel, 'Data', cell(size(get(handles.tabel, 'Data'))));
axes(handles.grafik);
handles.Grid.Value = false;
handles.bg.Value = 1;
handles.Default.Value = true;
handles.Merah.Value = false;
handles.Biru.Value = false;
handles.Kuning.Value = false;
handles.Hijau.Value = false;
cla reset;
guidata(hObject,handles);
