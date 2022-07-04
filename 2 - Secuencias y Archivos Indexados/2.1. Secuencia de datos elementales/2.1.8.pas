
{
Teniendo en cuenta el ejercicio anterior, se solicita que la secuencia de salida sea una secuencia de caracteres y los CUIT se separen unos de otros con el caracter "-".

Acción 217 ES;
Ambiente
	sec: secuencia de entero;
	v: entero;
	
	sally: secuencia de caracter; 

	i: entero;
	
Proceso 
	arr(sec);
	avz(sec, v);
	
	crear(sally);
	
	Repetir
		
		si ((v mod 100) div 10 = 0) or ((v mod 100) div 10 = 1) or ((v mod 100) div 10 = 2) or ((v mod 100) div 10 = 3) entonces
			
			para i:= 10 hasta 0, -1 hacer
			
				según ((v div 10**i) mod 10) hacer
					0: esc(sally, '0');
					1: esc(sally, '1');
					2: esc(sally, '2');
					3: esc(sally, '3');
					4: esc(sally, '4');
					5: esc(sally, '5');
					6: esc(sally, '6');
					7: esc(sally, '7');
					8: esc(sally, '8');
					9: esc(sally, '9');
				fin_según
				
			fin_para;
			
			esc(sally, '-');
		fin_si
		
		avz(sec, v);
	
	Hasta (v = 0);

	cerrar(sec);
	cerrar(sally);
Fin_Acción.
}

program something;
uses math;
type
	secuencia_de_entero = file of integer;
var
	sec: secuencia_de_entero;
	v: integer;
	
	sally: text;
	
	i: integer;
	
Begin
	assign(sec, 'num_sec.dat');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida8.txt');
	rewrite(sally);
	
	repeat
		if ((v mod 100) div 10 = 0) or ((v mod 100) div 10 = 1) or ((v mod 100) div 10 = 2) or ((v mod 100) div 10 = 3) then
		begin	
			for i:= 2 downto 0 do //En Pascal no se pueden trabajar con números tan grandes, así que la secuencia de entrada la hice con números de 3 dígitos
			begin
				case ((v div 10**i) mod 10) of
					0: write(sally, '0');
					1: write(sally, '1');
					2: write(sally, '2');
					3: write(sally, '3');
					4: write(sally, '4');
					5: write(sally, '5');
					6: write(sally, '6');
					7: write(sally, '7');
					8: write(sally, '8');
					9: write(sally, '9');
				end;
				
			end;
			write(sally, '-');
		end;
		
		read(sec, v);
		
	until(v = 0);
	
	close(sec);
	close(sally);
End.





