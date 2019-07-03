function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 11-Nov-2018 11:27:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Resimsec.
function Resimsec_Callback(hObject, eventdata, handles)
% hObject    handle to Resimsec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global asilImg;
global Opath;
global Ofile;
[file, path]= uigetfile({'*.jpg;*.jpeg;*.tif;*.tiff;*.png;*.gif','All Image Files'});
if file==0
    msgbox(spirngf('Lütfen Bir Resim Seçiniz'),'HATA','Error');
end
Opath=path
Ofile=file
handles.im= imread(strcat(path, file));
asilImg=handles.im;
axes(handles.axes1);
imshow(handles.im);
%im_colours= checkcolours(handles.im);
%set(handles.text1, 'String', im_colours);
guidata(hObject,handles)

% --- Executes on button press in Uygula.
function Uygula_Callback(hObject, eventdata, handles)
% hObject    handle to Uygula (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global noOfColor;
global CQTeknik;
global Ofile;
global Opath;
global Opathto;
global img;
global img2;
global inImgPath;
inImgPath= [Opath, Ofile];
x=Ofile;
y=Opath;
axes(handles.axes2);
switch CQTeknik
    case 'Uniform CQ';
        axes(handles.axes1);
        pathim=[Opath,Ofile];
        img=imread(pathim);
        imshow(img);
        axes(handles.axes2);
        img2=Uniform(img,noOfColor);
        imshow(img2);
    case 'Popularity CQ';
        axes(handles.axes1);
        pathim=[Opath,Ofile];
        img=imread(pathim);
        imga=rgb2gray(img);
        imshow(imga);
        axes(handles.axes2);
        Opathto=Popularity(Opath,Ofile,noOfColor);
        img2=imread(Opathto);
        %imshow(img2);
    case 'Median Cut CQ';
        axes(handles.axes1);
        imshow(img);
        axes(handles.axes2);
        img2=mediancut(inImgPath, noOfColor);
        imshow(img2);
    case 'Octre CQ';
        axes(handles.axes1);
        imshow(img);
        axes(handles.axes2);
        [img2,ImgMap]=Octre(inImgPath,noOfColor);
        imshow(img2,ImgMap);
    case 'K-Mean CQ';
        axes(handles.axes1);
        imshow(img);
        axes(handles.axes2);
        Opathto=KMean(Opath,Ofile,noOfColor);
        img2=imread(Opathto);
        imshow(img2);
otherwise
end
%noOfBaskaColor=int2str(noOfColor);
%den=[CQTeknik,'_'];
%denn=[den,noOfBaskaColor];
%dennn=[denn,'_'];
%dennnn=[dennn,Ofile];
%Opathto=[Opath,dennnn];

if strcmp(CQTeknik,'Popularity CQ')  
    disp('Popularity Processing Started');
elseif strcmp(CQTeknik,'K-Mean CQ') 
    disp('K-Mean Processing Started');
elseif strcmp(CQTeknik,'Octre CQ')
    noOfBaskaColor=int2str(noOfColor);
    den=[CQTeknik,'_'];
    denn=[den,noOfBaskaColor];
    dennn=[denn,'_'];
    dennnn=[dennn,Ofile];
    Opathto=[Opath,dennnn];
    imwrite(img2,ImgMap,Opathto);
else
    noOfBaskaColor=int2str(noOfColor);
    den=[CQTeknik,'_'];
    denn=[den,noOfBaskaColor];
    dennn=[denn,'_'];
    dennnn=[dennn,Ofile];
    Opathto=[Opath,dennnn];
    imwrite(img2,Opathto);
end
axes(handles.axes3);
image_hist_RGB_3d(inImgPath,6,0.5);
axes(handles.axes4);
image_hist_RGB_3d(Opathto,6,0.5);
% --- Executes on button press in dithering.
function dithering_Callback(hObject, eventdata, handles)
% hObject    handle to dithering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dithering



function falan_Callback(hObject, eventdata, handles)
% hObject    handle to falan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of falan as text
%        str2double(get(hObject,'String')) returns contents of falan as a double


% --- Executes during object creation, after setting all properties.
function falan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to falan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noOfColor.
function noOfColor_Callback(hObject, eventdata, handles)
% hObject    handle to noOfColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints:  returns noOfColor contents as cell array
%         returns selected item from noOfColor
global noOfColor;
contents = cellstr(get(hObject,'String'));
switch contents{get(hObject,'Value')}
    case '2';
        noOfColor=2;
    case '4';
         noOfColor=4;
    case '8';
         noOfColor=8;
    case '16';
         noOfColor=16;
    case '32';
         noOfColor=32;
    case '64';
         noOfColor=64;
    case '128';
         noOfColor=128;
    case '256';
         noOfColor=256;
    case '512';
         noOfColor=512;
    otherwise
end                   

% --- Executes during object creation, after setting all properties.
function noOfColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noOfColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CQTeknik.
function CQTeknik_Callback(hObject, eventdata, handles)
% hObject    handle to CQTeknik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CQTeknik contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CQTeknik
global CQTeknik;
contents = cellstr(get(hObject,'String'))
CQTeknik = contents{get(hObject,'Value')};

% --- Executes during object creation, after setting all properties.
function CQTeknik_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CQTeknik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DitheringTeknik.
function DitheringTeknik_Callback(hObject, eventdata, handles)
% hObject    handle to DitheringTeknik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DitheringTeknik contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DitheringTeknik
global Dithering;
contents = cellstr(get(hObject,'String'))
Dithering=contents{get(hObject,'Value')};
Dithering_Callback(hObject, eventdata, handles);
% --- Executes during object creation, after setting all properties.
function DitheringTeknik_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DitheringTeknik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Dithering.
function Dithering_Callback(hObject, eventdata, handles)
% hObject    handle to Dithering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Dithering
global img;
global img2;
global Opath;
global Ofile;
global Dithering;
global Opathto;
global CQTeknik;
value=get(handles.Dithering,'Value');
if value==1
axes(handles.axes2);
switch Dithering
    case 'Jarvis Dithering';
        axes(handles.axes1);
        image=imread(Opathto);
        imshow(image);
        axes(handles.axes2);
        disp('Dithering Started');
        Jarvis(Opathto);
        disp('Dithering Complete');
    case 'Floyd Steinberg Dithering';
        axes(handles.axes1);
        image=imread(Opathto);
        imga=rgb2gray(image);
        imshow(imga);
        axes(handles.axes2);
        disp('Dithering Started');
        floydHalftone(imga);
        disp('Dithering Complete');
    case 'Stucki Dithering';
        axes(handles.axes1);
        image=imread(Opathto);
        imshow(image);
        axes(handles.axes2);
        disp('Dithering Started');
        Stucki(img2);
        disp('Dithering Complete');
    case 'Bayer Dithering';
         axes(handles.axes1);
        image=imread(Opathto);
        imga=rgb2gray(image);
        imshow(imga);
        disp('Dithering Started');
        axes(handles.axes2);
        Bayer(img2);%siyah beyaz yap
        disp('Dithering Complete');
    case 'tdi Dithering 1 ';
        axes(handles.axes1);
        if strcmp(CQTeknik,'Popularity CQ')
            imga=img2;
        else
            imga=rgb2gray(img2);
        end
        imshow(imga);
        axes(handles.axes2);
        disp('Dithering Started');
        tdidither(Opathto);
        disp('Dithering Complete');
    case 'tdi Dithering 2 ';
        axes(handles.axes1);
        imga=rgb2gray(img2);
        imshow(imga);
        disp('Dithering Started');
        axes(handles.axes2);
        tdiDitherP1A(Opathto);
        disp('Dithering Complete');
    case 'tdi Dithering 3 ';
        axes(handles.axes1);
        imga=rgb2gray(img2);
        imshow(imga);
        axes(handles.axes2);
        disp('Dithering Started');
        tdiDitherP1B(Opathto);
        disp('Dithering Complete');
    case 'tdi Dithering 4 ';
        axes(handles.axes1);
        imga=rgb2gray(img2);
        imshow(imga);
        axes(handles.axes2);
        disp('Dithering Started');
        tdiDitherP2A(Opathto);
        disp('Dithering Complete');
    case 'tdi Dithering 5 ';
        axes(handles.axes1);
        imga=rgb2gray(img2);
        imshow(imga);
        axes(handles.axes2);
        disp('Dithering Started');
        tdiDitherP3A(Opathto);
        disp('Dithering Complete');
    case 'tdi Dithering 6 ';
        axes(handles.axes1);
        imga=rgb2gray(img2);
        imshow(imga);
        axes(handles.axes2);
        disp('Dithering Started');
        tdiDitherP4A(Opathto);
        disp('Dithering Complete');
    otherwise                           
end
else
    axes(handles.axes1);
    imshow(img);
    axes(handles.axes2);
    imshow(img2);
end
