
Program leer_archivo;
uses Crt;
type
	Clientes = Record
		num_cuenta: longint;
		cod_client: integer;
		      tipo: string[9];
		   titular: string[50];
		     saldo: real;
		      baja: char;
	end;

var
	ArchClient: file of Clientes;
	 RegClient: Clientes;
	    option: char;

Begin
	repeat
		Assign(ArchClient, 'Archivo_de_clientes.dat');
		{$I-}
		Reset(ArchClient);
		{$I+}
		if IOResult <> 0 then
			begin
				Writeln('');
				TextColor(LightRed);
				Writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
				TextColor(Yellow);
				Writeln('No se encontro el archivo. Si no existe, lo puede crear ejecutando el programa "Generar_archivo", disponible en el mismo directorio donde se esta ejecutando este programa.');
				TextColor(LightRed);
				Writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
				TextColor(LightRed);
				Writeln('');
				Writeln('Presione cualquier tecla para finalizar.');
				ReadKey();
			end;
			writeln('');
	
		while not eof(ArchClient) do
			begin
				TextColor(LightGray);
				writeln('=====================================');
				with RegClient do
					begin
						read(ArchClient, RegClient);
						TextColor(LightCyan);
						write(' Numero de cuenta >> ');
						TextColor(White);
						writeln(num_cuenta);
						TextColor(LightCyan);
						write(' Codigo de cliente >> ');
						TextColor(White);
						writeln(cod_client);
						TextColor(LightCyan);
						write(' Tipo de cuenta >> ');
						TextColor(White);
						writeln(tipo);
						TextColor(LightCyan);
						write(' Titular >> ');
						TextColor(White);
						writeln(titular);
						TextColor(LightCyan);
						write(' Saldo >> ');
						TextColor(White);
						writeln('$',saldo:0:2);
						TextColor(LightCyan);
						write(' Dado de baja >> ');
						TextColor(White);
						writeln(baja);
					end;
				Delay(1000);
			end;
		TextColor(LightGray);
		writeln('=====================================');
		TextColor(White);
		Close(ArchClient);
		writeln('');
		TextColor(LightGray);
		Write('Para leer de nuevo el archivo, presione');
		TextColor(Yellow);
		Writeln(' ENTER.');
		TextColor(LightGray);
		Writeln('Para finalizar, presione cuaquier tecla.');
		Writeln('');
		option:= readkey;
	until (option <> #13);
	
End.