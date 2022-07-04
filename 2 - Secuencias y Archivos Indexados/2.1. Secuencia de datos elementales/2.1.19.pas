

{
Dada una secuencia de caracteres, generar otra secuencia con todas las palabras de tres caracteres. Informar el porcentaje de las mismas, sobre el total de palabras de la secuencia de entrada. Considerar que puede haber más de un blanco entre palabras.

 hola   che river plate FDS

Acción 2119 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;

	sally: secuencia de caracter;

	contlet: entero;
	contpal: entero;
	contres; entero;

	res1: caracter;
	res2: caracter;
	res3: caracter;

Proceso
	arr(sec);
	avz(sec, v);

	crear(sally);

	contpal:= 0;
	contres:= 0;

	Mientras NFDS(sec) hacer

		mientras (v = ' ') hacer
			avz(sec, v);
		fin_mientras

		contpal:= contpal + 1;
		contlet:= 0;

		mientras (v <> ' ') y NFDS(sec) hacer
			contlet:= contlet + 1;

			según (contlet) hacer
				1: res1:= v;
				2: res2:= v;
				3: res3:= v;
			fin_según

			avz(sec, v);
		fin_mientras

		si (contlet = 3) entonces
			esc(sally, res1);
			esc(sally, res2);
			esc(sally, res3);
			esc(sally, ' ');
			contres:= contres + 1;
		fin_si

		avz(sec, v);
	Fin_Mientras

	esc('El porcentaje de palabras de 3 caracteres es >> ', (contres*100)/contpal);
	cerrar(sec);
Fin_Acción.
}


Program something;
var
	sec: text;
	v: char;

	sally: text;

	contlet: integer;
	contpal: integer;
	contres: integer;

	res1: char;
	res2: char;
	res3: char;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);

	assign(sally, 'salida19.txt');
	rewrite(sally);

	contpal:= 0;
	contres:= 0;

	while not eof(sec) do
	begin

		while (v = ' ') do
		begin
			read(sec, v);
		end;

		contpal:= contpal + 1;
		contlet:= 0;

		while (v <> ' ') and not eof(sec) do
		begin
			contlet:= contlet + 1;

			case (contlet) of
				1: res1:= v;
				2: res2:= v;
				3: res3:= v;
			end;

			read(sec, v);
		end;

		if (contlet = 3) then
		begin
			write(sally, res1);
			write(sally, res2);
			write(sally, res3);
			write(sally, ' ');
			contres:= contres + 1;

			//Puse esto porque en Pascal no se graba en la salida así como puse.
			write(res1);
			write(res2);
			writeln(res3);
		end;

		read(sec, v);
	end;

	writeln('El porcentaje de palabras de 3 caracteres es >> ', (contres*100)/contpal:0:2, '%');
	close(sec);

End.
