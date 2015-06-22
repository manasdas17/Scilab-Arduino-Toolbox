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

function block=ARDUINO_ANALOG_READ_sim(block,flag)
    global port_com  arduino_sample_time
function DEBUG(message)
    disp("[DEBUG time = "+string(scicos_time())+"] {"+block.label+"} ARDUINO_ANALOG_READ Simulation: "+message);
endfunction
    select flag
     case -5 

     case 0 


     case 1 
      
      pin="A"+ascii(48+block.rpar(1));
      write_serial(1,pin,2);
  
      
      [a,b,c]=status_serial(1);
      while (b < 2) 
        [a,b,c]=status_serial(1);
      end
      values=read_serial(1,2);

      temp=ascii(values);
      val=double(int16(256*temp(2)+temp(1)));
      block.outptr(1)=val;
    
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
       disp("init analog read")
 


     case 5 
      

     case 6 

     case 9 

    else 

    end
endfunction
