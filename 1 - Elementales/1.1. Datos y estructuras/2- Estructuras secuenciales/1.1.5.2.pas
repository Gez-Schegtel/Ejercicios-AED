{

Las raíces de una ecuación de segundo grado ax2+bx+c=0 son reales si y sólo si el discriminante dado por (b2−4ac) no es negativo. Se desea leer el valor de los coeficientes a, b, c e imprimir el resultado del discriminante. Realizar prueba de escritorio.

}

{
Acción 1.5.2 ES;
Ambiente
	a: real;
	b: real;
	c: real;
	disc: real;

Proceso
	esc('Ingrese el coeficiente a ');
	leer(a);
	esc('Ingrese el coeficiente b ');
	leer(b);
	esc('Ingrese el coeficiente c ');
	leer(c);
	
	disc:= b*2 - 4*a*c;
	
	esc('El discriminante es >> ', disc);
	
	Si disc >= 0 entonces
		esc('Las raíces son reales.');
	sino
		esc('Las raíces no son reales.');
	fin si 
Fin_Acción.
}

Program roots;
uses math;
var
	a: real;
	b: real;
	c: real;
	disc: real;

Begin
	writeln('Ingrese el coeficiente "a" ');
	readln(a);
	writeln('Ingrese el coeficiente "b" ');
	readln(b);
	writeln('Ingrese el coeficiente "c" ');
	readln(c);
	
	disc:= b**2 - 4*a*c;
	
	writeln('El discriminante es >> ', disc:0:2);
	
End.

