
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
	

Begin
	assign(arch_al, 'entrada.dat');
	reset(arch_al);
	//read(arch_al, reg_al);
	
	While not eof(arch_al) do
	begin
		read(arch_al, reg_al);
		writeln(reg_al.ayn);
		writeln(reg_al.car);
		writeln(reg_al.leg);
		writeln(reg_al.f_n.dd);
		writeln(reg_al.f_n.mm);
		writeln(reg_al.f_n.aaaa);
		writeln(reg_al.f_i.dd);
		writeln(reg_al.f_i.mm);
		writeln(reg_al.f_i.aaaa);
		writeln(reg_al.dni);
		writeln(reg_al.sex);
		writeln(reg_al.f_e.dd);
		writeln(reg_al.f_e.mm);
		writeln(reg_al.f_e.aaaa);
		writeln(reg_al.nota);		
	end;
	
	close(arch_al);
End.
