function varargout = add_node(varargin)
% ADD_NODE MATLAB code for add_node.fig
%      ADD_NODE, by itself, creates a new ADD_NODE or raises the existing
%      singleton*.
%
%      H = ADD_NODE returns the handle to a new ADD_NODE or the handle to
%      the existing singleton*.
%
%      ADD_NODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADD_NODE.M with the given input arguments.
%
%      ADD_NODE('Property','Value',...) creates a new ADD_NODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before add_node_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to add_node_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help add_node

% Last Modified by GUIDE v2.5 19-Aug-2011 14:42:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @add_node_OpeningFcn, ...
                   'gui_OutputFcn',  @add_node_OutputFcn, ...
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


% --- Executes just before add_node is made visible.
function add_node_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to add_node (see VARARGIN)

% Choose default command line output for add_node
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes add_node wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = add_node_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global multi_hop_flag

if multi_hop_flag == 1
    set(handles.int_add_nbr, 'Enable', 'on')
else
    set(handles.int_add_nbr, 'Enable', 'off')
end



% --- Executes during object creation, after setting all properties.
function sens_add_nbr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sens_add_nbr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function act_add_nbr_Callback(hObject, eventdata, handles)
% hObject    handle to act_add_nbr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of act_add_nbr as text
%        str2double(get(hObject,'String')) returns contents of act_add_nbr as a double


% --- Executes during object creation, after setting all properties.
function act_add_nbr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to act_add_nbr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function int_add_nbr_Callback(hObject, eventdata, handles)
% hObject    handle to int_add_nbr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of int_add_nbr as text
%        str2double(get(hObject,'String')) returns contents of int_add_nbr as a double


% --- Executes during object creation, after setting all properties.
function int_add_nbr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to int_add_nbr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_node.
function add_node_Callback(hObject, eventdata, handles)
% hObject    handle to add_node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global extra_sens_nbr
global extra_act_nbr
global extra_int_nbr

global sensor_number
global actuator_number
global gateway_num
global intermediate_number

global sensor
global actuator
global wired_actuator_number

global multi_hop_flag

global sensor_source
global sensor_destination

global actuator_source
global actuator_destination

global intermediate_source
global intermediate_destination

global gateway_destination
global gateway_source

global dep_input_output

% read the data
sens_nbr = get(handles.sens_add_nbr, 'String');
if isempty(sens_nbr)
    sens_nbr = '0';
end
extra_sens_nbr = str2num(sens_nbr);

act_nbr = get(handles.act_add_nbr, 'String');
if isempty(act_nbr)
    act_nbr = '0';
end
extra_act_nbr = str2num(act_nbr);

int_nbr = get(handles.int_add_nbr, 'String');
if isempty(int_nbr)
    int_nbr = '0';
end
extra_int_nbr = str2num(int_nbr);

% check if they are not zero
if extra_sens_nbr == 0 & extra_act_nbr == 0 & extra_int_nbr == 0
    errordlg('There is no nodes to add!');
    return;
end

%stores the figure handle of whart 
% we need it to update the data of whart figure
WHARTHandle  = whart; 
WHARTData = guidata(WHARTHandle); 

open_system('WHART_sim');

% add blocks to the model
open_system('whart_lib');

% add sensors
x = -50 + sensor_number * 100;
y = 0 + sensor_number * 100;
for sens = 1 : extra_sens_nbr
    string = strcat('WHART_sim/Sensor', num2str(sens + sensor_number));
    add_block('whart_lib/Sensor', string);
    x = x + 100;
    y = y + 100;
    set_param(string, 'Position', [500 x 550 y]);
end

% add actuators
x = -50 + actuator_number * 100;
y = 0 + actuator_number * 100;
for act = 1 : extra_act_nbr
    string = strcat('WHART_sim/Actuator',num2str(act + actuator_number));
    add_block('whart_lib/Actuator', string);
    x = x + 100;
    y = y + 100;
    set_param(string, 'Position', [150 x 200 y]);
end

