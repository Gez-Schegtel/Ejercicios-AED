{

Se desea comprar una PC y una impresora. Calcular el precio total: el cual está dado por la suma de los precios de costos, los porcentajes de ganancia del vendedor y un 21% de IVA. Supóngase una ganancia del vendedor del 12% por la PC y 7% por la impresora. Se leen los costos y se imprimen el precio total de ventas.

Acción 1.5.3 ES;
Ambiente
	p_com: real;
	p_imp: real;
	
	g_com: real;
	g_imp: real;
	tot_sIVA: real;
	tot_cIVA: real;

Proceso
	esc('Ingrese el precio de la computadora.');
	leer(p_com);
	
	esc('Ingrese el precio de la impresora.');
	leer(p_imp);

	g_com:= p_com * 1.12;
	
	g_imp:= p_imp * 1.07;
	
	tot_sIVA:= g_com + g_imp;
	
	tot_cIVA:= tot_sIVA * 1.21;
	
	esc('El precio total es >> ', tot_cIVA);	
	
Fin.

}

Program calqsell;
var
	p_com: real;
	p_imp: real;

	g_com: real;
	g_imp: real;
	tot_sIVA: real;
	tot_cIVA: real;

Begin
	writeln('Ingrese el precio de la computadora.');
	readln(p_com);
	
	writeln('Ingrese el precio de la impresora.');
	readln(p_imp);
	
	g_com:= p_com * 1.12;
	
	g_imp:= p_imp * 1.07;
	
	tot_sIVA:= g_com + g_imp;
	
	tot_cIVA:= tot_sIVA * 1.21;
	
	writeln('El precio total a pagar es >> ', tot_cIVA:0:2);
End.









