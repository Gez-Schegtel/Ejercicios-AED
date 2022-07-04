{
Diseñe un algoritmo que permita resolver cada uno de los ejercicios enunciados a continuación:

    1- Leer los datos de un automóvil en la forma ¨Marca¨ seguida de ¨Modelo¨, y escribir en la forma ¨Modelo¨ seguido por ¨Marca¨. (a)
    2- Convertir una suma en dólares a PESOS. Se debe prever que el valor de conversión puede cambiar. (b)
}

{
Acción problema_b ES;
Ambiente
	dólares: real;
	tipo_de_cambio: real;
	conversión: real;
	
Proceso
	escribir('Ingrese la suma en dólares que desee saber su valor en pesos argentinos.');
	leer('dólares');
	escribir('Ingrese el valor actual de un (1) dólar con respecto a un (1) peso argentino.');
	leer(tipo_de_cambio);
	
	conversión:= dólares * tipo_de_cambio;
	
	escribir('El valor en pesos del monto ingresado en dólares es >> ', conversión);

	//********** Ejemplo de la operación **********//
	// 1dol ------ 0.2pes                          //
	// 2dol ------  x ======> 2dol * 0.2pes / 1dol //
	//*********************************************// 
Fin.
}

Program problema_b;
var
	dolares: real;
	tipo_de_cambio: real;
	conversion: real;
// Pascal no acepta tildes en la declaración de variables o constantes. //
Begin
	writeln('Ingrese el monto en dólares que desee saber su valor en pesos argentinos.');
	readln(dolares);
	writeln('Ingrese el valor actual de un (1) dólar con respecto a un (1) peso argentino.');
	readln(tipo_de_cambio);
	
	conversion:= dolares * tipo_de_cambio;
	
	writeln('El valor en pesos argentinos del monto en dólares ingresado es de >> ', conversion:0:2, 'ARS');
End.

