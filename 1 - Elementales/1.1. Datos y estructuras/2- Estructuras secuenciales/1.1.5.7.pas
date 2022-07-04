
{
Escriba un algoritmo que halle la media geométrica de tres valores X, Y, Z. Este debe emitir los tres valores por separado y luego el valor medio. La media geométrica es igual a (X×Y×Z)/3

Acción media ES;
Ambiente
	x: real;
	y: real;
	z: real;
	res: real;
	
Proceso
	esc('Ingrese tres valores: ');
	leer(x);
	leer(y);
	leer(z);
	
	res:= (x+y+z)/3;
	
	esc('La media es igual a >> ', res);
Fin.


Acción media20 ES;
Ambiente
	x: real;
	cont: entero;
	acum: real;
	res: real;
	resp: alfanumérico;
	
Proceso
	cont:= 0;
	acum:= 0;
	
	repetir
		esc('Ingrese un valor:');
		leer(x);
		
		cont:= cont + 1;
		
		acum:= acum +x;
		
		esc('¿Desea seguir agregando valores?');
		leer(resp);
	
	hasta que resp <> n;
	
	res:= acum / cont;
	esc('La media de todos los valores ingresados es de >> ', res);
				
Fin.



Program media;
var
	x: real;
	y: real;
	z: real;
	res: real;
	
Begin
	writeln('Ingrese tres valores: ');
	readln(x);
	readln(y);
	readln(z);
	
	res:= (x+y+z)/3;
	
	writeln('La media es igual a >> ', res:0:2);
End.
}

Program media20;
var
	x: real;
	cont: integer;
	acum: real;
	res: real;
	resp: char;
	
Begin
	cont:= 0;
	acum:= 0;
	
	repeat
	begin	writeln('Ingrese un valor:');
		readln(x);
		
		cont:= cont + 1;
		
		acum:= acum + x;
		
		writeln('¿Desea seguir agregando valores?');
		writeln('Para salir presione "n"');
		writeln('Para continuar presione "s"');
		readln(resp);
	end;
	until (resp <> 's');
	
	res:= acum / cont;
	writeln('La media de todos los valores ingresados es de >> ', res:0:2);
				
End.













