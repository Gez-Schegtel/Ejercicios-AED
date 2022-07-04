
{
Escriba un algoritmo que permita conocer la edad de una persona, con solo ingresar la fecha de nacimiento y la fecha actual, ambas en el formato: DIA, MES, AÑO

Acción birthday ES;
Ambiente
	da: entero;
	ma: entero;
	aa: entero;
	
	dn: entero;
	mn: entero;
	an: entero;
	
	resaño: entero;
	
Proceso
	esc('Ingrese la fecha actual en formato dd/mm/aaaa');
	leer(da);
	leer(ma);
	leer(aa);
	
	esc('Ingrese su fecha de nacimiento en formato dd/mm/aaaa');
	leer(dn);
	leer(mn);
	leer(an);
	
	resaño:= aa - an;
	
	Si (ma < md) entonces
		resaño:= resaño - 1;
	sino
		si (ma = md) and (da < dn) entonces
			resaño:= resaño - 1;	
		fin si 			
	Fin si
	
	esc('Tu edad es >> ', resaño);	
	
Fin_Acción.
}

{
Program birthday;
var
	da: integer;
	ma: integer;
	aa: integer;

	dn: integer;
	mn: integer;
	an: integer;
	
	resano: integer;
	
Begin
	writeln('Ingrese la fecha actual en formato dd/mm/aaaa');
	readln(da);
	readln(ma);
	readln(aa);
	
	writeln('Ingrese su fecha de nacimiento en formato dd/mm/aaaa');
	readln(dn);
	readln(mn);
	readln(an);
	
	resano:= aa - an;
	
	if (ma < mn) then
	begin
		resano:= resano - 1;
	end
	else
		if ((ma = mn) and (da < dn)) then
		begin
			resano:= resano - 1;	
		end; 			
	
	writeln('Tu edad es >> ', resano);	
	
End.
}

{
=================
Versión mejorada:
Acción birthday ES;
Ambiente
	da: entero;
	ma: entero;
	aa: entero;
	
	dn: entero;
	mn: entero;
	an: entero;
	
	resaño: entero;
	
Proceso
	esc('Ingrese la fecha actual en formato dd/mm/aaaa');
	leer(da);
	leer(ma);
	leer(aa);
	
	esc('Ingrese su fecha de nacimiento en formato dd/mm/aaaa');
	leer(dn);
	leer(mn);
	leer(an);
	
	resaño:= aa - an;
	
	Si (ma < md) or ((ma = md) and (da < dn)) entonces
		resaño:= resaño - 1;
	Fin si
	
	esc('Tu edad es >> ', resaño);	
	
Fin_Acción.
}

Program birthday;
var
	da: integer;
	ma: integer;
	aa: integer;

	dn: integer;
	mn: integer;
	an: integer;
	
	resano: integer;
	
Begin
	writeln('Ingrese la fecha actual en formato dd/mm/aaaa');
	readln(da);
	readln(ma);
	readln(aa);
	
	writeln('Ingrese su fecha de nacimiento en formato dd/mm/aaaa');
	readln(dn);
	readln(mn);
	readln(an);
	
	resano:= aa - an;
	
	if (ma < mn) or ((ma = mn) and (da < dn))  then
	begin
		resano:= resano - 1;
	end; 			
	
	writeln('Tu edad es >> ', resano);	
	
End.






































