Program carga;
uses crt;
var
	option: char;
Begin
	repeat
		Writeln('Decir hola >> ENTER');
		Writeln('Salir >> ESC');
		option:= readkey;
		if (option = #13) then
		begin
			while (option = #13) do
			begin
				Writeln('Hola.');
				Writeln('Volver a decir hola >> ENTER');
				Writeln('Salir >> ESC');
				option:= readkey;
					if (option = #27) then
					begin
						Writeln('Bueno, chau.');
						Delay(500);
					end
					else
						Writeln('Ingresaste cualquier cosa.');
			end;
		end
		else
			if (option = #27) then
			begin
				Writeln('Bueno, chau.');
				Delay(500);
			end
			else
				Writeln('Ingresaste cualquier cosa.');
	until (option = #13) or (option = #27);
End.