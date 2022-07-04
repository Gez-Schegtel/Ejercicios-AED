
{
Una fábrica textil produce telas de dos calidades distintas (primera y segunda) y de dos materiales distintos (seda y algodón). Generar un algoritmo que calcule el peso de varias piezas de tela, el cual está dado por la suma del peso neto, más un porcentaje por el apresto, más el peso del núcleo de cartón. Para realizar el cálculo, tener en cuenta la siguiente información, para cada pieza:

    El peso del m2 y la longitud de cada pieza.
    
    Al peso neto de la tela hay que sumarle un porcentaje por cada pieza, debido al apresto, el cual es del 2% para las telas de seda y del 7% para las de algodón.
    
    También se debe considerar el núcleo de cartón, que es de 400 gr. para los rollos de telas de primera y de 300 gr. en los de segunda.

Finalizar cuando la variable FIN sea igual a 'SI'.

2 telas ....> primera 
	 ....> segunda
	 
2 calidades ....> seda 
	     ....> algodón
	     
	     Calcular el peso de varias piezas.
	     
	     peso net + %apresto + peso núcleo cart 
	     
//** No entendí muy bien la consigna, así que para hacer el algoritmo supuse que las piezas de tela son cuadradas, así por cada metro de tela tengo un metro cuadrado también **//

	 __
	|	|------------------|
	|	|------------------|
	|	|------------------|
	|	|------------------|
	1m	|------------------|
	| 	|------------------|
	|	|------------------|
	|	|------------------|
	|__	|------------------|

		|________1m________|

Acción 1131 ES;
Ambiente
	calidad: (1, 2);
	material: ('seda', 'algodón'); 
	peso: real;
	long: real; 
	peso_tot: real;
	FIN: ('si', 'no');
	
Proceso 
	repetir
		esc('Ingrese la calidad de la tela (1 o 2) y el material de la misma (seda o algodón): '):
		leer(calidad); 
		leer(material);
		
		esc('Ingrese el peso del metro cuadrado y la longitud de la pieza.');
		leer(peso);
		leer(long);

		si (calidad = 1) and (material = 'seda') entonces
			peso_tot:= ((peso * long) * 1.02) + 400;
		sino
			si (calidad = 1) and (material = 'algodón') entonces
				peso_tot:= ((peso * long) * 1.07) + 400;
			sino
				si (calidad = 2) and (material = 'seda') entonces
					peso_tot:= ((peso * long) * 1.02) + 300;
				sino
					si (calidad = 2) and (material = 'aldogón') entonces
						peso_tot:= ((peso * long) * 1.07) + 300;
					fin_si
				fin_si
			fin_si
		fin_si
		
		esc('El peso de la pieza es >> ', peso_tot, 'gr.');
		
		esc('¿Desea terminar el proceso? ---> si ; ---> no');
		leer(FIN);
	hasta que (FIN = 'si');	
Fin_Acción.
}

//** Usé tildes en las comparaciones porque utilizo GNU/Linux y no tengo drama con ningún tipo de símbolo. En Windows pedorro no sé si va a tomar **//

program tela;
var 
	calidad: integer;
	material: string; 
	peso: real;
	long: real; 
	peso_tot: real;
	FIN: string;
	
Begin  
	repeat
		writeln('Ingrese la calidad de la tela (1 o 2) y el material de la misma (seda o algodón): ');
		readln(calidad); 
		readln(material);
		
		writeln('Ingrese el peso del metro cuadrado y la longitud de la pieza.');
		readln(peso);
		readln(long);

		if (calidad = 1) and (material = 'seda') then
		begin
			peso_tot:= ((peso * long) * 1.02) + 400;
		end
		else
			if (calidad = 1) and (material = 'algodón') then
			begin
				peso_tot:= ((peso * long) * 1.07) + 400;
			end
			else
				if (calidad = 2) and (material = 'seda') then
				begin
					peso_tot:= ((peso * long) * 1.02) + 300;
				end
				else
					if (calidad = 2) and (material = 'algodón') then
					begin
						peso_tot:= ((peso * long) * 1.07) + 300;
					end;
		
		writeln('El peso de la pieza es >> ', peso_tot:0:2, 'gr.');
		
		writeln('¿Desea terminar el proceso? ---> si ; ---> no');
		readln(FIN);
	
	until (FIN = 'si');	
End.