% add intermediates
x = -50 + intermediate_number * 100;
y = 0 + intermediate_number * 100;
for int = 1 : extra_int_nbr
    string = strcat('WHART_sim/Intermediate',num2str(int + intermediate_number));
    add_block('whart_lib/Intermediate', string);
    x = x + 100;
    y = y + 100;
    set_param(string, 'Position', [700 x 750 y]);
end

% reset the table of sources and destinations before updating the global
% numbers of devices
if multi_hop_flag == 0
    
    sen_source = find(sensor_source);
    for i = 1 : length(sen_source)
        if sensor_source(sen_source(i)) > sensor_number && sensor_source(sen_source(i)) <= sensor_number + actuator_number
            sensor_source(sen_source(i)) = sensor_source(sen_source(i)) + extra_sens_nbr;
        elseif sensor_source(sen_source(i)) == gateway_num
            sensor_source(sen_source(i)) = sensor_source(sen_source(i)) + extra_sens_nbr + extra_act_nbr;
        end
    end
    
    sen_destination = find(sensor_destination);
    for i = 1 : length(sen_destination)
        if sensor_destination(sen_destination(i)) > sensor_number && sensor_destination(sen_destination(i)) <= sensor_number + actuator_number
            sensor_destination(sen_destination(i)) = sensor_destination(sen_destination(i)) + extra_sens_nbr;
        elseif sensor_destination(sen_destination(i)) == gateway_num
            sensor_destination(sen_destination(i)) = sensor_destination(sen_destination(i)) + extra_sens_nbr + extra_act_nbr;
        end
    end
    
    act_source = find(actuator_source);
    for i = 1 : length(act_source)
        if actuator_source(act_source(i)) > sensor_number && actuator_source(act_source(i)) <= sensor_number + actuator_number
            actuator_source(act_source(i)) = actuator_source(act_source(i)) + extra_sens_nbr;
        elseif actuator_source(act_source(i)) == gateway_num
            actuator_source(act_source(i)) = actuator_source(act_source(i)) + extra_sens_nbr + extra_act_nbr;
        end
    end
    
    act_destination = find(actuator_destination);
    for i = 1 : length(act_destination)
        if actuator_destination(act_destination(i)) > sensor_number && actuator_destination(act_destination(i)) <= sensor_number + actuator_number
            actuator_destination(act_destination(i)) = actuator_destination(act_destination(i)) + extra_sens_nbr;
        elseif actuator_destination(act_destination(i)) == gateway_num
            actuator_destination(act_destination(i)) = actuator_destination(act_destination(i)) + extra_sens_nbr + extra_act_nbr;
        end
    end
    
    gw_source = find(gateway_source);
    for i = 1 : length(gw_source)
        if gateway_source(gw_source(i)) > sensor_number && gateway_source(gw_source(i)) <= sensor_number + actuator_number
            gateway_source(gw_source(i)) = gateway_source(gw_source(i)) + extra_sens_nbr;
        end
    end
    
    gw_destination = find(gateway_destination);
    for i = 1 : length(gw_destination)
        if gateway_destination(gw_destination(i)) > sensor_number && gateway_destination(gw_destination(i)) <= sensor_number + actuator_number
            gateway_destination(gw_destination(i)) = gateway_destination(gw_destination(i)) + extra_sens_nbr;
        end
    end
    
