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

function block=ARDUINO_DCMOTOR_sim(block,flag)
    global port_com arduino_sample_time;
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
              code_dir=ascii(49);
          else
              code_dir=ascii(48);
          end
          if abs(u1)>255 then
              val=255;
          else
              val=abs(ceil(u1));
          end
          
          
          code_sent="M"+ascii(48+block.rpar(5))+code_dir+ascii(val);

          write_serial(1,code_sent,4)


     
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
        disp("init DCmotor")
        if(block.rpar(1)==1) then
            
            code_sent="C"+string(block.rpar(5))+ascii(48+block.rpar(4))+ascii(48+block.rpar(3))+"1";    
        elseif (block.rpar(1)==2) then
             code_sent="C"+string(block.rpar(5))+ascii(48+block.rpar(4))+ascii(48+block.rpar(3))+"1";   
         elseif (block.rpar(1)==3) then
             code_sent="C"+string(block.rpar(5))+ascii(48+block.rpar(4))+ascii(48+block.rpar(3))+"0";   
        end
  
        write_serial(1,code_sent,5)


        
        [a,b,c]=status_serial(1);
        while (b < 2) 
          [a,b,c]=status_serial(1);
        end
        values=read_serial(1,2);
        if (values == 'OK') then
            disp('Init motor successful')
        else
            disp('Init motor unsuccessful')
        end
        
     case 5 
      
        code_sent="M"+ascii(48+block.rpar(5))+"1"+ascii(0);
      write_serial(1,code_sent,4)


     case 6 

     case 9 

    else 

    end
endfunction
