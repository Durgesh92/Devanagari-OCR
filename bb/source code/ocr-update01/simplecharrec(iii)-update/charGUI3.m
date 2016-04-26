function varargout = charGUI2(varargin)
% CHARGUI2 M-file for charGUI2.fig
%      CHARGUI2, by itself, creates a new CHARGUI2 or raises the existing
%      singleton*.
%
%      H = CHARGUI2 returns the handle to a new CHARGUI2 or the handle to
%      the existing singleton*.
%
%      CHARGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHARGUI2.M with the given input arguments.
%
%      CHARGUI2('Property','Value',...) creates a new CHARGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before charGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to charGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help charGUI2

% Last Modified by GUIDE v2.5 03-Jul-2008 17:55:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @charGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @charGUI2_OutputFcn, ...
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


% --- Executes just before charGUI2 is made visible.
function charGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to charGUI2 (see VARARGIN)
%%%load data;
%%%assignin('base','net',net);
% Choose default command line output for charGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes charGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = charGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbLoad.
function pbLoad_Callback(hObject, eventdata, handles)
% hObject    handle to pbLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*gif';'*.bmp';'*.*'}, 'Pick an Image File');
S = imread([pathname,filename]);
axes(handles.axes1);
imshow(S);

handles.S = S;
guidata(hObject, handles);


% --- Executes on button press in pbSelect.
function pbSelect_Callback(hObject, eventdata, handles)
% hObject    handle to pbSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S = handles.S;
axes(handles.axes1);

% Selection of location
if isfield(handles,'api')
    handles.api.delete();
    rmfield(handles,'api');
    rmfield(handles,'hRect');
    axes(handles.axes1);
    imshow(S);
end

axes(handles.axes1);
sz = size(S);
handles.hRect = imrect(gca,[round(sz(2)/2) round(sz(2)/2) 20 20]); % Select object
handles.api = iptgetapi(handles.hRect);
guidata(hObject, handles);


% img_crop = imcrop(S);
% axes(handles.axes2);
% imshow(img_crop);
% 
% handles.img_crop = img_crop;

guidata(hObject, handles);




% --- Executes on button press in pbCrop.
function pbCrop_Callback(hObject, eventdata, handles)
% hObject    handle to pbCrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.loc = handles.api.getPosition();
axes(handles.axes1);
S = handles.S;

handles.img_crop = imcrop(S,handles.loc);
axes(handles.axes2);
imshow(handles.img_crop);

% img_crop = imcrop(S);
% axes(handles.axes2);
% imshow(img_crop);
% 
% handles.img_crop = img_crop;


guidata(hObject, handles);

% --- Executes on button press in pbPreprocess.
function pbPreprocess_Callback(hObject, eventdata, handles)
% hObject    handle to pbPreprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img_crop = handles.img_crop;
imgGray = rgb2gray(img_crop);
bwa= im2bw(img_crop,graythresh(imgGray));
%bw=imresize(bwa,[42 42])
%bw=imresize((edu_imgcrop(bwa)),[50 50]);
axes(handles.axes3);
imshow(bwa);
%bw2 = edu_imgcrop(bw);
bw2=imresize((edu_imgcrop(bwa)),[50 50]);
%bw2 = bw;
axes(handles.axes4);
imshow(bw2);
handles.bw2 = bw2;
guidata(hObject, handles);


% --- Executes on button press in pbExtract.
function pbExtract_Callback(hObject, eventdata, handles)
% hObject    handle to pbExtract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw2  = handles.bw2;
charvec = edu_imgresize(bw2);
axes(handles.axes5);
%charvec=imresize(charvec1,[42 42]);
plotchar(charvec);
handles.charvec = charvec;
guidata(hObject, handles);

% --- Executes on button press in pbRecognize.
function pbRecognize_Callback(hObject, eventdata, handles)
% hObject    handle to pbRecognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
charvec = handles.charvec;
bw2 = handles.bw2;
%%%%%%%% CHARACTER RECOGNITION USING BACK PROPAGATION ALGORITHM %%%%%%%%%

%%%%%%%%%%%%%%% Code Starts%%%%%%%%%%%%%%%%%%%
%%%%%%%% CHARACTER RECOGNITION USING BACK PROPAGATION ALGORITHM %%%%%%%%%