elseif multi_hop_flag == 1
    
    sen_source = find(sensor_source);
    for i = 1 : length(sen_source)
        if sensor_source(sen_source(i)) > sensor_number && sensor_source(sen_source(i)) <= sensor_number + actuator_number
            sensor_source(sen_source(i)) = sensor_source(sen_source(i)) + extra_sens_nbr;
        elseif sensor_source(sen_source(i)) > sensor_number + actuator_number && sensor_source(sen_source(i)) <= sensor_number + actuator_number + intermediate_number
            sensor_source(sen_source(i)) = sensor_source(sen_source(i)) + extra_sens_nbr + extra_act_nbr;
        elseif sensor_source(sen_source(i)) == gateway_num
            sensor_source(sen_source(i)) = sensor_source(sen_source(i)) + extra_sens_nbr + extra_act_nbr + extra_int_nbr;
        end
    end
    
    sen_destination = find(sensor_destination);
    for i = 1 : length(sen_destination)
        if sensor_destination(sen_destination(i)) > sensor_number && sensor_destination(sen_destination(i)) <= sensor_number + actuator_number
            sensor_destination(sen_destination(i)) = sensor_destination(sen_destination(i)) + extra_sens_nbr;
        elseif sensor_destination(sen_destination(i)) > sensor_number + actuator_number && sensor_destination(sen_destination(i)) <= sensor_number + actuator_number + intermediate_number
            sensor_destination(sen_destination(i)) = sensor_destination(sen_destination(i)) + extra_sens_nbr + extra_act_nbr;
        elseif sensor_destination(sen_destination(i)) == gateway_num
            sensor_destination(sen_destination(i)) = sensor_destination(sen_destination(i)) + extra_sens_nbr + extra_act_nbr + extra_int_nbr;
        end
    end
    
    act_source = find(actuator_source);
    for i = 1 : length(act_source)
        if actuator_source(act_source(i)) > sensor_number && actuator_source(act_source(i)) <= sensor_number + actuator_number
            actuator_source(act_source(i)) = actuator_source(act_source(i)) + extra_sens_nbr;
        elseif actuator_source(act_source(i)) > sensor_number + actuator_number && actuator_source(act_source(i)) <= sensor_number + actuator_number + intermediate_number
            actuator_source(act_source(i)) = actuator_source(act_source(i)) + extra_sens_nbr + extra_act_nbr;
        elseif actuator_source(act_source(i)) == gateway_num
            actuator_source(act_source(i)) = actuator_source(act_source(i)) + extra_sens_nbr + extra_act_nbr + extra_int_nbr;
        end
    end
    
    act_destination = find(actuator_destination);
    for i = 1 : length(act_destination)
        if actuator_destination(act_destination(i)) > sensor_number && actuator_destination(act_destination(i)) <= sensor_number + actuator_number
            actuator_destination(act_destination(i)) = actuator_destination(act_destination(i)) + extra_sens_nbr;
        elseif actuator_destination(act_destination(i)) > sensor_number + actuator_number && actuator_destination(act_destination(i)) <= sensor_number + actuator_number + intermediate_number
            actuator_destination(act_destination(i)) = actuator_destination(act_destination(i)) + extra_sens_nbr + extra_act_nbr;
        elseif actuator_destination(act_destination(i)) == gateway_num
            actuator_destination(act_destination(i)) = actuator_destination(act_destination(i)) + extra_sens_nbr + extra_act_nbr + extra_int_nbr;
        end
    end
    
    int_source = find(intermediate_source);
    for i = 1 : length(int_source)
        if intermediate_source(int_source(i)) > sensor_number && intermediate_source(int_source(i)) <= sensor_number + actuator_number
            intermediate_source(int_source(i)) = intermediate_source(int_source(i)) + extra_sens_nbr;
        elseif intermediate_source(int_source(i)) > sensor_number + actuator_number && intermediate_source(int_source(i)) <= sensor_number + actuator_number + intermediate_number
            intermediate_source(int_source(i)) = intermediate_source(int_source(i)) + extra_sens_nbr + extra_act_nbr;
        elseif intermediate_source(int_source(i)) == gateway_num
           intermediate_source(int_source(i)) = intermediate_source(int_source(i)) + extra_sens_nbr + extra_act_nbr + extra_int_nbr;
        end
    end
   
    int_dest = find(intermediate_destination);
    for i = 1 : length(int_dest)
        if intermediate_destination(int_dest(i)) > sensor_number && intermediate_destination(int_dest(i)) <= sensor_number + actuator_number
            intermediate_destination(int_dest(i)) = intermediate_destination(int_dest(i)) + extra_sens_nbr;
        elseif intermediate_destination(int_dest(i)) > sensor_number + actuator_number && intermediate_destination(int_dest(i)) <= sensor_number + actuator_number + intermediate_number
            intermediate_destination(int_dest(i)) = intermediate_destination(int_dest(i)) + extra_sens_nbr + extra_act_nbr;
        elseif intermediate_destination(int_dest(i)) == gateway_num
            intermediate_destination(int_dest(i)) = intermediate_destination(int_dest(i)) + extra_sens_nbr + extra_act_nbr + extra_int_nbr;
        end
    end
    
    gw_source = find(gateway_source);
    for i = 1 : length(gw_source)
        if gateway_source(gw_source(i)) > sensor_number && gateway_source(gw_source(i)) <= sensor_number + actuator_number
            gateway_source(gw_source(i)) = gateway_source(gw_source(i)) + extra_sens_nbr;
        elseif gateway_source(gw_source(i)) > sensor_number + actuator_number && gateway_source(gw_source(i)) <= sensor_number + actuator_number + intermediate_number
            gateway_source(gw_source(i)) = gateway_source(gw_source(i)) + extra_sens_nbr + extra_act_nbr;
        end
    end
    
    gw_destination = find(gateway_destination);
    for i = 1 : length(gw_destination)
        if gateway_destination(gw_destination(i)) > sensor_number && gateway_destination(gw_destination(i)) <= sensor_number + actuator_number
            gateway_destination(gw_destination(i)) = gateway_destination(gw_destination(i)) + extra_sens_nbr;
        elseif gateway_destination(gw_destination(i)) > sensor_number + actuator_number && gateway_destination(gw_destination(i)) <= sensor_number + actuator_number + intermediate_number
            gateway_destination(gw_destination(i)) = gateway_destination(gw_destination(i)) + extra_sens_nbr + extra_act_nbr;
        end
    end
    
