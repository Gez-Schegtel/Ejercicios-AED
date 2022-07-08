
program pres;
uses crt;
var
	op: char;
Begin
	repeat
	                                                                                   
		delay(50); textcolor(magenta); 		writeln('	   -----:     :-----     :----- 	');          
		delay(50); textcolor(blue); 		writeln('	   #####+     *####*     +#####         ');  
		delay(50); textcolor(white); 		writeln('	   +#####.    *####*    .#####*         ');  
		delay(50); textcolor(lightblue);	writeln('	   :#####*    *####*    +#####-         ');  
		delay(50); textcolor(green);		writeln('	    +#####*.  *####*  .*#####*          ');  
		delay(50); textcolor(cyan);		writeln('	    .*######+:*####*:+######*.          ');  
		delay(50); textcolor(red);		writeln('	     .*####################*.           ');  
		delay(50); textcolor(lightcyan);	writeln('	       -##################=             ');  
		delay(50); textcolor(lightgray); 	writeln('		       .=*############*=.              ');  
		delay(50); textcolor(lightgreen);	writeln('	   ::::::::-+*######*+-::::::::         ');  
		delay(50); textcolor(brown);		writeln('	  .############################.        ');  
		delay(50); textcolor(white);		writeln('	   ############################.        ');  
		delay(50); textcolor(yellow);		writeln('	   ############################.        ');  
		delay(50); textcolor(magenta);		writeln('	   =========+*######*+=========         ');  
		delay(50); textcolor(red); 		writeln('		        :=*###########=:               ');  
		delay(50); textcolor(cyan); 		writeln('	       .+################+:             ');
		delay(50); textcolor(green); 		writeln('	      =####################=            ');  
		delay(50); textcolor(lightmagenta);	writeln('	     +#######=*####*=#######+           ');  
		delay(50); textcolor(blue);		writeln('	    =######-  *####*  -######=          ');  
		delay(50); textcolor(red);		writeln('	   .######.   *####*   .*#####:         ');  
		delay(50); textcolor(lightblue);	writeln('	   +#####:    *####*    :#####+         ');  
		delay(50); textcolor(lightgreen);	writeln('	   #####*     *####*     +#####         ');  
		delay(50); textcolor(magenta);		writeln('	   +++++-     =++++=     -+++++         ');                                                    
		delay(1500);clrscr;
	
	textcolor(lightgray);							                  
	writeln('¿Repetir el proceso? s/n');
	readln(op);
	
	until (upcase(op) = 'N');
End.

{Colores disponibles:
						Black 0 
						Blue 1 
						Green 2 
						Cyan 3 
						Red 4 
						Magenta 5 
						Brown 6 
						Light Gray 7 
						Dark gray 8 
						Light Blue 9 
						Light Green 10 
						Light Cyan 11 
						Light Red 12 
						Light Magenta 13
						Yellow 14 
						White 15 
						Blink 128}
						
