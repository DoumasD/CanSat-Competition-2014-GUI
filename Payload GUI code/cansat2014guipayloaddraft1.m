% Demetrios Doumas Lead Ground Station Programmer   1/24/14

function varargout = cansat2014guidraft1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cansat2014guidraft1_OpeningFcn, ...
                   'gui_OutputFcn',  @cansat2014guidraft1_OutputFcn, ...
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

function cansat2014guidraft1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);



function varargout = cansat2014guidraft1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushb_Callback(hObject, eventdata, handles)
global s;
startplot=0;
            
if (get(hObject,'Value'))
    
    set(handles.pushb, 'String', 'Stop Plot');
    startplot = 1;
   
    
else
    try
    set(handles.pushb, 'String', 'Start Plot');
    delete(instrfindall) % delete all the hidden serial ports
    catch jk
        fclose('all');
        fclose(s);
        delete(s)
        clear s
    end

    
end

    

    
if (startplot==1)   

time_arrayalt=[];
time_arrayvolt=[];
time_arraytemp=[];
time_arraypre=[];
time_Xarray=[];
time_Yarray=[];
time_Zarray=[];
temp_array=[];
altitude_array=[];
pressure_array=[];
volt_array=[];
X_array=[];
Y_array=[];
Z_array=[];

% first index
i=1;
g=1;
h=1;
L=1;

K=1;
G=1;
P=1;


indexnum=20; % this gives the length for the array


dlim=',';
TEAM_ID='1957';