end

%before update numerbs delete lines from controller gw connections
reference_line = ['Bus Creator/' num2str(sensor_number+1)];
reference2_line = ['Reference/' num2str(1)];
delete_line('WHART_sim',reference2_line,reference_line);

for i = 1 : sensor_number
    str = ['Demux1/' num2str(i)];
    str2_x = ['Bus Creator/' num2str(i)];
    try
    delete_line('WHART_sim', str, str2_x);
    end
end

for j = 1 : actuator_number+wired_actuator_number
    str_wired= ['Demux2/', num2str(j)];
    str2_pid = ['PID', num2str(j),'/1'];
    try
    delete_line('WHART_sim', str_wired, str2_pid);
    end
end

for j = 1 : actuator_number+wired_actuator_number
    if j > actuator_number
        str2_pid = ['PID', num2str(j),'/1'];
        str2_wired_x = ['Bus Creator2/' num2str(j-actuator_number)];
        try
        delete_line('WHART_sim', str2_pid, str2_wired_x);
        end
    else
        str2_pid = ['PID', num2str(j),'/1'];
        str2_wired_x = ['Bus Creator1/' num2str(j)];
        try
        delete_line('WHART_sim', str2_pid, str2_wired_x);
        end
    end
end

% update the numbers
sensor_number = sensor_number + extra_sens_nbr;
sensor = sensor_number;
set(WHARTData.sensor_number,'String', sensor);
actuator_number = actuator_number + extra_act_nbr;
actuator = actuator_number;
set(WHARTData.actuator_number,'String', actuator_number);
if ~isempty(extra_int_nbr)
    intermediate_number = intermediate_number + extra_int_nbr;
    set(WHARTData.intermediate_number,'String', intermediate_number);
else
    intermediate_number = 0;
end
gateway_num = sensor_number + actuator_number + intermediate_number + 1;

% Set the parameters of sensors and actuators and intermediate nodes
for sens = 1 : sensor_number
    string = ['WHART_sim/Sensor' num2str(sens) '/Sensor'];
    set_param(string, 'args', num2str(sens));
    set_param(string, 'nwnodenbr', num2str(sens));
    set_param(string, 'TimeSlot', ['[' num2str(sens) ']']);
    set_param(string, 'DesAdd', ['[' num2str(gateway_num) ']']);
end

