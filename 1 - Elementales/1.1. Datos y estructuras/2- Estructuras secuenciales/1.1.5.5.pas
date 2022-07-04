
{

Se desea calcular el valor de la sección (S) de un conductor, la cual se determina en función de la corriente eléctrica I y de la conductividad C del material (C=I/S). Además, a la sección así obtenida se le incrementa un 25% por razones de seguridad.

Acción 155 ES;
Ambiente
	s: real;
	i: real;
	c: real;
	
	safety = 1.25;
	
Proceso
	esc('Ingrese el valor de la intensidad eléctrica >> ');
	leer(i);
	
	esc('Ingrese el valor de la conductividad del material >> ');
	leer(c);
	
	s:= i / c;
	
	esc('El valor de la sección del conductor es de >> ', s * safety);

Fin.

}

{
Program conduct;
var
	s: real;
	i: real;
	c: real;
const
	safety = 1.25;
	
Begin
	write('Ingrese el valor de la intensidad eléctrica >> ');
	readln(i);
	
	write('Ingrese el valor de la conductividad del material >> ');
	readln(c);
	
	s:= i / c;
	
	writeln('El valor de la sección del conductor es de >> ', (s * safety):0:2);

End.
}

Program conduct;
var
	s: real;
	i: real;
	c: real;
	
Begin
	write('Ingrese el valor de la intensidad eléctrica >> ');
	readln(i);
	
	write('Ingrese el valor de la conductividad del material >> ');
	readln(c);
	
	s:= (i / c)*1.25;
	
	writeln('El valor de la sección del conductor es de >> ', s:0:2);

End.













