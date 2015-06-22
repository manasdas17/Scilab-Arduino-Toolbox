//
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - DIGITEO - Bruno JOFRET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//

function block=ARDUINO_SERVO_READ_sim(block,flag)
    global port_com arduino_sample_time;
function DEBUG(message)
    disp("[DEBUG time = "+string(scicos_time())+"] {"+block.label+"} ARDUINO_ANALOG_READ Simulation: "+message);
endfunction
    select flag
     case -5 

     case 0 


     case 1 
      
      pin="7"+ascii(96+block.rpar(1));

      write_serial(1,pin,2);

      values=[];
      value=ascii(0);
      while(value~=ascii(13)) then

          value=read_serial(1,1);
          values=values+value;
      end

      v=strsubst(values,string(ascii(10)),'')
      v=strsubst(v,string(ascii(13)),'')
      block.outptr(1)=evstr(v);

     case 2 

     case 3 
          
          evout = block.evout(1);
          if evout < 0
              evout = arduino_sample_time;
          else
              evout = evout + arduino_sample_time;
          end
          block.evout(1) = evout;
     case 4 
       disp("init servo read")
       if block.rpar(1)==1 then 
           pin="6a1" 
 
           write_serial(1,pin,3);
       elseif block.rpar(1)==2 then 
           pin="6b1" 
 
           write_serial(1,pin,3);
       else
           messagebox("Problem in the number of the servomotor")
           error('problem')
       end
     case 5 

     case 6 

     case 9 

    else 

    end
endfunction
