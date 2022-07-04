
{
Se tiene una secuencia de enteros que contiene todos los CUIT de los empleados de una empresa, la misma termina con el CUIT 0. Para evitar largas esperas en los días de pago, la empresa necesita organizarlos de acuerdo al último dígito de su documento, generar una secuencia con los CUIT de las personas que su número de documento termine con 0, 1, 2 o 3.


	|11223334448|||99123216542|||0|
	
Acción 217 ES;
Ambiente
	sec: secuencia de entero;
	v: entero;
	
	sally: secuencia de entero; 

Proceso 
	arr(sec);
	avz(sec, v);
	
	crear(sally);
	
	Repetir
		
		si ((v mod 100) div 10 = 0) or ((v mod 100) div 10 = 1) or ((v mod 100) div 10 = 2) or ((v mod 100) div 10 = 3) entonces
				
			esc(sally, v);
		
		fin_si
		
		avz(sec, v);
	
	Hasta (v = 0);

	cerrar(sec);
	cerrar(sally);
Fin_Acción.
}

program something;
type
	secuencia_de_entero = file of integer;
var
	sec: secuencia_de_entero;
	v: integer;
	
	sally: secuencia_de_entero;
	
Begin
	assign(sec, 'num_sec.dat');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida7.dat');
	rewrite(sally);
	
	repeat
		if ((v mod 100) div 10 = 0) or ((v mod 100) div 10 = 1) or ((v mod 100) div 10 = 2) or ((v mod 100) div 10 = 3) then
		begin	
			write(sally, v);
		
		end;
		
		read(sec, v);
		
	until(v = 0);
	
	close(sec);
	close(sally);
End.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
