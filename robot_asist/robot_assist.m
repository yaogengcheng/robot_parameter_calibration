function varargout = robot_assist(varargin)
% ROBOT_ASSIST MATLAB code for robot_assist.fig
%      ROBOT_ASSIST, by itself, creates a new ROBOT_ASSIST or raises the existing
%      singleton*.
%
%      H = ROBOT_ASSIST returns the handle to a new ROBOT_ASSIST or the handle to
%      the existing singleton*.
%
%      ROBOT_ASSIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOT_ASSIST.M with the given input arguments.
%
%      ROBOT_ASSIST('Property','Value',...) creates a new ROBOT_ASSIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robot_assist_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robot_assist_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help robot_assist

% Last Modified by GUIDE v2.5 17-May-2019 16:56:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robot_assist_OpeningFcn, ...
                   'gui_OutputFcn',  @robot_assist_OutputFcn, ...
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
% --- Executes just before robot_assist is made visible.
function robot_assist_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robot_assist (see VARARGIN)

% Choose default command line output for robot_assist
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes robot_assist wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = robot_assist_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
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


% --- Executes on button press in Forward.
function Forward_Callback(hObject, eventdata, handles)
% hObject    handle to Forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1=str2double(handles.Theta_1.String)*pi/180;
Th_2=str2double(handles.Theta_2.String)*pi/180;
Th_3=str2double(handles.Theta_3.String)*pi/180;
Th_4=str2double(handles.Theta_4.String)*pi/180;
Th_5=str2double(handles.Theta_5.String)*pi/180;
Th_6=str2double(handles.Theta_6.String)*pi/180;

Alpha_1=str2double(handles.Delta_alpha1.String)*pi/180;
Alpha_2=str2double(handles.Delta_alpha2.String)*pi/180;
Alpha_3=str2double(handles.Delta_alpha3.String)*pi/180;
Alpha_4=str2double(handles.Delta_alpha4.String)*pi/180;
Alpha_5=str2double(handles.Delta_alpha5.String)*pi/180;
Alpha_6=str2double(handles.Delta_alpha6.String)*pi/180;

Delta_a1=str2double(handles.Delta_a1.String);
Delta_a2=str2double(handles.Delta_a2.String);
Delta_a3=str2double(handles.Delta_a3.String);
Delta_a4=str2double(handles.Delta_a4.String);
Delta_a5=str2double(handles.Delta_a5.String);
Delta_a6=str2double(handles.Delta_a6.String);

Delta_d1=str2double(handles.Delta_d1.String);
Delta_d2=str2double(handles.Delta_d2.String);
Delta_d3=str2double(handles.Delta_d3.String);
Delta_d4=str2double(handles.Delta_d4.String);
Delta_d5=str2double(handles.Delta_d5.String);
Delta_d6=str2double(handles.Delta_d6.String);

% L(1)=Link([0 L_1 0 pi/2]);
% L(2)=Link([0 0 L_2 0]);
% L(3)=Link([0 0 L_3 0 ]);
L1=Link([0       Delta_a1     Delta_d1    Alpha_1      ]); %定义连杆的D-H参数
L2=Link([-pi/2   Delta_a2     Delta_d2    Alpha_2      ]);
L3=Link([0       Delta_a3     Delta_d3    Alpha_3      ]);
L4=Link([0       Delta_a4     Delta_d4    Alpha_4      ]); %定义连杆的D-H参数
L5=Link([-pi/2   Delta_a5     Delta_d5    Alpha_5      ]);
L6=Link([0       Delta_a6     Delta_d6    Alpha_6      ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','robot'); %连接连杆，机器人取名manman
robot.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6]);%输出机器人模型，后面的六个角为输出时的theta姿态

% Robot=SerialLink(L);
% Robot.name='RRR_Robot';
% Robot.plot([Th_1 Th_2 Th_3]);
 
