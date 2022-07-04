

program creador_de_archivos;
uses crt;
type
	Fecha = Record
		dd: 1..31;
		mm: 1..12;
		aaaa: integer;
	end; 
	
	Alumno = Record
		ayn: string[30];
		car: string[3];
		leg: integer;
		f_n: Fecha;
		f_i: Fecha;
		dni: integer;
		sex: char;
		f_e: Fecha;
		nota: 1..10;	
	end;
	
	archivo_de_Alumno = file of Alumno;

var
	arch_al: archivo_de_Alumno;
	reg_al: Alumno;
	
	option: char;

Begin
	assign(arch_al, 'entrada.dat');
	rewrite(arch_al);
	
	repeat
		write('Nombre >> ');
		readln(reg_al.ayn);
		
		write('Carrera >> ');
		readln(reg_al.car);
		
		write('Legajo >> ');
		readln(reg_al.leg);
		
		writeln('Fecha de nacimiento... ');
		write('Día >> ');
		readln(reg_al.f_n.dd);
		
		write('Mes >> ');
		readln(reg_al.f_n.mm);
		
		write('Año >> ');
		readln(reg_al.f_n.aaaa);
		
		writeln('Fecha de ingreso... ');
		write('Día >> ');
		readln(reg_al.f_i.dd);
		
		write('Mes >> ');
		readln(reg_al.f_i.mm);
		
		write('Año >> ');
		readln(reg_al.f_i.aaaa);
		
		write('Documento >> ');
		readln(reg_al.dni);
		
		write('Sexo >> ');
		readln(reg_al.sex);

		writeln('Fecha del último examen aprobado... ');
		write('Día >> ');
		readln(reg_al.f_e.dd);
		
		write('Mes >> ');
		readln(reg_al.f_e.mm);
		
		write('Año >> ');
		readln(reg_al.f_e.aaaa);
		
		write('Nota >> ');
		readln(reg_al.nota);
		
		write(arch_al, reg_al);
		
		writeln('¿Desea ingresar otro alumno? s/n');
		readln(option);
		
	until (upcase(option) = 'N');
	
	close(arch_al);
End.







