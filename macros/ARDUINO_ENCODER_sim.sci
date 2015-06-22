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

function block=ARDUINO_ENCODER_sim(block,flag)
    global port_com arduino_sample_time corresp;
function DEBUG(message)
    disp("[DEBUG time = "+string(scicos_time())+"] {"+block.label+"} ARDUINO_ANALOG_READ Simulation: "+message);
endfunction
    select flag
     case -5 

     case 0 


 case 1 
      code_sent="Ep"+ascii(corresp(block.rpar(3)));

      write_serial(1,code_sent,3)


      [a,b,c]=status_serial(1);
      while (b < 4) 
        [a,b,c]=status_serial(1);
      end
      values=read_serial(1,4);
      temp=ascii(values);
      val=double(int32(uint32(256^3*temp(4)+256^2*temp(3)+256*temp(2)+temp(1))));

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

          code_sent="Ea"+ascii(0+corresp(block.rpar(3))); 
          if  block.rpar(2)==4 then 
              code_sent=code_sent+ascii(0+corresp(block.rpar(4)))+string(block.rpar(2));
          else
              code_sent=code_sent+ascii(0+block.rpar(4))+string(block.rpar(2));
          end


          write_serial(1,code_sent,5)
          code_sent="Ez"+ascii(corresp(block.rpar(3)));
 
          write_serial(1,code_sent,3)
     case 5 
          if  block.rpar(2)==4 then 
             code_sent="Er"+ascii(corresp(block.rpar(3)))+ascii(corresp(block.rpar(4)));
         else
             code_sent="Er"+ascii(corresp(block.rpar(3)))+ascii(corresp(block.rpar(3)));
         end

          write_serial(1,code_sent,4)

     case 6 

     case 9 

    else 

    end
endfunction
