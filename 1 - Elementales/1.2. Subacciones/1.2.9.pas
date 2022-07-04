
{
Desarrollar los procedimientos mostrar_0, mostrar_1, mostrar_9 que visualicen por pantalla, respectivamente, los números 0,1,...,9 en tamaño grande, tal y como se muestra a continuación:

*****        *   *****   *****   *   *   *****   *****   *****   *****   *****
*   *        *       *       *   *   *   *       *           *   *   *   *   *
*   *        *   *****   *****   *****   *****   *****       *   *****   *****  
*   *        *   *           *       *       *   *   *       *   *   *       *
*****        *   *****   *****       *   *****   *****       *   *****   ***** 


Acción 129 ES;
Ambiente
    op: integer;
    
    procedimiento mostrar_1 ES;
        esc('*');
        esc('*');
        esc('*');
        esc('*');
    fin_procedimiento;
    
    procedimiento mostrar_2 ES;
        esc('*****');
        esc('    *');
        esc('*****');
        esc('*    ');
        esc('*****');
    fin_procedimiento;
    
    procedimiento mostrar_3 ES;
        esc('*****');
        esc('    *');
        esc('*****');
        esc('    *');
        esc('*****');
    fin_procedimiento;
    
    procedimiento mostrar_4 ES;
        esc('*   *');
        esc('*   *');
        esc('*****');
        esc('    *');
        esc('    *');
    fin_procedimiento;
    
    procedimiento mostrar_5 ES;
        esc('*****');
        esc('*    ');
        esc('*****');
        esc('    *');
        esc('*****');
    fin_procedimiento;
    
    procedimiento mostrar_6 ES;
        esc('*****');
        esc('*    ');
        esc('*****');
        esc('*   *');
        esc('*****');
    fin_procedimiento;
    
    procedimiento mostrar_7 ES;
        esc('*****');
        esc('    *');
        esc('    *');
        esc('    *');
        esc('    *');
    fin_procedimiento;
    
    procedimiento mostrar_8 ES;
        esc('*****');
        esc('*   *');
        esc('*****');
        esc('*   *');
        esc('*****');
    fin_procedimiento;
    
    procedimiento mostrar_9 ES;
        esc('*****');
        esc('*   *');
        esc('*****');
        esc('    *');
        esc('*****');
    fin_procedimiento;
    
    procedimiento mostrar_10 ES;
        esc('*  *****');
        esc('*  *   *');
        esc('*  *   *');
        esc('*  *   *');
        esc('*  *****');
    fin_procedimiento;
    
Proceso
    esc('Seleccioná una opción del 1 al 10: '); //Esto lo hago así porque me gustá más del 1 al 10 que del 0 al 9
    leer(op);
    
    según (op) hacer
        1: mostrar_1;
        2: mostrar_2;
        3: mostrar_3;
        4: mostrar_4;
        5: mostrar_5;
        6: mostrar_6;
        7: mostrar_7;
        8: mostrar_8;
        9: mostrar_9;
        10: mostrar_10;
    fin_según
    
Fin_Acción.

}



program something;
uses crt;
var 
	op: integer;
	
	procedure mostrar_1 ;
	begin
		TextColor(lightred);
		writeln('*');
		writeln('*');
		writeln('*');
		writeln('*');
	end;
	
	procedure mostrar_2 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('    *');
		writeln('*****');
		writeln('*    ');
		writeln('*****');
	end;
	
	procedure mostrar_3 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('    *');
		writeln('*****');
		writeln('    *');
		writeln('*****');
	end;
	
	procedure mostrar_4 ;
	begin
		TextColor(lightred);
		writeln('*   *');
		writeln('*   *');
		writeln('*****');
		writeln('    *');
		writeln('    *');
	end;
	
	procedure mostrar_5 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('*    ');
		writeln('*****');
		writeln('    *');
		writeln('*****');
	end;
	
	procedure mostrar_6 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('*    ');
		writeln('*****');
		writeln('*   *');
		writeln('*****');
	end;
	
	procedure mostrar_7 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('    *');
		writeln('    *');
		writeln('    *');
		writeln('    *');
	end;
	
	procedure mostrar_8 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('*   *');
		writeln('*****');
		writeln('*   *');
		writeln('*****');
	end;
	
	procedure mostrar_9 ;
	begin
		TextColor(lightred);
		writeln('*****');
		writeln('*   *');
		writeln('*****');
		writeln('    *');
		writeln('*****');
	end;
	
	procedure mostrar_10 ;
	begin
		TextColor(lightred);
		writeln('*  *****');
		writeln('*  *   *');
		writeln('*  *   *');
		writeln('*  *   *');
		writeln('*  *****');
	end;
	
Begin
	writeln('Seleccioná una opción del 1 al 10: '); //Esto lo hago así porque me gustá más del 1 al 10 que del 0 al 9
	readln(op);
	
	case (op) of
		1: mostrar_1;
		2: mostrar_2;
		3: mostrar_3;
		4: mostrar_4;
		5: mostrar_5;
		6: mostrar_6;
		7: mostrar_7;
		8: mostrar_8;
		9: mostrar_9;
		10: mostrar_10;
	end;
	
End.

















