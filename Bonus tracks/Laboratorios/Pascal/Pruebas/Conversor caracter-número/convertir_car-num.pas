

//En este programa no voy a agregar métodos que controlen las entradas porque
//lo hago para simular la transformación de caracteres que sé que van a estar
//en una secuencia. 
 
program convert;
uses math;
var
	sec: text;
	v: char;
	acuml_convert: integer;
	i: integer;
	
Begin
	assign(sec, 'entrada.txt');
	reset(sec);
	read(sec, v);
	
	while not eof(sec) do 
	begin
		acuml_convert:= 0;
		for i:= 3 downto 0 do 
		begin
			case (v) of
				'0': acuml_convert:= acuml_convert + 0 * 10**i;
				'1': acuml_convert:= acuml_convert + 1 * 10**i;
				'2': acuml_convert:= acuml_convert + 2 * 10**i;
				'3': acuml_convert:= acuml_convert + 3 * 10**i;
				'4': acuml_convert:= acuml_convert + 4 * 10**i;
				'5': acuml_convert:= acuml_convert + 5 * 10**i;
				'6': acuml_convert:= acuml_convert + 6 * 10**i;
				'7': acuml_convert:= acuml_convert + 7 * 10**i;
				'8': acuml_convert:= acuml_convert + 8 * 10**i;
				'9': acuml_convert:= acuml_convert + 9 * 10**i;
			end;
			
			read(sec, v);
		end;
	end;
	
	writeln('El número es >> ', acuml_convert);
	close(sec);

End. 