for act = 1 : actuator_number
    string = ['WHART_sim/Actuator' num2str(act) '/Actuator'];
    set_param(string, 'args', num2str(act));
    set_param(string, 'nwnodenbr', num2str(sensor_number + act));
    set_param(string, 'TimeSlot', ['[' num2str(act) ']']);
    set_param(string, 'DesAdd', ['[' num2str(gateway_num) ']']);
end

for int = 1 : intermediate_number
    string = ['WHART_sim/Intermediate' num2str(int) '/Intermediate'];
    set_param(string, 'args', num2str(int));
    set_param(string, 'nwnodenbr', num2str(sensor_number + actuator_number + int));
    set_param(string, 'TimeSlot', ['[' num2str(int) ']']);
    set_param(string, 'DesAdd', ['[' num2str(gateway_num) ']']);
end

number_of_nodes = gateway_num + 1;

% set the parameters of gateway and control block
set_param('WHART_sim/Gateway', 'nwnodenbr', num2str(gateway_num));
set_param('WHART_sim/Control', 'nwnodenbr', num2str(gateway_num + 1));
set_param('WHART_sim/Gateway', 'ninputsoutputs', ['[' num2str(1) ' ' num2str(1) ']']);
set_param('WHART_sim/Control', 'ninputsoutputs', ['[' num2str(2) ' ' num2str(1) ']']);

%set input ouput ports for gw and control blocks as well as muxes and demuxes
set_param('WHART_sim/Gateway', 'ninputsoutputs', ['[' num2str(actuator_number) ' ' num2str(sensor_number) ']']);
set_param('WHART_sim/Control', 'ninputsoutputs', ['[' num2str(sensor_number+1) ' ' num2str(actuator_number+wired_actuator_number) ']']);
% set demax1 for input and output ports
set_param('WHART_sim/Demux1', 'outputs', num2str(sensor_number));
set_param('WHART_sim/Demux2', 'outputs', num2str(actuator_number + wired_actuator_number));

x = 580;
y = 620;
open_system('whart_lib');
for int = 1 : actuator_number + wired_actuator_number
    string = strcat('WHART_sim/PID',num2str(int));
    try 
    add_block('whart_lib/PID Controller', string);
    x = x + 60;
    y = y + 60;
    set_param(string, 'Position', [900 x 940 y]);
    end
end

% set bus creator for input ports
set_param('WHART_sim/Bus Creator', 'inputs', num2str(sensor_number+1));
if actuator_number > 0
    set_param('WHART_sim/Bus Creator1', 'inputs', num2str(actuator_number));
else
    
end


% add line for demux and gwdataof output
for i = 1 : sensor_number
    str = ['Demux1/' num2str(i)];
    str2_x = ['Bus Creator/' num2str(i)];
    add_line('WHART_sim', str, str2_x);
end

for j = 1 : actuator_number+wired_actuator_number
    str_wired= ['Demux2/', num2str(j)];
    str2_pid = ['PID', num2str(j),'/1'];
    add_line('WHART_sim', str_wired, str2_pid);
end

for j = 1 : actuator_number+wired_actuator_number
    if j > actuator_number
        str2_pid = ['PID', num2str(j),'/1'];
        str2_wired_x = ['Bus Creator2/' num2str(j-actuator_number)];
        add_line('WHART_sim', str2_pid, str2_wired_x);
    else
        str2_pid = ['PID', num2str(j),'/1'];
        str2_wired_x = ['Bus Creator1/' num2str(j)];
        add_line('WHART_sim', str2_pid, str2_wired_x);
    end
end

% add line for Reference
reference_line = ['Bus Creator/' num2str(sensor_number+1)];
reference2_line = ['Reference/' num2str(1)];
add_line('WHART_sim',reference2_line,reference_line);

% Set the parameters of network block
set_param('WHART_sim/WHART_NET', 'nnodes', num2str(number_of_nodes));
set_param('WHART_sim/WHART_NET','nbrChannels','1');