T=robot.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6]);
handles.Pos_X.String=num2str(round(T.t(1)));
handles.Pos_Y.String=num2str(round(T.t(2)));
handles.Pos_Z.String=num2str(round(T.t(3)));
% Tranl_T=tr2rt(T);
% Tranl_T=tr2rpy(T);
handles.alpha_n1.String=num2str(round(T.n(1)));
handles.alpha_n2.String=num2str(round(T.n(2)));
handles.alpha_n3.String=num2str(round(T.n(3)));
handles.alpha_o1.String=num2str(round(T.o(1)));
handles.alpha_o2.String=num2str(round(T.o(2)));
handles.alpha_o3.String=num2str(round(T.o(3)));
handles.alpha_a1.String=num2str(round(T.a(1)));
handles.alpha_a2.String=num2str(round(T.a(2)));
handles.alpha_a3.String=num2str(round(T.a(3)));

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Inverse.
function Inverse_Callback(hObject, eventdata, handles)
% hObject    handle to Inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

PX=str2double(handles.Pos_X.String);
PY=str2double(handles.Pos_Y.String);
PZ=str2double(handles.Pos_Z.String);

n_1=str2double(handles.alpha_n1.String);
n_2=str2double(handles.alpha_n2.String);
n_3=str2double(handles.alpha_n3.String);

o_1=str2double(handles.alpha_o1.String);
o_2=str2double(handles.alpha_o2.String);
o_3=str2double(handles.alpha_o3.String);

a_1=str2double(handles.alpha_a1.String);
a_2=str2double(handles.alpha_a2.String);
a_3=str2double(handles.alpha_a3.String);

% L(1)=Link([0 L_1 0 pi/2]);
% L(2)=Link([0 0 L_2 0]);
% L(3)=Link([0 0 L_3 0 ]);
%  
% Robot=SerialLink(L);
% Robot.name='RRR_Robot';
Alpha_1=str2double(handles.Delta_alpha1.String)*pi/180;
Alpha_2=str2double(handles.Delta_alpha2.String)*pi/180;
Alpha_3=str2double(handles.Delta_alpha3.String)*pi/180;
Alpha_4=str2double(handles.Delta_alpha4.String)*pi/180;
Alpha_5=str2double(handles.Delta_alpha5.String)*pi/180;
Alpha_6=str2double(handles.Delta_alpha6.String)*pi/180;

Delta_a1=str2double(handles.Delta_a1.String);
Delta_a2=str2double(handles.Delta_a2.String);
Delta_a3=str2double(handles.Delta_a3.String);
Delta_a4=str2double(handles.Delta_a4.String);
Delta_a5=str2double(handles.Delta_a5.String);
Delta_a6=str2double(handles.Delta_a6.String);

Delta_d1=str2double(handles.Delta_d1.String);
Delta_d2=str2double(handles.Delta_d2.String);
Delta_d3=str2double(handles.Delta_d3.String);
Delta_d4=str2double(handles.Delta_d4.String);
Delta_d5=str2double(handles.Delta_d5.String);
Delta_d6=str2double(handles.Delta_d6.String);

