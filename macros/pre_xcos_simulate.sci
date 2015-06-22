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
  global port_com port_TCL taskAI0 bufferSizeNI;

function continueSimulation=pre_xcos_simulate(scs_m, needcompile)
  global port_com port_TCL taskAI0;

  continueSimulation = %t;
  callXcos_Param_Var=%f 
  callXcos_Param_Freq = %f;
  callRep_freq = %f;
  presence_param_var=%f 
  presence_rep_freq=%f  
  presence_imprimante=%f  
  presence_bloc_end=%f    
  presence_rep_temp=%f   
  presence_irep_temp=%f  
  presence_scope=%f   
  presence_arduino=%f 
  presence_NI600X=%f 

  for i = 1:size(scs_m.objs)
    curObj= scs_m.objs(i);
    if (typeof(curObj) == "Block" & curObj.gui == "PARAM_VAR")
      presence_param_var=%t
    elseif (typeof(curObj) == "Block" & curObj.gui == "REP_FREQ")
      presence_rep_freq=%t
      
    elseif (typeof(curObj) == "Block" & curObj.gui == "IMPRIMANTE")
      presence_imprimante=%t
      block_imprimante=curObj;
      scs_m.props.tol(5)=1;
    elseif (typeof(curObj) == "Block" & curObj.gui == "ENDBLK")
      presence_bloc_end=%t
    elseif (typeof(curObj) == "Block" & curObj.gui == "REP_TEMP")
      presence_rep_temp=%t
    elseif (typeof(curObj) == "Block" & curObj.gui == "ARDUINO_SETUP")
      presence_arduino=%t
    elseif (typeof(curObj) == "Block" & curObj.gui == "IREP_TEMP")
      presence_irep_temp=%t
    elseif (typeof(curObj) == "Block" & curObj.gui == "SCOPE")
      presence_scope=%t
    elseif (typeof(curObj) == "Block" & curObj.gui == "NI600X_C_READ")
      presence_NI600X=%t
      block_NI600X=curObj;
      scs_m.props.tol(5)=1;
    end
  end

if presence_NI600X then
   init_NI(block_NI600X);
end

  if  presence_imprimante==%t then
    continueSimulation=init_imprimante(block_imprimante)
  end

  if  presence_arduino==%t then
        scs_m=ARDUINO_pre_simulate(scs_m);
        continueSimulation = %t;

  end

if ~presence_rep_freq then
    if (~presence_rep_temp &  presence_scope )
        message("Insérer un bloc REP_TEMP si vous souhaitez faire une analyse temporelle avec un ou plusieurs bloc(s) SCOPE")
        continueSimulation = %f;
        return ;
    end
end

   if presence_rep_temp then
        scs_m=REP_TEMP_pre_simulate(scs_m);
        continueSimulation = %t;
   end

   if presence_irep_temp then
        scs_m=SIMM_pre_simulate(scs_m);
        continueSimulation = %t;

   end


   if  presence_param_var & ~presence_rep_freq then
       continueSimulation=Param_Temp_pre_simulate(scs_m,needcompile);
   end

   if  presence_param_var & presence_rep_freq then
       if presence_rep_temp then
           continueSimulation=Param_Temp_pre_simulate(scs_m,needcompile);
       end
       Param_Freq_pre_simulate(scs_m, needcompile);
       continueSimulation = %f; 
   end

   if presence_rep_freq & presence_scope & ~presence_rep_temp & ~presence_param_var  then
       disp('Simulation time set to 0')
      scs_m.props.tf=0;
      
    continueSimulation = %t;
   end

scs_m=resume(scs_m)


endfunction
