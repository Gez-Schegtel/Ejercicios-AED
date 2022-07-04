


program something;
const
	vocales_n = ['1', '2', '3', '4', '5'];
var
	sec: text;
	v: char;
	
	sally: text;

	paridad: integer;
	control_modif: integer;
	contor: integer;
	cont_modif: integer;
	cont_nomodif: integer;
	contor_modif: integer;
	contor_nomodif: integer;
Begin
	assign(sec, 'entrada1.txt');
	reset(sec);
	read(sec, v);
	
	assign(sally, 'salida1.txt');
	rewrite(sally);
	
	contor_modif:= 0;
	contor_nomodif:= 0;
	cont_modif:= 0;
	cont_nomodif:= 0;
	
	while not eof(sec) do
	begin
		
		paridad:= 0;
		control_modif:= 0;
		
		while (v <> '.') do
		begin	
			while (v = ' ') do
			begin
				read(sec, v);				
			end;
			
			if (control_modif = 1) then
			begin
				cont_modif:= cont_modif + 1;
			end
			else
				begin
					cont_nomodif:= cont_nomodif + 1;
				end;
		
			paridad:= paridad + 1;
			
			if (paridad mod 2 = 0) then
			begin
				while (v <> ' ') and (v <> '.') do
				begin
					if (v in vocales_n) then
					begin
						case (v) of
							'1': write(sally, 'a');
							'2': write(sally, 'e');
							'3': write(sally, 'i');
							'4': write(sally, 'o');
							'5': write(sally, 'u');
						end;
						
						control_modif:= 1;
					end
					else
						begin
							write(sally, v);
						end;
					
					read(sec, v);
				end;	
			end
			else
				begin
					while (v <> ' ') and (v <> '.') do
					begin
						write(sally, v);
						read(sec, v);
					end;
				end;
			
			
		end;
		
		if (control_modif = 1) then
		begin
			contor_modif:= cont_modif + 1;
		end
		else
			begin
				contor_nomodif:= cont_nomodif + 1;
			end;
	
		read(sec, v);
		
	end;
	
	writeln(contor_modif);
	writeln(contor_nomodif);
	writeln(cont_modif + cont_nomodif);
	
	writeln('Palabras modificadas >> ', cont_modif);
	writeln('Palabras sin modificar >> ', cont_nomodif);
	writeln('Promedio de palabras modificadas por oración >> ', cont_modif/contor:0:5);
	
	close(sec);
	close(sally);
End.


