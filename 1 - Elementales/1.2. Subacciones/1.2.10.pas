
{
Escribir un único procedimiento mostrar_nro que reciba como parámetro un dígito y lo muestre por pantalla de la misma forma que se indica en el ejercicio 9.

Acción 1210 ES;
Ambiente
	op: entero;
	
	Procedimiento numbers(A: integer) ES;
		según (A) hacer
			1:
				esc('*');
				esc('*');
				esc('*');
				esc('*');
			
			2: 	
				esc('*****');
				esc('    *');
				esc('*****');
				esc('*    ');
				esc('*****');
				
			3: 	
				esc('*****');
				esc('    *');
				esc('*****');
				esc('    *');
				esc('*****');
			
			4: 	
				esc('*   *');
				esc('*   *');
				esc('*****');
				esc('    *');
				esc('    *');
			
			5: 	
				esc('*****');
				esc('*    ');
				esc('*****');
				esc('    *');
				esc('*****');
			
			6: 	
				esc('*****');
				esc('*    ');
				esc('*****');
				esc('*   *');
				esc('*****');
				
			7: 	
				esc('*****');
				esc('    *');
				esc('    *');
				esc('    *');
				esc('    *');
				
			8: 	
				esc('*****');
				esc('*   *');
				esc('*****');
				esc('*   *');
				esc('*****');
				
			9: 	
				esc('*****');
				esc('*   *');
				esc('*****');
				esc('    *');
				esc('*****');
				
			10: 	
				esc('*  *****');
				esc('*  *   *');
				esc('*  *   *');
				esc('*  *   *');
				esc('*  *****');

		fin_según;

	fin_procedimiento;
	
Proceso
	esc('Seleccioná una opción del 1 al 10: '); //Esto lo hago así porque me gustá más del 1 al 10 que del 0 al 9
	leer(op);
	
	numbers(op);	
Fin_Acción.
}


program something;
uses crt;
var 
	op: integer;
	
	procedure numbers(A: integer);
	begin
		case (A) of
			1:	begin
					TextColor(lightred);
					writeln('*');
					writeln('*');
					writeln('*');
					writeln('*');
				end;
				
			2: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('    *');
					writeln('*****');
					writeln('*    ');
					writeln('*****');
				end;
				
			3: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('    *');
					writeln('*****');
					writeln('    *');
					writeln('*****');
				end;
				
			4: 	begin
					TextColor(lightred);
					writeln('*   *');
					writeln('*   *');
					writeln('*****');
					writeln('    *');
					writeln('    *');
				end;
				
			5: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('*    ');
					writeln('*****');
					writeln('    *');
					writeln('*****');
				end;
				
			6: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('*    ');
					writeln('*****');
					writeln('*   *');
					writeln('*****');
				end;
				
			7: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('    *');
					writeln('    *');
					writeln('    *');
					writeln('    *');
				end;
				
			8: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('*   *');
					writeln('*****');
					writeln('*   *');
					writeln('*****');
				end;
				
			9: 	begin
					TextColor(lightred);
					writeln('*****');
					writeln('*   *');
					writeln('*****');
					writeln('    *');
					writeln('*****');
				end;
				
			10: 	begin
					TextColor(lightred);
					writeln('*  *****');
					writeln('*  *   *');
					writeln('*  *   *');
					writeln('*  *   *');
					writeln('*  *****');
				end;
			else
				BEGIN
					TEXTCOLOR(LIGHTMAGENTA + BLINK);
					WRITELN('PONELE VOLUNTAD LA CONCHA DE TU MADRE');
				END;
		end;
	end;
	
Begin
	writeln('Seleccioná una opción del 1 al 10: '); //Esto lo hago así porque me gustá más del 1 al 10 que del 0 al 9
	readln(op);
	
	numbers(op);	
End.
