// This GUI file is generated by guibuilder version 3.0
//////////
function cmd_arduino_meter(val)
// GUI to display continuous signal from a loop, and break the loop after termination of the GUI
//
// Calling Sequence
//     cmd_arduino_meter(val)
//
// Parameters
//     val : Value to be displayed
//
// Description
//     This GUI provides a convenient way display a continuous data from a loop and break the loop after the termination of the GUI. By this, it behave like a digital meter by showing the data in a GUI instead of the console
//  
// Examples
//    ok = open_serial(1,9,115200) 
//    val = cmd_analog_in_volt(1,9)
//    cmd_arduino_meter(val)
//    close_serial(1)
// 
// See also
//    cmd_arduino_d_control
//    cmd_arduino_a_control
//
// Authors
//     Bruno JOFRET 
//    

    str = string(val);
    f = findobj('figure_name','Arduino Meter');
    if isempty(f) then
        f=figure('figure_position',[128,41],'figure_size',[300,300],'auto_resize','on','background',[33],'figure_name','Arduino Meter',"visible", "off",...
        "dockable", "off", ...
        "infobar_visible", "off", ...
        "toolbar_visible", "off", ...
        "menubar_visible", "off", ...
        "default_axes", "off");

        pbStop=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3159509,0.16,0.3619632,0.2],'Relief','default','SliderStep',[0.01,0.1],'String','Stop','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbStop','Callback','pbStop_callback()')
        txtResult=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[24],'FontUnits','points','FontWeight','bold','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3190184,0.565,0.3527607,0.19],'Relief','default','SliderStep',[0.01,0.1],'String',str,'Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','txtResult','Callback','')
        
    else
        pbStop = findobj('Tag','pbStop');
        txtResult = findobj('Tag','txtResult');
   
        
    end
    set(txtResult,'string',str);
f.visible = "on";
    endfunction
    

    function pbStop_callback()
        
          close();
        abort;
      

    endfunction



