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

function block=ARDUINO_SERVO_WRITE_sim(block,flag)
    global port_com arduino_sample_time;
function DEBUG(message)
    disp("[DEBUG time = "+string(scicos_time())+"] {"+block.label+"} ARDUINO_ANALOG_WRITE Simulation: "+message);
endfunction
    select flag
     case -5 

     case 0 


     case 1 
      u1 = block.inptr(1);      
      if (u1<0) then
          
          pin="Sw"+ascii(48+block.rpar(1))+ascii(0);

      elseif u1>180 then
          
          pin="Sw"+ascii(48+block.rpar(1))+ascii(180);

      else
          
          pin="Sw"+ascii(48+block.rpar(1))+ascii(uint8(u1));

      end
      write_serial(1,pin,4);

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
       disp("init servo write")
       if block.rpar(1)==1 then 
           pin="Sa1"
             
           write_serial(1,pin,3);
       elseif block.rpar(1)==2 then 
            
           pin="Sa2"
 
           write_serial(1,pin,3);
       else
           messagebox("Probleme in the number of the servomotor")
           error('problem')
       end
     case 5 
        if block.rpar(1)==1 then 
            
           pin="Sd1"
 
           write_serial(1,pin,3);
       elseif block.rpar(1)==2 then 
            
           pin="Sd2"
 
           write_serial(1,pin,3);
       else
           messagebox("Probleme in the number of the servomotor")
           error('problem')
       end
     case 6 

     case 9 

    else 

    end
endfunction