fopen(s);% Open serial port
set(s,'ReadAsyncMode','continuous');% read from the port continuous



        try

            while(1)

            pause(.25);

             dstring=fscanf(s);

                    [token, dstring] = strtok(dstring, dlim);
                    TEAM=token; % stores the team id  string
                    if (strcmp(token ,TEAM_ID)==1)
                     
                        [token, dstring] = strtok(dstring, dlim);
                        Packet_Count=str2num(token); % stores Packet-count
                        set(handles.packcount,'string',token); 
                        [token, dstring] = strtok(dstring, dlim);
                        mission_time=str2num(token); % stores mission_time
                        set(handles.time,'string',token);
                        [token, dstring] = strtok(dstring, dlim);
                        %%%%%%%%
                        Alt_sensor=str2num(token);
                        set(handles.text11,'string',Alt_sensor);


                        %Altitude_sensor_CreateFcn(mission_time,Alt_sensor)
                        % converts the arrays into a cell
                          time_arrayalt={time_arrayalt}; 
                          altitude_array={altitude_array};
                        if i<=indexnum
                          time_arrayalt{i}=mission_time;
                          altitude_array{i}=Alt_sensor;
                          i=i+1;   
                        else
                            i=1;
                        end

                        % converts to the cell array into math
                        time_arrayalt=cell2mat(time_arrayalt);
                        altitude_array=cell2mat(altitude_array);

                        plot(handles.Altitude_sensor,time_arrayalt,altitude_array,'-or','MarkerSize',5);

                        set(get(handles.Altitude_sensor,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.Altitude_sensor,'Ylabel'),'String','Altitude(m)','color','w')
                        set(get(handles.Altitude_sensor,'Title'),'String','Altitude V.S. Time','color','w')
                        set(handles.Altitude_sensor,'Xcolor','w')
                        set(handles.Altitude_sensor,'Ycolor','w')
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [token, dstring] = strtok(dstring, dlim);
                        temp=str2num(token);
                        set(handles.text12,'string',temp);
                        
                           
                        % converts the arrays into a cell
                          time_arraytemp={time_arraytemp}; 
                          temp_array={temp_array};

                          if g<=indexnum
                          time_arraytemp{g}=mission_time;
                          temp_array{g}=temp;
                          g=g+1;   
                          else
                            g=1;
                          end

                         time_arraytemp=cell2mat(time_arraytemp);
                         temp_array=cell2mat(temp_array);

                        plot(handles.Temperature,time_arraytemp,temp_array,'-og','MarkerSize',5);

                        set(get(handles.Temperature,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.Temperature,'Ylabel'),'String','Temperature(C)','color','w')
                        set(get(handles.Temperature,'Title'),'String','Temperature V.S. Time','color','w')        
                        set(handles.Temperature,'Xcolor','w')
                        set(handles.Temperature,'Ycolor','w')

                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [token, dstring] = strtok(dstring, dlim);
                        voltage=str2num(token);                
                         set(handles.text13,'string',voltage);
                         
                          % converts the arrays into a cell
                          time_arrayvolt={time_arrayvolt}; 
                          volt_array={volt_array};


                         if h<=indexnum
                          time_arrayvolt{h}=mission_time;
                          volt_array{h}=voltage;
                          h=h+1;   
                          else
                          h=1;
                         end
                         time_arrayvolt=cell2mat(time_arrayvolt);
                         volt_array=cell2mat(volt_array);

                        plot(handles.Voltage,time_arrayvolt,volt_array,'-oc','MarkerSize',5);

                        set(get(handles.Voltage,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.Voltage,'Ylabel'),'String','Voltage(v)','color','w')
                        set(get(handles.Voltage,'Title'),'String','Voltage V.S. Time','color','w')
                        set(handles.Voltage,'Xcolor','w')
                        set(handles.Voltage,'Ycolor','w')

                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [token, dstring] = strtok(dstring, dlim);
                        pressure=str2num(token);
                        set(handles.text19,'string',pressure);
                        
                         time_arraypre={time_arraypre}; 
                         pressure_array={pressure_array};

                        if L<=indexnum
                          time_arraypre{L}=mission_time;
                          pressure_array{L}=pressure;
                          L=L+1;   
                          else
                            L=1;
                         end
                         time_arraypre=cell2mat(time_arraypre);
                         pressure_array=cell2mat(pressure_array);

                        plot(handles.Pressure,time_arraypre,pressure_array,'-om','MarkerSize',5);

                        set(get(handles.Pressure,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.Pressure,'Ylabel'),'String','Pressure(Pa)','color','w')
                        set(get(handles.Pressure,'Title'),'String','Pressure V.S. Time','color','w')
                        set(handles.Pressure,'Xcolor','w')
                        set(handles.Pressure,'Ycolor','w')

                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [token, dstring] = strtok(dstring, dlim);
                         x=str2num(token);
                         set(handles.text25,'string',x);
                         
                          time_Xarray={time_Xarray}; 
                          X_array={X_array};

                        if K<=indexnum
                          time_Xarray{K}=mission_time;
                          X_array{K}=x;
                          K=K+1;   
                          else
                            K=1;
                         end
                         time_Xarray=cell2mat(time_Xarray);
                         X_array=cell2mat(X_array);

                        plot(handles.X,time_Xarray, X_array,'-om','MarkerSize',5);

                        set(get(handles.X,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.X,'Ylabel'),'String','X-Acceleration(Gs)','color','w')
                        set(get(handles.X,'Title'),'String','X-Acceleration V.S. Time','color','w')
                        set(handles.X,'Xcolor','w')
                        set(handles.X,'Ycolor','w')
                        
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [token, dstring] = strtok(dstring, dlim);
                         y=str2num(token);
                         set(handles.text26,'string',y);
                         
                         
                          time_Yarray={time_Yarray}; 
                          Y_array={Y_array};

                        if G<=indexnum
                          time_Yarray{G}=mission_time;
                          Y_array{G}=y;
                          G=G+1;   
                          else
                            G=1;
                         end
                         time_Yarray=cell2mat(time_Yarray);
                         Y_array=cell2mat(Y_array);

                        plot(handles.Y,time_Yarray, Y_array,'-om','MarkerSize',5);

                        set(get(handles.Y,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.Y,'Ylabel'),'String','Y-Acceleration(Gs)','color','w')
                        set(get(handles.Y,'Title'),'String','Y-Acceleration V.S. Time','color','w')
                        set(handles.Y,'Xcolor','w')
                        set(handles.Y,'Ycolor','w')
                         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [token, dstring] = strtok(dstring, dlim);
                         z=str2num(token);
                         set(handles.text27,'string',z);
                        
                         
                          time_Zarray={time_Zarray}; 
                          Z_array={Z_array};

                        if P<=indexnum
                          time_Zarray{P}=mission_time;
                          Z_array{P}=z;
                          P=P+1;   
                          else
                            P=1;
                         end
                         time_Zarray=cell2mat(time_Zarray);
                         Z_array=cell2mat(Z_array);

                        plot(handles.Z,time_Zarray, Z_array,'-om','MarkerSize',5);
                        set(get(handles.Z,'Xlabel'),'String','Time(seconds)','color','w')
                        set(get(handles.Z,'Ylabel'),'String','Z-Acceleration(Gs)','color','w')
                        set(get(handles.Z,'Title'),'String','Z-Acceleration V.S. Time','color','w')
                        set(handles.Z,'Xcolor','w')
                        set(handles.Z,'Ycolor','w')
                        
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %Saving Data to excel
                        % format spec %s string %g remove trialing zeros
                        % fopen 'a' create a new file
                        fileID=fopen('CANSAT2014_TLM_1957_Venera.csv','a');
                        fprintf(fileID,'%s, ',TEAM);
                        fprintf(fileID,'%f, ',Packet_Count, mission_time, Alt_sensor,temp, voltage ,pressure, x, y, z);
                        fprintf(fileID, '\n');
                        fclose(fileID);             


                    else
                        continue;
                    end

            end 




        catch skiperrors
        return;
        end

       
 
    
    
    
end


function popupmenu2_Callback(hObject, eventdata, handles)
global s;
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string = string_list{val}; % convert from cell array to 
s=serial(selected_string, 'BaudRate', 9600,'ReadAsyncMode','continuous');
set(handles.text7, 'String', selected_string);


function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function axes21_CreateFcn(hObject, eventdata, handles)
rgb = imread('backgroundimage.jpg');
image(rgb, 'XData', [0 .1], 'YData', [0 .1])
set(gca,'xcolor',get(gcf,'color'));
set(gca,'ycolor',get(gcf,'color'));
set(gca,'ytick',[]);
set(gca,'xtick',[]);



function axes22_CreateFcn(hObject, eventdata, handles)
rgb = imread('Clublogo.jpg');
image(rgb, 'XData', [0 .1], 'YData', [0 .1])
set(gca,'xcolor',get(gcf,'color'));
set(gca,'ycolor',get(gcf,'color'));
set(gca,'ytick',[]);
set(gca,'xtick',[]);
