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

function block=ARDUINO_PMODHB5_WRITE_sim(block,flag)
    global port_com;
function DEBUG(message)
    disp("[DEBUG time = "+string(scicos_time())+"] {"+block.label+"} ARDUINO_DCMOTOR Simulation: "+message);
endfunction
    select flag
     case -5 

     case 0 


     case 1 
      u1 = block.inptr(1);      
      direction=sign(u1);
      if direction>=0 then
          code_dir="f";
      else
          code_dir="b";
      end
      code_sent="B"+ascii(48+block.rpar(1))+code_dir;

      write_serial(1,code_sent,3);

      if abs(u1)>255 then
          code_sent="A"+ascii(48+block.rpar(1))+ascii(255);

      elseif u1==0 then
          code_sent="B"+ascii(48+block.rpar(1))+"r";

      else
          code_sent="A"+ascii(48+block.rpar(1))+ascii(abs(uint8(u1)));

      end
      write_serial(1,code_sent,3);

     case 2 

     case 3 
          arduino_sample_time=0.01;
          evout = block.evout(1);
          if evout < 0
              evout = arduino_sample_time;
          else
              evout = evout + arduino_sample_time;
          end
          block.evout(1) = evout;
     case 4 
        disp("init DCmotor")
        code_sent="92";
  
        write_serial(1,code_sent,2);
     case 5 
      
     case 6 

     case 9 

    else 

    end
endfunction