%%%%%%%%%%%%%%% Code Starts%%%%%%%%%%%%%%%%%%%
%clear all;clc;

i1=imresize((edu_imgcrop(imread('s1.bmp'))),[50 50]);

i2=imresize((edu_imgcrop(imread('s2.bmp'))),[50 50]);

i3=imresize((edu_imgcrop(imread('s3.bmp'))),[50 50]);

i4=imresize((edu_imgcrop(imread('s4.bmp'))),[50 50]);

i5=imresize((edu_imgcrop(imread('s5.bmp'))),[50 50]);

i6=imresize((edu_imgcrop(imread('s6.bmp'))),[50 50]);

i7=imresize((edu_imgcrop(imread('s7.bmp'))),[50 50]);

i8=imresize((edu_imgcrop(imread('s8.bmp'))),[50 50]);

i9=imresize((edu_imgcrop(imread('s9.bmp'))),[50 50]);

i10=imresize((edu_imgcrop(imread('s10.bmp'))),[50 50]);

i11=imresize((edu_imgcrop(imread('s11.bmp'))),[50 50]);

i12=imresize((edu_imgcrop(imread('s12.bmp'))),[50 50]);

i13=imresize((edu_imgcrop(imread('s13.bmp'))),[50 50]);

i14=imresize((edu_imgcrop(imread('s14.bmp'))),[50 50]);

i15=imresize((edu_imgcrop(imread('s15.bmp'))),[50 50]);

i16=imresize((edu_imgcrop(imread('s16.bmp'))),[50 50]);

i17=imresize((edu_imgcrop(imread('s17.bmp'))),[50 50]);

i18=imresize((edu_imgcrop(imread('s18.bmp'))),[50 50]);

i19=imresize((edu_imgcrop(imread('s19.bmp'))),[50 50]);

i20=imresize((edu_imgcrop(imread('s20.bmp'))),[50 50]);




s1=[]
for i=1:50
    for j=1:50
        s1=[s1;i1(i,j)];
    end
end

s2=[]
for i=1:50
    for j=1:50
        s2=[s2;i2(i,j)];
    end
end

s3=[]
for i=1:50
    for j=1:50
        s3=[s3;i3(i,j)];
    end
end

s4=[]
for i=1:50
    for j=1:50
        s4=[s4;i4(i,j)];
    end
end

s5=[]
for i=1:50
    for j=1:50
        s5=[s5;i5(i,j)];
    end
end

s6=[]
for i=1:50
    for j=1:50
        s6=[s6;i6(i,j)];
    end
end

s7=[]
for i=1:50
    for j=1:50
        s7=[s7;i7(i,j)];
    end
end

s8=[]
for i=1:50
    for j=1:50
        s8=[s8;i8(i,j)];
    end
end

s9=[]
for i=1:50
    for j=1:50
        s9=[s9;i9(i,j)];
    end
end

s10=[]
for i=1:50
    for j=1:50
        s10=[s10;i10(i,j)];
    end
end
s11=[]
for i=1:50
    for j=1:50
        s11=[s11;i11(i,j)];
    end
end
s12=[]
for i=1:50
    for j=1:50
        s12=[s12;i12(i,j)];
    end
end
s13=[]
for i=1:50
    for j=1:50
        s13=[s13;i13(i,j)];
    end
end
s14=[]
for i=1:50
    for j=1:50
        s14=[s14;i14(i,j)];
    end
end
s15=[]
for i=1:50
    for j=1:50
        s15=[s15;i15(i,j)];
    end
end
s16=[]
for i=1:50
    for j=1:50
        s16=[s16;i16(i,j)];
    end
end
s17=[]
for i=1:50
    for j=1:50
        s17=[s17;i17(i,j)];
    end
end
s18=[]
for i=1:50
    for j=1:50
        s18=[s18;i18(i,j)];
    end
end

s19=[]
for i=1:50
    for j=1:50
        s19=[s19;i19(i,j)];
    end
end
s20=[]
for i=1:50
    for j=1:50
        s20=[s20;i20(i,j)];
    end
end

