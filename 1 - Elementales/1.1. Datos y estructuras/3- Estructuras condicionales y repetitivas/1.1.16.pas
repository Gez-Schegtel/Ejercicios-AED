
{

    1- Diseñe un algoritmo que obtenga el porcentaje de alumnos de ISI, IQ e IEM, sobre el total de egresados de la UTN-FRRe de un año.
    
    2- Modifique el algoritmo del punto 1. para que permita obtener e informar los mismos porcentajes pero para varias Facultades (¿se refiere a otras regionales?) y al final emitir el 		total de alumnos por carrera y total general.


acción 1116_1 ES;
ambiente
	isi: entero;
	iem: entero;
	iq: entero;
	tot: entero;
	perisi: real;
	periem: real;
	periq: real;
	
Proceso
	esc('Ingrese cuántos alumnos de ISI se recibieron el último año lectivo.');
	leer(isi);
	esc('Ingrese cuántos alumnos de IEM se recibieron el último año lectivo.');
	leer(iem);
	esc('Ingrese cuántos alumnos de IQ se recibieron el último año lectivo.')
	leer(iq);
	
	tot:= isi + iem + iq;
	perisi:= (isi / tot) * 100;
	periem:= (iem / tot) * 100;
	periq:= (iq / tot) * 100;
	
	esc('Los alumnos de ISI representan un ', perisi, '% del total.');
	esc('Los alumnos de ISI representan un ', periem, '% del total.');
	esc('Los alumnos de ISI representan un ', periq, '% del total.');
	
Fin_Acción.


program dieciseis;
var 
	isi: integer;
	iem: integer;
	iq: integer;
	tot: integer;
	perisi: real;
	periem: real;
	periq: real;
	
Begin
	writeln('Ingrese cuántos alumnos de ISI se recibieron el último año lectivo.');
	readln(isi);
	writeln('Ingrese cuántos alumnos de IEM se recibieron el último año lectivo.');
	readln(iem);
	writeln('Ingrese cuántos alumnos de IQ se recibieron el último año lectivo.');
	readln(iq);
	
	tot:= isi + iem + iq;
	perisi:= (isi / tot) * 100;
	periem:= (iem / tot) * 100;
	periq:= (iq / tot) * 100;
	
	writeln('Los alumnos de ISI representan un ', perisi:0:2, '% del total.');
	writeln('Los alumnos de ISI representan un ', periem:0:2, '% del total.');
	writeln('Los alumnos de ISI representan un ', periq:0:2, '% del total.');
	
End.


Acción diecisies_dos ES;;

	isi: entero;
	iem: entero;
	iq: entero;
	tot: entero;
	perisi: real;
	periem: real;
	periq: real;
	op: ('s', 'n');
	regional: alfanumérico;
	res_perisi: real; 
	res_periem: real;    
	res_periq: real;

Proceso
	res_perisi:= 0
	res_periem:= 0
	res_periq:= 0
	
	esc('Ingrese >> s << para empezar el proceso.');
	leer(op);
	
	Mientras (op = 's') hacer
	
		esc('Ingrese el nombre de la facultad sobre la que se realizará la estadística.');
		leer(regional);
		esc('Ingrese cuántos alumnos de ISI se recibieron el último año lectivo.');
		leer(isi);
		esc('Ingrese cuántos alumnos de IEM se recibieron el último año lectivo.');
		leer(iem);
		esc('Ingrese cuántos alumnos de IQ se recibieron el último año lectivo.')
		leer(iq);
		
		tot:= isi + iem + iq;
		perisi:= (isi / tot) * 100;
		periem:= (iem / tot) * 100;
		periq:= (iq / tot) * 100;
		
		res_perisi:= res_perisi + isi;
		res_periem:= res_periem + iem;
		res_periq:= res_periq + iq;
		
		esc('Los datos de la regional ', regional, ' son los siguientes: ');
		esc('Los alumnos de ISI representan un ', perisi, '% del total.');
		esc('Los alumnos de ISI representan un ', periem, '% del total.');
		esc('Los alumnos de ISI representan un ', periq, '% del total.');
	
		esc('¿Quiere ingresar datos de otra facultad? s/n');
		leer(op);
	Fin_Mientras
	
	esc('El total de alumnos de ISI es >> ', res_perisi);
	esc('El total de alumnos de IEM es >> ', res_periem);
	esc('El total de alumnos de IQ es >> ', res_periq);
	esc('El total general de alumnos es >> ', (res_perisi + res_periem + res_periq));
	
Fin_Acción.

}

program diecisies_dos;
var
	isi: integer;
	iem: integer;
	iq: integer;
	tot: integer;
	perisi: real;
	periem: real;
	periq: real;
	op: char;
	regional: string;
	res_perisi: real; 
	res_periem: real;    
	res_periq: real;
	tot_gen: real;

Begin
	res_perisi:= 0;
	res_periem:= 0;
	res_periq:= 0;
	
	writeln('Ingrese >> s << para empezar el proceso.');
	readln(op);
	
	While (op = 's') do
	begin
		
		writeln('Ingrese el nombre de la facultad sobre la que se realizará la estadística.');
		readln(regional);
		writeln('Ingrese cuántos alumnos de ISI se recibieron el último año lectivo.');
		readln(isi);
		writeln('Ingrese cuántos alumnos de IEM se recibieron el último año lectivo.');
		readln(iem);
		writeln('Ingrese cuántos alumnos de IQ se recibieron el último año lectivo.');
		readln(iq);
		
		tot:= isi + iem + iq;
		perisi:= (isi / tot) * 100;
		periem:= (iem / tot) * 100;
		periq:= (iq / tot) * 100;
		
		res_perisi:= res_perisi + isi;
		res_periem:= res_periem + iem;
		res_periq:= res_periq + iq;
		
		writeln('Los datos de la regional ', regional, ' son los siguientes: ');
		writeln('Los alumnos de ISI representan un ', perisi:0:2, '% del total.');
		writeln('Los alumnos de ISI representan un ', periem:0:2, '% del total.');
		writeln('Los alumnos de ISI representan un ', periq:0:2, '% del total.');
	
		writeln('¿Quiere ingresar datos de otra facultad? s/n');
		readln(op);
	end;
	
	tot_gen:= res_perisi + res_periem + res_periq;
	
	writeln('El total de alumnos de ISI es >> ', res_perisi:0:2, ' , lo que representa un ', ((res_perisi/tot_gen)*100):0:2, '% del total.');
	writeln('El total de alumnos de IEM es >> ', res_periem:0:2, ' , lo que representa un ', ((res_periem/tot_gen)*100):0:2, '% del total.');
	writeln('El total de alumnos de IQ es >> ', res_periq:0:2, ' , lo que representa un ', ((res_periq/tot_gen)*100):0:2, '% del total.');
	writeln('El total general de alumnos es >> ', tot_gen:0:2);
	
End.






