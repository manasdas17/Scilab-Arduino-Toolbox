//
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012-2012 - Scilab Enterprises - Bruno JOFRET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//

function subdemolist = demo_gateway()
  demopath = get_absolute_file_path("arduino.dem.gateway.sce");

  subdemolist = ["Potentiometer", "analog_read.dem.sce" ;
                 "Led Push Button", "digital_read_write.dem.sce" ;
                 "LED dimmer", "analog_write.dem.sce" ;
                 "Openloop DC Motor", "motor.dem.sce";
                 "Encoder", "encodeur.dem.sce";
                 "Interrupt", "interrupt_compteur.dem.sce";
                 "Servo position control with PID", "asserv.dem.sce";
                 "ServoMotor", "servomotor.dem.sce";
                 "Examples in documentation", "exemples_livret.dem.gateway.sce";
                ];

  subdemolist(:,2) = demopath + subdemolist(:,2);

endfunction
subdemolist = demo_gateway();
clear demo_gateway; // remove demo_gateway on stack