%s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,s51,s52,s53,s54,s55,s56,s57
le=[s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20];
t=eye(20);
%net=newff(minmax(le),[40,20],{'tansig','purelin'},'traingd');
%net.trainParam.epochs = 10000;
%net.performFcn='msereg'; net.performParam.ratio=0.5; 
%net.trainParam.goal=0.001;
%net.trainParam.mem_reduc=2;  
%net.trainParam.lr=0.01;
%net.trainParam.mc=0.1
%net = train(net,le,t);
%Y = sim(net,le);
net = newff(minmax(le),[40 20],{'logsig' 'logsig'},'traingdx');
net.LW{2,1} = net.LW{2,1}*0.01;
net.b{2} = net.b{2}*0.01;
net.performFcn = 'sse';         
net.trainParam.goal = 0.001;    
net.trainParam.show = 20;      
net.trainParam.epochs = 10000;  
net.trainParam.mc = 0.95;  
net.trainParam.mc=0.1
net = train(net,le,t);
Y = sim(net,le);
cor=0;
for i=1:50
    max=1;
    for j=1:50
        if Y(j,i)>Y(max,i)
            max=i;
        end
    end
    if max==i
        cor=cor+1;
    end
end

'Train Cases Recognized'
cor

'Train Cases Recognition Accuracy'
%cor/10*100

% Test Image
%a=imresize((edu_imgcrop(imread('7.bmp'))),[50 50]);
a=bw2
%a=imresize(charvec,[50 50]);
a1=[];
for i=1:50
    for j=1:50
        a1=[a1;a(i,j)];
    end
end
a2=sim(net,a1);

'Output vector for test image'
a2
max=1;
for j=1:20
    if a2(j)>a2(max)
        max=j;
    %    x=j;
    end
   
           
end

'test image output'
max

 if max==1      
 fid = fopen('s1.txt', 'r');
    fclose(fid)
   winopen('s1.txt')
 end

 if max==2     
 fid = fopen('s1.txt', 'r');
    fclose(fid)
   winopen('s1.txt')
 end

 if max==3      
 fid = fopen('s1.txt', 'r');
    fclose(fid)
   winopen('s1.txt')
 end

 if max==4     
 fid = fopen('s1.txt', 'r');
    fclose(fid)
   winopen('s1.txt')
 end

 if max==5     
 fid = fopen('s2.txt', 'r');
    fclose(fid)
   winopen('s2.txt')
 end

 if max==6      
 fid = fopen('s2.txt', 'r');
    fclose(fid)
   winopen('s2.txt')
 end

 if max==7    
 fid = fopen('s2.txt', 'r');
    fclose(fid)
   winopen('s2.txt')
 end

 if max==8    
 fid = fopen('s2.txt', 'r');
    fclose(fid)
   winopen('s2.txt')
 end

 if max==9      
 fid = fopen('s3.txt', 'r');
    fclose(fid)
   winopen('s3.txt')
 end

 if max==10     
 fid = fopen('s3.txt', 'r');
    fclose(fid)
   winopen('s3.txt')
 end

 if max==11      
 fid = fopen('s3.txt', 'r');
    fclose(fid)
   winopen('s3.txt')
 end

 if max==12      
 fid = fopen('s3.txt', 'r');
    fclose(fid)
   winopen('s3.txt')
 end

 if max==13      
 fid = fopen('s4.txt', 'r');
    fclose(fid)
   winopen('s4.txt')
 end

 if max==14      
 fid = fopen('s4.txt', 'r');
    fclose(fid)
   winopen('s4.txt')
 end

 if max==15      
 fid = fopen('s4.txt', 'r');
    fclose(fid)
   winopen('s4.txt')
 end

 if max==16      
 fid = fopen('s4.txt', 'r');
    fclose(fid)
   winopen('s4.txt')
 end

 
 
 

       

 

       

%set(handles.editResult, 'string',max);


% --- Executes on button press in pbNN.
function pbNN_Callback(hObject, eventdata, handles)
% hObject    handle to pbNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function editNN_Callback(hObject, eventdata, handles)
% hObject    handle to editNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNN as text
%        str2double(get(hObject,'String')) returns contents of editNN as a double


% --- Executes during object creation, after setting all properties.
function editNN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function editResult_Callback(hObject, eventdata, handles)
% hObject    handle to editResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editResult as text
%        str2double(get(hObject,'String')) returns contents of editResult as a double


% --- Executes during object creation, after setting all properties.
function editResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