% replace the position block with the new one
delete_block('WHART_sim/Position');
add_block('whart_lib/Position', 'WHART_sim/Position');
set_param('WHART_sim/Position', 'Position', [940 165 980 235]);

open_system('WHART_sim/Position');
set_param('WHART_sim/Position/Mux1', 'inputs', num2str(number_of_nodes));
set_param('WHART_sim/Position/Mux2', 'inputs', num2str(number_of_nodes));
set_param('WHART_sim/Position/Mux3', 'inputs', num2str(number_of_nodes));
set_param('WHART_sim/Position/Mux4', 'inputs', num2str(number_of_nodes));

% Add the x, y, z positions for sensors
x = -30;
y = 0;
for i = 1 : sensor_number
    string_x = strcat('WHART_sim/Position/S', num2str(i), 'X');
    string_y = strcat('WHART_sim/Position/S', num2str(i), 'Y');
    string_z = strcat('WHART_sim/Position/S', num2str(i), 'Z');
    add_block('whart_lib/Constant', string_x);
    add_block('whart_lib/Constant', string_y);
    add_block('whart_lib/Constant', string_z);
    x = x + 40;
    y = y + 40;
    set_param(string_x, 'Position', [50 x 80 y]);
    set_param(string_y, 'Position', [300 x 330 y]);
    set_param(string_z, 'Position', [550 x 580 y]);
    set_param(string_x,'Value',num2str(i));
    set_param(string_y,'Value',num2str(i));
    set_param(string_z,'Value',num2str(i));
end

% Add the x, y, z positions for actuators
for j = 1 : actuator_number
    string_x = strcat('WHART_sim/Position/A', num2str(j), 'X');
    string_y = strcat('WHART_sim/Position/A', num2str(j), 'Y');
    string_z = strcat('WHART_sim/Position/A', num2str(j), 'Z');
    add_block('whart_lib/Constant', string_x);
    add_block('whart_lib/Constant', string_y);
    add_block('whart_lib/Constant', string_z);
    x = x + 40;
    y = y + 40;
    set_param(string_x, 'Position', [50 x 80 y]);
    set_param(string_y, 'Position', [300 x 330 y]);
    set_param(string_z, 'Position', [550 x 580 y]);
    set_param(string_x,'Value',num2str(j + sensor_number));
    set_param(string_y,'Value',num2str(j + sensor_number));
    set_param(string_z,'Value',num2str(j + sensor_number));
end

% Add the x, y, z positions for intermediate nodes
for k = 1 : intermediate_number
    string_x = strcat('WHART_sim/Position/I', num2str(k), 'X');
    string_y = strcat('WHART_sim/Position/I', num2str(k), 'Y');
    string_z = strcat('WHART_sim/Position/I', num2str(k), 'Z');
    add_block('whart_lib/Constant', string_x);
    add_block('whart_lib/Constant', string_y);
    add_block('whart_lib/Constant', string_z);
    x = x + 40;
    y = y + 40;
    set_param(string_x, 'Position', [50 x 80 y]);
    set_param(string_y, 'Position', [300 x 330 y]);
    set_param(string_z, 'Position', [550 x 580 y]);
    set_param(string_x,'Value',num2str(k + sensor_number + actuator_number));
    set_param(string_y,'Value',num2str(k + sensor_number + actuator_number));
    set_param(string_z,'Value',num2str(k + sensor_number + actuator_number));
end

% Add the x, y, z positions for gateway
x = x + 40;
y = y + 40;
add_block('whart_lib/Constant', 'WHART_sim/Position/GX');
set_param('WHART_sim/Position/GX', 'Position', [50 x 80 y]);
add_block('whart_lib/Constant', 'WHART_sim/Position/GY');
set_param('WHART_sim/Position/GY', 'Position', [300 x 330 y]);
add_block('whart_lib/Constant', 'WHART_sim/Position/GZ');
set_param('WHART_sim/Position/GZ', 'Position', [550 x 580 y]);
set_param('WHART_sim/Position/GX', 'Value', num2str(gateway_num));
set_param('WHART_sim/Position/GY', 'Value', num2str(gateway_num));
set_param('WHART_sim/Position/GZ', 'Value', num2str(gateway_num));

