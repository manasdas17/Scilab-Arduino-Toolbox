//
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012-2012 - Scilab ENterprises - Bruno JOFRET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//

function block=ARDUINO_WRITE_sim(block,flag)
    global port_com;
function DEBUG(message)
    disp("[DEBUG time = "+string(scicos_time())+"] {"+block.label+"} ARDUINO_WRITE Simulation: "+message);
endfunction
    select flag
     case -5 

     case 0 


     case 1 
      u1 = block.inptr(1);
      pin="2"+ascii(97+block.rpar);
      if (u1<0.1) then
          pin="2"+ascii(97+block.rpar)+"0";

          write_serial(1,pin,3);
      else
          pin="2"+ascii(97+block.rpar)+"1";

          write_serial(1,pin,3);
      end


     case 2 

     case 3 

     case 4 

     case 5 
      



     case 6 

     case 9 

    else 

    end
endfunction