% L(1)=Link([0 L_1 0 pi/2]);
% L(2)=Link([0 0 L_2 0]);
% L(3)=Link([0 0 L_3 0 ]);
L1=Link([0       Delta_a1     Delta_d1    Alpha_1      ]); %定义连杆的D-H参数
L2=Link([-pi/2   Delta_a2     Delta_d2    Alpha_2      ]);
L3=Link([0       Delta_a3     Delta_d3    Alpha_3      ]);
L4=Link([0       Delta_a4     Delta_d4    Alpha_4      ]); %定义连杆的D-H参数
L5=Link([-pi/2   Delta_a5     Delta_d5    Alpha_5      ]);
L6=Link([0       Delta_a6     Delta_d6    Alpha_6      ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','robot'); %连接连杆，机器人取名manman

T=[n_1 o_1 a_1 PX;
   n_2 o_2 a_2 PY;
   n_3 o_3 a_3 PZ;
   0     0   0 1];
 
q=robot.ikine(T);%ikine逆解函数，根据我们给定的末端位姿T，求解出关节角q

handles.Theta_1.String=num2str(round(q(1)*180/pi));
handles.Theta_2.String=num2str(round(q(2)*180/pi));
handles.Theta_3.String=num2str(round(q(3)*180/pi));
handles.Theta_4.String=num2str(round(q(4)*180/pi));
handles.Theta_5.String=num2str(round(q(5)*180/pi));
handles.Theta_6.String=num2str(round(q(6)*180/pi));

robot.plot([q(1) q(2) q(3) q(4) q(5) q(6)]);%输出机器人模型，后面的六个角为输出时的theta姿态 



function Delta_a1_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_a1 as text
%        str2double(get(hObject,'String')) returns contents of Delta_a1 as a double


% --- Executes during object creation, after setting all properties.
function Delta_a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_alpha1_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_alpha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_alpha1 as text
%        str2double(get(hObject,'String')) returns contents of Delta_alpha1 as a double


% --- Executes during object creation, after setting all properties.
function Delta_alpha1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_alpha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_d1_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_d1 as text
%        str2double(get(hObject,'String')) returns contents of Delta_d1 as a double


% --- Executes during object creation, after setting all properties.
function Delta_d1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_1 as text
%        str2double(get(hObject,'String')) returns contents of Theta_1 as a double


% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_a2_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_a2 as text
%        str2double(get(hObject,'String')) returns contents of Delta_a2 as a double


% --- Executes during object creation, after setting all properties.
function Delta_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_alpha2_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_alpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_alpha2 as text
%        str2double(get(hObject,'String')) returns contents of Delta_alpha2 as a double


% --- Executes during object creation, after setting all properties.
function Delta_alpha2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_alpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_d2_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_d2 as text
%        str2double(get(hObject,'String')) returns contents of Delta_d2 as a double


% --- Executes during object creation, after setting all properties.
function Delta_d2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_2 as text
%        str2double(get(hObject,'String')) returns contents of Theta_2 as a double


% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_a3_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_a3 as text
%        str2double(get(hObject,'String')) returns contents of Delta_a3 as a double


% --- Executes during object creation, after setting all properties.
function Delta_a3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_alpha3_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_alpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_alpha3 as text
%        str2double(get(hObject,'String')) returns contents of Delta_alpha3 as a double


% --- Executes during object creation, after setting all properties.
function Delta_alpha3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_alpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_d3_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_d3 as text
%        str2double(get(hObject,'String')) returns contents of Delta_d3 as a double


% --- Executes during object creation, after setting all properties.
function Delta_d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_3 as text
%        str2double(get(hObject,'String')) returns contents of Theta_3 as a double


% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_a4_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_a4 as text
%        str2double(get(hObject,'String')) returns contents of Delta_a4 as a double


% --- Executes during object creation, after setting all properties.
function Delta_a4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_alpha4_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_alpha4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_alpha4 as text
%        str2double(get(hObject,'String')) returns contents of Delta_alpha4 as a double


% --- Executes during object creation, after setting all properties.
function Delta_alpha4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_alpha4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_d4_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_d4 as text
%        str2double(get(hObject,'String')) returns contents of Delta_d4 as a double


% --- Executes during object creation, after setting all properties.
function Delta_d4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_4_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_4 as text
%        str2double(get(hObject,'String')) returns contents of Theta_4 as a double


% --- Executes during object creation, after setting all properties.
function Theta_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_a5_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_a5 as text
%        str2double(get(hObject,'String')) returns contents of Delta_a5 as a double


% --- Executes during object creation, after setting all properties.
function Delta_a5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_alpha5_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_alpha5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_alpha5 as text
%        str2double(get(hObject,'String')) returns contents of Delta_alpha5 as a double


% --- Executes during object creation, after setting all properties.
function Delta_alpha5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_alpha5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_d5_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_d5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_d5 as text
%        str2double(get(hObject,'String')) returns contents of Delta_d5 as a double


% --- Executes during object creation, after setting all properties.
function Delta_d5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_d5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_5_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_5 as text
%        str2double(get(hObject,'String')) returns contents of Theta_5 as a double


% --- Executes during object creation, after setting all properties.
function Theta_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_a6_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_a6 as text
%        str2double(get(hObject,'String')) returns contents of Delta_a6 as a double


% --- Executes during object creation, after setting all properties.
function Delta_a6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_alpha6_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_alpha6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_alpha6 as text
%        str2double(get(hObject,'String')) returns contents of Delta_alpha6 as a double


% --- Executes during object creation, after setting all properties.
function Delta_alpha6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_alpha6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Delta_d6_Callback(hObject, eventdata, handles)
% hObject    handle to Delta_d6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Delta_d6 as text
%        str2double(get(hObject,'String')) returns contents of Delta_d6 as a double


% --- Executes during object creation, after setting all properties.
function Delta_d6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delta_d6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_6_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_6 as text
%        str2double(get(hObject,'String')) returns contents of Theta_6 as a double


% --- Executes during object creation, after setting all properties.
function Theta_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Pos_X_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_X as text
%        str2double(get(hObject,'String')) returns contents of Pos_X as a double


% --- Executes during object creation, after setting all properties.
function Pos_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Y as text
%        str2double(get(hObject,'String')) returns contents of Pos_Y as a double


% --- Executes during object creation, after setting all properties.
function Pos_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Y as text
%        str2double(get(hObject,'String')) returns contents of Pos_Y as a double



function Pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes when entered data in editable cell(s) in Theta_group.
function Theta_group_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Theta_group (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Error_calulate.
function Error_calulate_Callback(hObject, eventdata, handles)
% hObject    handle to Error_calulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Alpha_1=str2double(handles.Delta_alpha1.String)*pi/180;
Alpha_2=str2double(handles.Delta_alpha2.String)*pi/180;
Alpha_3=str2double(handles.Delta_alpha3.String)*pi/180;
Alpha_4=str2double(handles.Delta_alpha4.String)*pi/180;
Alpha_5=str2double(handles.Delta_alpha5.String)*pi/180;
Alpha_6=str2double(handles.Delta_alpha6.String)*pi/180;
Alpha_G=[Alpha_1 Alpha_2 Alpha_3 Alpha_4 Alpha_5 Alpha_6];

Delta_a1=str2double(handles.Delta_a1.String);
Delta_a2=str2double(handles.Delta_a2.String);
Delta_a3=str2double(handles.Delta_a3.String);
Delta_a4=str2double(handles.Delta_a4.String);
Delta_a5=str2double(handles.Delta_a5.String);
Delta_a6=str2double(handles.Delta_a6.String);
Delta_a=[Delta_a1 Delta_a2 Delta_a3 Delta_a4 Delta_a5 Delta_a6];

Delta_d1=str2double(handles.Delta_d1.String);
Delta_d2=str2double(handles.Delta_d2.String);
Delta_d3=str2double(handles.Delta_d3.String);
Delta_d4=str2double(handles.Delta_d4.String);
Delta_d5=str2double(handles.Delta_d5.String);
Delta_d6=str2double(handles.Delta_d6.String);
Delta_d=[Delta_d1 Delta_d2 Delta_d3 Delta_d4 Delta_d5 Delta_d6];

Theta_group=get(handles.Theta_group,'Data');
% disp(str2double(Theta_group))
Theta_group=str2double(Theta_group);
Theta_group(any(isnan(Theta_group)'),:) = [];
% disp(Theta_group)
EE_pose=get(handles.EE_pose,'Data');
EE_pose=str2double(EE_pose);
EE_pose(any(isnan(EE_pose)'),:) = [];
[m1,n1]=size(Theta_group);
[m2,n2]=size(EE_pose);
% Theta_input=[];
  J=[];EE_poseinput=[];X_output=[];
% for i=1:m1
%     if ~isempty(Theta_group(i,1:n1))
%         Theta_input=[Theta_input; str2double(Theta_group(i,1:n1))];
%     else
%         break
%     end
% end
%  Theta_input = Theta_input(find( ~ isnan(Theta_input)))
% 
% for i=1:m2
%     if ~isempty(EE_pose(i,1:n2))
%         EE_pose_input=[EE_pose_input str2double(EE_pose(i,1:n2))];
%     else
%         break
%     end
% end        
%  EE_pose_input =  EE_pose_input(find( ~ isnan( EE_pose_input)));
for i=1:m1
    Theta_input=Theta_group(i,1:n1);
    J0=robot_formular(Theta_input,Delta_a,Delta_d,Alpha_G);
    J=[J; J0];
end
for i=1:m2
    EE_poseinput=[EE_poseinput; (EE_pose(i,1:n2))'];
end
X=J\EE_poseinput
% disp(size(EE_poseinput))
% disp(size(J))
for i=1:(size(X,1)/4)
    X_medium=(X((4*i-3):(4*i),1))';
    X_medium(2)= X_medium(2)*180/pi;
    X_medium(4)= X_medium(4)*180/pi;
    X_output=[X_output; X_medium];
end
set(handles.error_para,'Data',X_output);

% --- Executes during object creation, after setting all properties.
function Error_parameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Error_parameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in EE_pose.
function EE_pose_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to EE_pose (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in error_para.
function error_para_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to error_para (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