% Add the x, y, z positions for control
x = x + 40;
y = y + 40;
add_block('whart_lib/Constant', 'WHART_sim/Position/CX');
set_param('WHART_sim/Position/CX', 'Position', [50 x 80 y]);
add_block('whart_lib/Constant', 'WHART_sim/Position/CY');
set_param('WHART_sim/Position/CY', 'Position', [300 x 330 y]);
add_block('whart_lib/Constant', 'WHART_sim/Position/CZ');
set_param('WHART_sim/Position/CZ', 'Position', [550 x 580 y]);
set_param('WHART_sim/Position/CX', 'Value', num2str(gateway_num + 1));
set_param('WHART_sim/Position/CY', 'Value', num2str(gateway_num + 1));
set_param('WHART_sim/Position/CZ', 'Value', num2str(gateway_num + 1));

% add lines of positions for sensors
for i = 1 : sensor_number
    str1_x = ['S' num2str(i) 'X' '/1'];
    str2_x = ['Mux1/' num2str(i)];
    add_line('WHART_sim/Position', str1_x, str2_x);
    str1_y = ['S' num2str(i) 'Y' '/1'];
    str2_y = ['Mux2/' num2str(i)];
    add_line('WHART_sim/Position', str1_y, str2_y);
    str1_z = ['S' num2str(i) 'Z' '/1'];
    str2_z = ['Mux3/' num2str(i)];
    add_line('WHART_sim/Position', str1_z, str2_z);
end

% add lines of positions for actuators
for k = 1 : actuator_number
    str1_x = ['A' num2str(k) 'X' '/1'];
    str2_x = ['Mux1/' num2str(k + sensor_number)];
    add_line('WHART_sim/Position', str1_x, str2_x);
    str1_y = ['A' num2str(k) 'Y' '/1'];
    str2_y = ['Mux2/' num2str(k + sensor_number)];
    add_line('WHART_sim/Position', str1_y, str2_y);
    str1_z = ['A' num2str(k) 'Z' '/1'];
    str2_z = ['Mux3/' num2str(k + sensor_number)];
    add_line('WHART_sim/Position', str1_z, str2_z);
end

% add lines of positions for intermediate nodes
for j = 1 : intermediate_number
    str1_x = ['I' num2str(j) 'X' '/1'];
    str2_x = ['Mux1/' num2str(j + sensor_number + actuator_number)];
    add_line('WHART_sim/Position', str1_x, str2_x);
    str1_y = ['I' num2str(j) 'Y' '/1'];
    str2_y = ['Mux2/' num2str(j + sensor_number + actuator_number)];
    add_line('WHART_sim/Position', str1_y, str2_y);
    str1_z = ['I' num2str(j) 'Z' '/1'];
    str2_z = ['Mux3/' num2str(j + sensor_number + actuator_number)];
    add_line('WHART_sim/Position', str1_z, str2_z);
end

% add lines of positions for gateway
str = ['Mux1/' num2str(sensor_number + actuator_number + intermediate_number +1)];
add_line('WHART_sim/Position', 'GX/1', str);
str = ['Mux2/' num2str(sensor_number + actuator_number + intermediate_number + 1)];
add_line('WHART_sim/Position', 'GY/1', str);
str = ['Mux3/' num2str(sensor_number + actuator_number + intermediate_number + 1)];
add_line('WHART_sim/Position', 'GZ/1', str);

% add lines of positions for control
str = ['Mux1/' num2str(sensor_number + actuator_number + intermediate_number + 2)];
add_line('WHART_sim/Position', 'CX/1', str);
str = ['Mux2/' num2str(sensor_number + actuator_number + intermediate_number + 2)];
add_line('WHART_sim/Position', 'CY/1', str);
str = ['Mux3/' num2str(sensor_number + actuator_number + intermediate_number + 2)];
add_line('WHART_sim/Position', 'CZ/1', str);

