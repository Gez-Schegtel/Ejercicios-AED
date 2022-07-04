
{
Dada una secuencia de letras del alfabeto que finaliza con la letra "Z", contar cuantas consonantes hay en la secuencia.

// No se trata el último elemento, entonces se usa un ciclo pre-test

Acción 212 ES;
Ambiente
	sec: secuencia de caracter;
	v: caracter;
	cont_cons: entero;
	
	vocales = ['a', 'e', 'i', 'o', 'u'];

Proceso
	arr(sec);
	avz(sec, v);
	
	cont_cons:= 0;
	repetir
		si (v no en(vocales)) entonces
			cont_cons:= cont_cons + 1;
		fin_si
		
		avz(sec, v);
	hasta que (v = 'Z');
	
	esc('Hay ', cont_cons, ' consonantes en la secuencia.');
	
	cerrar(sec);
Fin_Acción.
}

program something;
const
	vocales = ['a', 'e', 'i', 'o', 'u'];
var
	sec: text;
	v: char;
	
	cont_cons: integer;
	
Begin
	assign(sec, 'text_sec.txt');
	reset(sec);
	read(sec, v);
	
	cont_cons:= 0;
	repeat
		if not(v in(vocales)) then
		begin
			cont_cons:= cont_cons + 1;
		end;
		read(sec, v);
		
	until (v = 'z');
	
	writeln('Hay ', cont_cons, ' consonantes en la secuencia.');
	
	close(sec);
End.




