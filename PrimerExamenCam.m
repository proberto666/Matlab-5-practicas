function varargout = PrimerExamenCam(varargin)
% PRIMEREXAMENCAM MATLAB code for PrimerExamenCam.fig
%      PRIMEREXAMENCAM, by itself, creates a new PRIMEREXAMENCAM or raises the existing
%      singleton*.
%
%      H = PRIMEREXAMENCAM returns the handle to a new PRIMEREXAMENCAM or the handle to
%      the existing singleton*.
%
%      PRIMEREXAMENCAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRIMEREXAMENCAM.M with the given input arguments.
%
%      PRIMEREXAMENCAM('Property','Value',...) creates a new PRIMEREXAMENCAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PrimerExamenCam_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PrimerExamenCam_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PrimerExamenCam

% Last Modified by GUIDE v2.5 09-Sep-2021 14:31:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PrimerExamenCam_OpeningFcn, ...
                   'gui_OutputFcn',  @PrimerExamenCam_OutputFcn, ...
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


% --- Executes just before PrimerExamenCam is made visible.
function PrimerExamenCam_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PrimerExamenCam (see VARARGIN)

% Choose default command line output for PrimerExamenCam
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PrimerExamenCam wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PrimerExamenCam_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnCapturar.
function btnCapturar_Callback(hObject, eventdata, handles)
% hObject    handle to btnCapturar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objvideo;
global foto;
global fotoAux;
axes(handles.axesPrev);
axis off;
foto=getsnapshot(objvideo);
image(foto);
%foto=imcrop(foto(:,0:220));
imwrite(foto,'fpe1.jpg','jpg');
%foto = imread('fpe1.jpg');
imshow(foto);
axes(handles.axesR);
global R;
global G;
global B;
global O;
global V;
global Y;
global I;
R=foto;    
R(:, :, 3)=0;
R(:, :, 2)=0;
imshow(R);
axes(handles.axesG);
G=foto;    
G(:, :, 3)=0;
G(:, :, 1)=0;
imshow(G);
axes(handles.axesB);
B=foto;    
B(:, :, 1)=0;
B(:, :, 2)=0;
imshow(B);
axes(handles.axesI);
I=foto;    
I(:, :, 1)=0;
imshow(I);
axes(handles.axesV);
V=foto;    
V(:, :, 2)=0;
imshow(V);
axes(handles.axesY);
Y=foto;    
Y(:, :, 3)=0;
imshow(Y);
axes(handles.axesO);
O=R+Y;
imshow(O);
fotoAux=foto;
guidata(hObject,handles);

% --- Executes on button press in btnComb3.
function btnComb3_Callback(hObject, eventdata, handles)
% hObject    handle to btnComb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%(V+R)+10(A*N)
global fotoAux;
global R;
global O;
global V;
global Y;
axes(handles.axesPrev);
Comb3=immultiply((V+R),10.*(Y+O));
imshow(Comb3);
fotoAux=Comb1;
guidata(hObject,handles);

% --- Executes on button press in btnComb2.
function btnComb2_Callback(hObject, eventdata, handles)
% hObject    handle to btnComb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%(R+G)(V+Y)
global fotoAux;
global R;
global G;
global V;
global Y;
axes(handles.axesPrev);
Comb2=immultiply((R+G),(V+Y));
imshow(Comb2);
fotoAux=Comb1;
guidata(hObject,handles);

% --- Executes on button press in btnComb1.
function btnComb1_Callback(hObject, eventdata, handles)
% hObject    handle to btnComb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% (r+b)*(n)
global fotoAux;
global R;
global B;
global O;
axes(handles.axesPrev);
Comb1=(R+B).*O
imshow(Comb1);
fotoAux=Comb1;
guidata(hObject,handles);


% --- Executes on slider movement.
function sldAjuste_Callback(hObject, eventdata, handles)
% hObject    handle to sldAjuste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global foto;
axes(handles.axesPrev);
x=get(hObject,'Value');
Imad=imadjust(foto,[x 1], []);
imshow(Imad);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function sldAjuste_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldAjuste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnOn.
function btnOn_Callback(hObject, eventdata, handles)
% hObject    handle to btnOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear objvideo;
clear foto;
clear hImage;
global objvideo;
axis off;
axes(handles.axesPrev);
objvideo=videoinput('winvideo',1,'RGB24_640x480');
hImage=image(zeros(480,640,3),'Parent',handles.axesPrev);
preview(objvideo,hImage);
start(objvideo);
guidata(hObject,handles);


% --- Executes on button press in btnSalir.
function btnSalir_Callback(hObject, eventdata, handles)
% hObject    handle to btnSalir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;
