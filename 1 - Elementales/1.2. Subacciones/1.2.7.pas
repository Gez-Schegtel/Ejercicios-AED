
{

Repita el ejercicio del punto 5 pero utilice procedimiento en lugar de función.

Acción 127 ES;
Ambiente
    caract: caracter;
    
    procedimiento valid(C: caracter) ES;
    Ambiente
    	validacion: entero;
    Proceso
        Según (C) hacer
		'0': validacion:= 1;
		'1': validacion:= 1;
		'2': validacion:= 1;
		'3': validacion:= 1;
		'4': validacion:= 1;
		'5': validacion:= 1;
		'6': validacion:= 1;
		'7': validacion:= 1;
		'8': validacion:= 1;
		'9': validacion:= 1;
            
            sino
		validacion:= 0;
        Fin_Según        
        
        Si (validacion = 0) entonces
            esc('El caracter no es un dígito');
        sino
            esc('El caracter ingresado es un dígito.');

        Fin_si
            
    Fin_Procedimiento
    
Proceso
    esc('Ingrese un caracter: ');
    leer(caract);
    valid(caract);
    
Fin_Acción.

}

program digit;
var
	caract: char;
	
	procedure valid(C: char);
	var
		validacion: integer;
	begin
		case (C) of
			'0': 	begin
					validacion:= 1;
					writeln('PRUEBA');
				end;	
			'1': validacion:= 1;
			'2': validacion:= 1;
			'3': validacion:= 1;
			'4': validacion:= 1;
			'5': validacion:= 1;
			'6': validacion:= 1;
			'7': validacion:= 1;
			'8': validacion:= 1;
			'9': validacion:= 1;
			
		else
			validacion:= 0;
		end;		
		
		if (validacion = 0) then
		begin
			writeln('El caracter no es un dígito');
		end
		else
			writeln('El caracter ingresado es un dígito.');

	end;
	
Begin
	writeln('Ingrese un caracter: ');
	readln(caract);
	valid(caract);
End.
