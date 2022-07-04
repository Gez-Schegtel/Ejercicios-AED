
{
Elaborar una función que reciba un número entero y retorne -1 si el número es negativo. Si el número es positivo debe devolver una clave calculada de la siguiente manera: Se suma cada dígito que compone el número y a esa suma se le calcula el modulo 7.

Por ejemplo: para la cifra 513, la clave será 5+1+3 =9; 9 mod 7 = 2.
Utilice la función para diseñar un algoritmo que permita leer varios valores y determine, para cada uno, si el número leído fue negativo o, si fue positivo, que clave le corresponde.

Acción 124 ES;
Ambiente
    num: entero;
    op: ('s', 'n');
    
    Función codigo(N: entero): entero ES;
    Ambiente
    	des_unit: entero;
    Proceso
        si (N < 0) entonces
            codigo:= -1;
        sino
            codigo:= 0;
            
            mientras (N <> 0) hacer
                des_unit:= N mod 10;
                codigo:= codigo + des_unit;
                N:= N DIV 10;
            fin_mientras
            
            codigo:= codigo MOD 7;
        fin_si
        
    Fin_Función.

Proceso
    esc('¿Desea ingresar un número y generar un codigo?');
    leer(op);
    
    Mientras (op = 's') hacer
        esc('Ingrese un número: ');
        leer(num);
        
        esc('El codigo es >> ', codigo(num));
    
        esc('¿Desea ingresar otro número?');
        leer(op);
    Fin_Mientras
    
    
        
Fin_Acción

}

program code;
uses crt;
var
	num: integer;
	op: char;
	
	function codigo(N: integer): integer;
	var
		des_unit: integer;
	Begin
		if (N < 0) then
		begin
			codigo:= -1;
		end
		else
			begin
				codigo:= 0;
				
				while (N <> 0) do
				begin
					des_unit:= N mod 10;
					codigo:= codigo + des_unit;
					N:= N DIV 10;
				end;
				
				codigo:= codigo MOD 7;
			end;
			
	end;

Begin
	writeln('¿Desea ingresar un número y generar un codigo?');
	readln(op);
	
	while (op = 's') do
	begin
		writeln('Ingrese un número: ');
		readln(num);
		
		TextColor(LightRed);
		writeln('El codigo es >> ', codigo(num));
		TextColor(LightGray);
	
		writeln('¿Desea ingresar otro número?');
		readln(op);
	end;
		
End.







