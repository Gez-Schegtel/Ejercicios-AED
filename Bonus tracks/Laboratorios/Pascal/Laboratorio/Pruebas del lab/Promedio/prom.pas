program promedio;
uses crt; 
var
	sec: text;
	v: char;
	
	viajes_tot: integer; 
	convert: integer;
	km_tot: integer; 
	p: integer;
	i: integer;
	prom: real; 

Begin 
	assign(sec,'entrada.txt');
	{$I-}
	reset(sec);
	{$I+}
	if IOResult <> 0 then
	begin
		writeln('No existe el archivo .txt');
		halt(2);
	end;
	read(sec, v);

	viajes_tot:= 0;
	km_tot:= 0;

	while (v <> '*') do 
	begin
		viajes_tot:= viajes_tot + 1;
		for i:= 1 to 2 do 
		begin
			while (v <> '/') do 
			begin
				read(sec, v);
			end;
			read(sec, v);
		end;
		
		for i:= 1 to 4 do 
		begin
			read(sec, v);
		end;
		
		p:= 1000;
		convert:= 0;
		for i:= 1 to 4 do
		begin
			case (v) of
				'0': convert:=  convert + (0*p);
				'1': convert:=  convert + (1*p);
				'2': convert:=  convert + (2*p);
				'3': convert:=  convert + (3*p);
				'4': convert:=  convert + (4*p);
				'5': convert:=  convert + (5*p);
				'6': convert:=  convert + (6*p);
				'7': convert:=  convert + (7*p);
				'8': convert:=  convert + (8*p);
				'9': convert:=  convert + (9*p);
			end;
			
			p:= p div 10;
			read(sec, v);
		end;
		km_tot:= km_tot + convert;
		
		while (v <> '+') do 
		begin
			read(sec, v);
		end;
		read(sec, v);
				
	end;

	prom:= km_tot/viajes_tot;
	writeln('El promedio de la distancias recorridas por la cantidad de viajes que se realizaron es igual a >> ', prom:3:2);

	close(sec);
End.











































