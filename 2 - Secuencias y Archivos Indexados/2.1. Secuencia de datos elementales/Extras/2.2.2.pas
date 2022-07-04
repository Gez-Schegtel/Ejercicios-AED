
{
Dada una secuencia de caracteres de entrada, desarrollar un algoritmo que produzca 2 secuencias de salida, una con los caracteres "numéricos" y otra con los que no lo son.

Informar al final, cantidad de caracteres de cada secuencia de salida

Ejemplo: Si en la secuencia de entrada viniera A125EB% en la salida debería ir

salida1 --> 125

salida2 --> AEB%


Acción 222 ES;
Ambiente
	nums = ('1', '2', '3', '4', '5', '6', '7', '8', '9');

	sec: secuencia de caracter;
	v: caracter;
	
	sally1: secuencia de caracter;
	sally2: secuencia de caracter;
	
	conts1: entero;
	conts2: entero;
	
Proceso
	arr(sec);
	avz(sec, v);
	
	crear(sally1);
	crear(sally2);
	
	conts1:= 0;
	conts2:= 0;
	
	Mientras NFDS(sec) hacer
		
		si (v en nums) entonces
			esc(sally1, v);
			conts1:= conts1 + 1;
		sino
			esc(sally2, v);
			conts2:= conts2 + 1;
		fin_si 	
		
		avz(sec, v);
		
	Fin_Mientras
	
	esc('Caracteres en la secuencia de salida 1 >> ', conts1);
	esc('Caracteres en la secuencia de salida 2 >> ', conts2);
	
	cerrar(sec);
	cerrar(sally1);
	cerrar(sally2);
	
Fin_Acción.
}



program something;
const
	nums = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
var
	sec: text;
	v: char;
	
	sally1: text;
	sally2: text;
	
	conts1: integer;
	conts2: integer;
	
Begin
	assign(sec, 'entrada2.txt');
	reset(sec);
	read(sec, v);
	
	assign(sally1, 'salida12.txt');
	rewrite(sally1);
	
	assign(sally2, 'salida22.txt');
	rewrite(sally2);
	
	conts1:= 0;
	conts2:= 0;
	
	while not eof(sec) do 
	begin
	
		if (v in nums) then
		begin
			write(sally1, v);
			conts1:= conts1 + 1;
		end
			else
			begin
				write(sally2, v);
				conts2:= conts2 + 1;
			end; 	
			
		read(sec, v);
		
	end;
	
	writeln('Caracteres en la secuencia de salida 1 >> ', conts1);
	writeln('Caracteres en la secuencia de salida 2 >> ', conts2);
	
	close(sec);
	close(sally1);
	close(sally2);
	
End.


