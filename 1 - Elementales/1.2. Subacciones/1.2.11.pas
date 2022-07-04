


{
Diseñe un algoritmo que muestre un menú con las opciones sumar, restar, multiplicar y dividir, el algoritmo solicitará una opción y realizará la tarea elegida, se debe usar un procedimiento para mostrar el menú, pedir los datos en el algoritmo principal y después usar funciones para realizar los cálculos.


Acción 1211 ES;
Ambiente
	num1: entero;
	num2: entero;
	op: entero;

	Procedimiento mostrarMenu ES;
	  
		esc('Este algoritmo suma, resta, multiplica o divide números.');
		esc('Ingrese 1 para sumar:');
		esc('Ingrese 2 para restar:');
		esc('Ingrese 3 multiplicar:');
		esc('Ingrese 4 dividir:');

	Fin_Procedimiento

	Función operaciones(n1, n2, opfn: entero): real ES; //Lo definí como real porque puse la división que puede devolver un real. Si pongo que devuelve un entero, tendría que usar div
 	Proceso
		
		Según (opfn) hacer
			1: operaciones:= num1 + num2;
			2: operaciones:= num1 - num2;
			3: operaciones:= num1 * num2;
			4: operaciones:= num1 / num2; 
		Fin_Según.
		
	Fin_Función.


Proceso
	mostarMenu;
	leer(op);
	//Verificamos si el dato ingresado es correcto.
	Repetir
		Si (op < 1) or (op > 4) entonces
			esc('El dato ingresado no es válido. Por favor ingréselo nuevamente: ');
			leer(op);
		Fin_Si
	Hasta que (op >= 1) or (op <= 4);

	esc('Ingrese los números que desee operar.');
	leer(num1);
	leer(num2);

	esc('El resultado de la operación elegida es >> ', operaciones(num1, num2, op));

Fin_Acción.

}



Program something;
var
	num1: integer;
	num2: integer;
	op: integer;

	procedure mostrarMenu;
	begin
		writeln('Este algoritmo suma, resta, multiplica o divide números.');
		writeln('Ingrese 1 para sumar:');
		writeln('Ingrese 2 para restar:');
		writeln('Ingrese 3 multiplicar:');
		writeln('Ingrese 4 dividir:');

	end;

	function operaciones(n1, n2, opfn: integer): real; //Lo definí como real porque puse la división que puede devolver un real. Si pongo que devuelve un entero, tendría que usar div
	begin
		
		case (opfn) of
			1: operaciones:= num1 + num2;
			2: operaciones:= num1 - num2;
			3: operaciones:= num1 * num2;
			4: operaciones:= num1 / num2; 
		end;
			
	end;


Begin
	mostrarMenu;
	readln(op);
	//Verificamos si el dato ingresado es correcto.
	repeat
		if (op < 1) or (op > 4) then
		begin
			writeln('El dato ingresado no es válido. Por favor ingréselo nuevamente: ');
			readln(op);
		end;
		
	until (op >= 1) or (op <= 4);

	writeln('Ingrese los números que desee operar.');
	readln(num1);
	readln(num2);

	writeln('El resultado de la operación elegida es >> ', operaciones(num1, num2, op):0:2);

End.




























