
{
Elabore un algoritmo para calcular los primeros 50 números de FIBONACCI, sabiendo que dichos números cumplen con lo siguiente:

A0=0,A1=1,A2=A0+A1,...,An=A(n−1)+A(n−2)

Acción 1125 ES;
Ambiente
	son: entero;
	i: entero;
	
	golden_ratio = 1.618034;
	five_root = 2.236067;
	
Proceso
	esc('Este algoritmo te permite calcular los primeros 50 hijos de Fibonacci.');
	
	son:= 0;
	
	para i:= 0 hasta 50 hacer
		son:= ( golden_ratio**i - (1 - golden_ratio)**i ) / (five_root);
		esc(son);
	fin_para
	
Fin_Acción.
}

Program Fibonacci;
uses math; 
var 
	son: real;
	i: integer;
const	
	golden_ratio = 1.618034;
	five_root = 2.236067;
		
Begin
	writeln('Este algoritmo te permite calcular los primeros 50 hijos de Fibonacci.');	

	son:= 0;
		
	for i:= 0 to 50 do
	begin
		son:= ( golden_ratio**i - (1 - golden_ratio)**i ) / (five_root);
		writeln(son:0:0);
	end;
End.




{

// ** Este algoritmo es una adaptación del código hecho por el alumno Leonardo Bravo ** //
// ** Fuente donde está el código original: https://github.com/LeonardoBrabo/Algoritmos_Resueltos/blob/master/1.Estructura%20de%20Control/Accion%20Ejercicio_25%20Es.txt **//

Program Ejercicio_25;

var 
	 
	ANT1, ANT2, FIBO :real;
	I: integer;
Begin 

	writeln ('Este programa calcula los primero 50 numero de la serie de Fibonacci:');
	ANT1:= 0;
	ANT2:= 1;
	for I:= 1 to 50 do 
	begin
		writeln (ANT1:0:0);
		FIBO:= ANT1 + ANT2;
		ANT1:= ANT2;
		ANT2:= FIBO;
	end;

end.
}

