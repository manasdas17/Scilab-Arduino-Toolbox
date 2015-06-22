//
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010-2010 - DIGITEO - 
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//



function []=init_arduino(scs_m, needcompile)
    disp("Initialisation Arduino..."); 
    scs=[]
    scs=scs_m;
    objs = scs_m.objs;
    nombre_blocs=0;    
    nombre_liens=0;    
    nb_arduino=0; 
    port_com_arduino=[];    
    
    
    list_arduino_gui=["ARDUINO_DIGITAL_WRITE","ARDUINO_DIGITAL_READ","ARDUINO_ANALOG_WRITE","ARDUINO_ANALOG_READ","ARDUINO_DCMOTOR","ARDUINO_SERVO_WRITE","ARDUINO_SERVO_READ","ARDUINO_STEPPER","ARDUINO_ENCODER"];
    
    nb_block_by_type=[]
    arduino_pin_by_typeblock=cell(size(list_arduino_gui,2),1)
    for i=1:size(list_arduino_gui,2)
        nb_block_by_type($+1)=0;
        arduino_pin_by_typeblock(i).entries=[];
    end    

    
    for i=1:size(objs)
        if typeof(objs(i))=='Block' then
            nombre_blocs=nombre_blocs+1;
        end
    end

    
    for i=1:nombre_blocs
        if objs(i).gui=="ARDUINO_SETUP" then nb_arduino=nb_arduino+1;
            port_com_arduino(objs(i).model.rpar(1))=objs(i).model.rpar(2); 
        end
        
        rep=find(objs(i).gui==list_arduino_gui);
        if ~isempty(rep) then
           nb_block_by_type(rep)=nb_block_by_type(rep)+1;
           arduino_pin_by_typeblock(rep).entries($+1)=objs(i).model.rpar(1); 
        end
    end

    
    global port_com
    try
        i=1;
            
            open_serial(i,port_com_arduino(i),115200);
            disp("communication with card "+string(i)+" on com "+string(port_com_arduino(i))+" is ok")
        
        sleep(2000)
    catch
        messagebox("Poor communication port")
        error('Poor communication Port')
    end
    
    try
       
       write_serial(1,ascii(201)+ascii(201),2); 
       
       for j=1:size(list_arduino_gui,2)
           disp(list_arduino_gui(j))
           for i=arduino_pin_by_typeblock(j).entries
               
               if list_arduino_gui(j)=="ARDUINO_DIGITAL_WRITE" then
                  pin="0"+ascii(97+i)+"1";  
                  
                  write_serial(1,pin,3); 
               end
               if list_arduino_gui(j)=="ARDUINO_DIGITAL_READ" then
                  pin="0"+ascii(97+i)+"0";
                                     
                  write_serial(1,pin,3); 
               end
               if list_arduino_gui(j)=="ARDUINO_ANALOG_WRITE" then
                  pin="0"+ascii(97+i)+"1";
                                        
                  write_serial(1,pin,3); 
               end           
               if list_arduino_gui(j)=="ARDUINO_ANALOG_READ" then
                   if i~=0 & i~=1 then
                      pin="0"+ascii(97+i)+"0";
                      
                      write_serial(1,pin,3); 
                   end
               end             
               if list_arduino_gui(j)=="ARDUINO_DCMOTOR" then
                   disp("motor")
                   code_sent="92";
                    
                   write_serial(1,pin,2); 
               end             
               if list_arduino_gui(j)=="ARDUINO_STEPPER" then
                   
               end             
               if list_arduino_gui(j)=="ARDUINO_SERVO_WRITE" then
                   if i==1 then 
                       pin="6a1" 
                        
                       write_serial(1,pin,3); 
                   elseif i==2 then 
                       pin="6b1" 
                       
                       write_serial(1,pin,3); 
                   else
                       messagebox("Probleme dans le numero du servomoteur")
                        error('problem')
                   end
                   disp(pin)
               end             
               if list_arduino_gui(j)=="ARDUINO_SERVO_READ" then
                   if i==1 then 
                       pin="6a1" 
                       
                       write_serial(1,pin,3); 
                   elseif i==2 then 
                       pin="6b1" 
                       
                       write_serial(1,pin,3); 
                   else
                       messagebox("Probleme in the number of the servomotor")
                        error('problem')
                   end
                   disp(pin)
               end             
               if list_arduino_gui(j)=="ARDUINO_ENCODER" then
                   code_sent="E"+string(i)+"a" 
                   disp(code_sent)
                   //writeserial(port_com,code_sent); 
                   write_serial(1,code_sent,3); 
               end   
          end          
       end
    catch
        error('Poor communication port.')
    end

    disp("Poor communication Port")
    
endfunction




















