{
Escribir una función que verifique si un caracter introducido es un dígito o no.
Acción 125 ES;
Ambiente
	caract: caracter;
	
	Función valid(C: caracter): entero ES;
	Proceso
		Según (C) hacer
			= '0': valid:= 1;
			= '1': valid:= 1;
			= '2': valid:= 1;
			= '3': valid:= 1;
			= '4': valid:= 1;
			= '5': valid:= 1;
			= '6': valid:= 1;
			= '7': valid:= 1;
			= '8': valid:= 1;
			= '9': valid:= 1;
			
			sino
				valid:= 0;
		Fin_Según		
				
	Fin_Función
	
Proceso
	esc('Ingrese un caracter: ');
	leer(caract);
	
	Si ((valid(caract)) = 0) entonces
		esc('El caracter no es un dígito');
	sino
		esc('El caracter ingresado es un dígito.');
	
	Fin_si
	
Fin_Acción.

}

Program digit;
var
	caract: char;
	
	function valid(C: char): integer;
	Begin
		Case (C) of
			'0': valid:= 1;
			'1': valid:= 1;
			'2': valid:= 1;
			'3': valid:= 1;
			'4': valid:= 1;
			'5': valid:= 1;
			'6': valid:= 1;
			'7': valid:= 1;
			'8': valid:= 1;
			'9': valid:= 1;
			
		else
			valid:= 0;
		end;		
				
	End;
	
Begin
	writeln('Ingrese un caracter: ');
	readln(caract);
	
	if (valid(caract) = 0) then
	begin
		writeln('El caracter no es un dígito');
	end
	else
		writeln('El caracter ingresado es un dígito.');
	

End.






