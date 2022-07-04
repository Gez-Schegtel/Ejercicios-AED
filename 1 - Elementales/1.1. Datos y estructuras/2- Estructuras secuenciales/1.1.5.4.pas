
{
Se desea calcular la superficie de un trapecio, para la cual se ingresa la longitud de ambas bases y la altura. En base a la fórmula:

	S= (Bmay+Bmen)×h / 2

Finalizando el proceso, emitir dicha superficie y los valores ingresados.

Acción 154 ES;
Ambiente
	baseM: real;
	basem: real;
	altur: real;
	S: real;
	
Proceso
	
	esc('Ingrese la base mayor.');
	leer(baseM);
	esc('Ingrese la base menor.');
	leer(basem);
	esc('Ingrese la altura.');
	leer(altur);
	
	S:= ((baseM + basem) * altur) / 2;
	
	esc('La superficie es del trapecio es de >> ', S);
	esc('Los datos ingresados fueron ', baseM, ' para la base mayor, y ', basem, ' para la base menor.');
	
Fin.
}

Program trapecio_sup;
var
	baseM: real;
	basm: real;
	altur: real;
	S: real;

Begin
	write('Ingrese la base mayor >> ');
	readln(baseM);
	write('Ingrese la base menor >> ');
	readln(basm);
	write('Ingrese la altura >> ');
	readln(altur);
	
	S:= ((baseM + basm) * altur) / 2;
	
	writeln('La superficie es del trapecio es de >> ', S:0:2);
	writeln('Los datos ingresados fueron ', baseM:0:2, ' para la base mayor, y ', basm:0:2, ' para la base menor.');
	
End.

















