{
Diseñe un algoritmo que permita resolver cada uno de los ejercicios enunciados a continuación:

    1- Leer los datos de un automóvil en la forma ¨Marca¨ seguida de ¨Modelo¨, y escribir en la forma ¨Modelo¨ seguido por ¨Marca¨. (a)
    2- Convertir una suma en dólares a PESOS. Se debe prever que el valor de conversión puede cambiar. (b)
}

{
Acción problema_a ES;
Ambiente
	marca: alfanumérico;
	modelo: alfanumérico;
	
Proceso
	escribir('Por favor, ingrese la marca de su automóvil.');
	leer(marca);
	escribir('Por favor, ingrese el modelo de su automóvil.');
	leer(modelo);
	
	escribir('Su automóvil es un', modelo, ' ', marca);
Fin.
}

Program problema_a;
var
	marca: string;
	modelo: string;
Begin
	writeln('Ingrese la marca de su automóvil, por favor.');
	readln(marca);
	writeln('Ingrese el modelo de su automóvil, por favor.');
	readln(modelo);
	
	writeln('Su automóvil es un ', modelo, ' ', marca);
End.
