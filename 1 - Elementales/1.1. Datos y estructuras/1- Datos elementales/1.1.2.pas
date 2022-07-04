{
Indique en cuáles de los siguientes pares es importante el orden de los enunciados. Es decir, que si se modifica el orden de ellos cambian los resultados (supóngase X<>Y, Y<>Z, Z<>X). Justifique su respuesta.
	
	op1:
	X:=Y
	Y:=Z 
	
	op2:
	X:=Y
	Z:=X
	
	op3:
	X:=Z    
	X:=Y
	
	op4:
	Z:=Y
	X:=Y

}

Program operaciones;
var
	X: integer;
	Y: integer;
	Z: integer;
Begin
	X:= 5;
	Y:= 8;
	Z:= 13;
	
	X:= Y;
	Y:= Z;
	writeln(X, ' ~ ', Y);
	//invierto el orden de operaciones para saber si esto influye en el resultado final del proceso
	Y:= Z;
	X:= Y;
	writeln(X, ' ~ ', Y); 
	// Si escribe lo mismo, quiere decir que no influye el orden de los factores
	
	writeln(' ');

	X:= 5;
	Y:= 8;
	Z:= 13;
	
	X:= Y;
	Z:= X;
	writeln(X, ' ~ ', Z);
	Z:= X;
	X:= Y;
	writeln(X, ' ~ ', Z);

	writeln(' ');	

	X:= 5;
	Y:= 8;
	Z:= 13;

	X:= Z;    
	X:= Y;
	writeln(X, ' ~ ', X);
	X:= Y;
	X:= Z;
	writeln(X, ' ~ ', X);

	writeln(' ');

	X:= 5;
	Y:= 8;
	Z:= 13;	
	
	Z:= Y;
	X:= Y;
	writeln(Z, ' ~ ', X);
	X:= Y;
	Z:= Y;
	writeln(Z, ' ~ ', X);

	writeln(' ');
End.

{
	Conclusiones post-ejecución del programa...
	
	op1: influye.
	X:=Y
	Y:=Z 
	
	op2: no influye.
	X:=Y
	Z:=X
	
	op3: influye.
	X:=Z    
	X:=Y
	
	op4: no influye.
	Z:=Y
	X:=Y

}





