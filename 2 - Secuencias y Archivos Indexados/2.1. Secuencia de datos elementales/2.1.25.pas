
{
Dada una secuencia texto de entrada que contiene palabras alfanuméricas, escribir un algoritmo que genere dos secuencias de salida. Una de ellas contendrá solo las palabras de la secuencia original que comienzan con vocal, en las cuales se reemplazarán todas las vocales por ‘#’, por ejemplo: entrada 'avión1', salida '#v##n1' y la otra será una secuencia numérica en la que se almacenarán las cantidades de vocales que se encontraron en cada una de las palabras que cumplieron la condición. Por final de proceso se deberá informar el promedio de palabras por oración.


entrada ==> alice in chains. river of deceit.FDS
salida1 ==> #l#c# #n #f
salida2 ==> 3 1 1


Acción 2125 ES;
Ambiente
	vocales = ('a', 'e', 'i', 'o', 'u');

	sec: secuencia de caracter;
	v: caracter;

	sally1: secuencia de caracter;
	sally2: secuencia de entero;

	contor: entero;
	contpal: entero;
	contvoc: entero;

Proceso
	arr(sec);
	avz(sec, v);

	crear(sally1);
	crear(sally2);

	contor:= 0;
	contpal:= 0;

	Mientras NFDS(sec) hacer

		mientras (v <> '.') hacer

			mientras (v = ' ') hacer
				avz(sec, v);
			fin_mientras

			contpal:= contpal + 1;

			si (v en vocales) entonces

				contvoc:= 0;
				mientras (v <> ' ') y (v <> '.') hacer

					si (v en vocales) entonces
						esc(sally1, '#');
						contvoc:= contvoc + 1;
					sino
						esc(sally1, v);
					fin_si

					avz(sec, v);

				fin_mientras

				esc(sally2, contvoc);
			sino

				mientras (v <> ' ') y (v <> '.') hacer

					avz(sec, v);

				fin_mientras

			fin_si

		fin_mientras

		contor:= contor + 1;
		avz(sec, v);

	Fin_Mientras

	esc('El promedio de palabras por oración es ', contpal/contor);

	cerrar(sec);
	cerrar(sally1);
	cerrar(sally2);
Fin_Acción.
}

program something;
type
	secuencia_de_entero = file of integer;
const
	vocales = ['a', 'e', 'i', 'o', 'u'];
var
	sec: text;
	v: char;

	sally1: text;
	sally2: secuencia_de_entero;

	contor: integer;
	contpal: integer;
	contvoc: integer;

Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);

	assign(sally1, 'salida125.txt');
	rewrite(sally1);

	assign(sally2, 'salida225.dat');
	rewrite(sally2);

	contor:= 0;
	contpal:= 0;

	While not eof(sec) do
	begin
		while (v <> '.') do
		begin 

			while (v = ' ') do
			begin
				read(sec, v);
			end;

			contpal:= contpal + 1;

			if (v in vocales) then
			begin
				contvoc:= 0;
				while (v <> ' ') and (v <> '.') do
				begin
					if (v in vocales) then
					begin
						write(sally1, '#');
						contvoc:= contvoc + 1;
					end
					else
						begin
							write(sally1, v);
						end;

					read(sec, v);
				end;

				write(sally2, contvoc);
			end
			else
				begin
					while (v <> ' ') and (v <> '.') do
					begin

						read(sec, v);

					end;
				end;

		end;

		contor:= contor + 1;
		read(sec, v);
	end;

	writeln('El promedio de palabras por oración es ', contpal/contor:0:2);

	close(sec);
	close(sally1);
	close(sally2);
End.