% add noise parameters
add_block('whart_lib/Constant', 'WHART_sim/Position/N');
set_param('WHART_sim/Position/N','Value','0');
set_param('WHART_sim/Position/N', 'Position', [800 200 830 230]);
for n = 1 : number_of_nodes
    string = ['Mux4/' num2str(n)];
    add_line('WHART_sim/Position', 'N/1', string);
end

save_system('WHART_sim');
close_system('whart_lib');
close_system('WHART_sim/Position');

% initialize the dependecy input and sensor popup menu in sensor properties
dependency_input = cell(1,sensor_number);
for i = 1:sensor_number
    dependency_input{i} = strcat('S',num2str(i));
end;
set(WHARTData.ctrl_input,'String',dependency_input');

set(WHARTData.sensor,'Value',1);
Z = ones(1,sensor_number);
for i = 1:sensor_number
    Z(i)=i;
end
set(WHARTData.sensor,'String',{Z'}) ;

% initialize the dependency output and actuator popup menu in actuator
% properties
dependency_outputs = cell(1,actuator_number + wired_actuator_number);
for i = 1:actuator_number + wired_actuator_number
    if i<=actuator_number
        dependency_outputs{i} = strcat('A',num2str(i));
    else
        dependency_outputs{i} = strcat('WA',num2str(i));
    end
end
set(WHARTData.ctrl_output,'String',dependency_outputs');

set(WHARTData.actuator,'Value',1);
Z = ones(1,actuator_number);
for i = 1:actuator_number
    Z(i)=i;
end
set(WHARTData.actuator,'String',{Z'}) ;

% set the dep input output matrix
dep_input_output(sensor_number, actuator_number + wired_actuator_number) = 0;

% initialize the intermediate node
if intermediate_number > 0
    set(WHARTData.intermediate_node,'Value',1);
    Z = ones(1,intermediate_number);
    for i = 1:intermediate_number
        Z(i)=i;
    end
    set(WHARTData.intermediate_node,'String',{Z'}) ;
end

% initialize the sensor "to node" and actuator "from node" in case of multi hop
if multi_hop_flag == 1
    to_node = cell(1, sensor_number + actuator_number + intermediate_number + 1);
    for i = 1:sensor_number
        to_node{i} = strcat('S',num2str(i));
    end
    for j = 1 + sensor_number : actuator_number + sensor_number
        to_node{j} = strcat('A',num2str(j - sensor_number));
    end
    for k = 1 + sensor_number + actuator_number : intermediate_number + actuator_number + sensor_number
        to_node{k} = strcat('I',num2str(k - sensor_number - actuator_number));
    end
    to_node{intermediate_number + actuator_number + sensor_number + 1} = 'GW';
    set(WHARTData.sens_to_node,'String',to_node');
    set(WHARTData.act_from_node,'String',to_node');
end

% initialize Gateway Panel ToNode and Actuator Data dropdown lists
if multi_hop_flag == 1
     to_node_1 = cell(1, sensor_number + actuator_number + intermediate_number);
    for s = 1:sensor_number
        to_node_1{s} = strcat('S',num2str(s));
    end
    for b = 1 + sensor_number : actuator_number + sensor_number
        to_node_1{b} = strcat('A',num2str(b - sensor_number));
    end
    for c = 1 + sensor_number + actuator_number : intermediate_number + actuator_number + sensor_number
        to_node_1{c} = strcat('I',num2str(c - sensor_number - actuator_number));
    end
    set(WHARTData.gwto,'Value',1);
    set(WHARTData.gwto,'String',to_node_1');
    
    % gwdataof property (data of ...)
    
    dataof_node = cell(1, actuator_number);
    
    for dataof = 1 : actuator_number
        dataof_node{dataof} = strcat('A',num2str(dataof));
        
    end
    set(WHARTData.gwdataof,'Value',1);
    set(WHARTData.gwdataof,'String',dataof_node');
end

close(add_node);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

global extra_sens_nbr
global extra_act_nbr
global extra_int_nbr

extra_sens_nbr = 0;
extra_act_nbr = 0;
extra_int_nbr = 0;
