function cmd_encoder_init(h,enc_mode,pin_no_1,pin_no_2)
    
    
    
    
       code_sent="Ea"+ascii(0+corresp(block.rpar(3))); 
          if  block.rpar(2)==4 then 
              code_sent=code_sent+ascii(0+corresp(block.rpar(4)))+string(block.rpar(2));
          else
              code_sent=code_sent+ascii(0+block.rpar(4))+string(block.rpar(2));
          end

 
          write_serial(1,code_sent,5)
          code_sent="Ez"+ascii(corresp(block.rpar(3)));
 
          write_serial(1,code_sent,3)
endfunction
