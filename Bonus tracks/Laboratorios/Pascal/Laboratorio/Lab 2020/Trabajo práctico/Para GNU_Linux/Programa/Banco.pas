
Program banco;
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

	  ContA: integer;
	  ContB: integer;
	  ContC: integer;
	 Contot: integer;

Begin
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
			Writeln('No se encontro el archivo. Si no existe, lo puede crear ejecutando el programa "Generar_archivo",');
			Writeln('disponible en el mismo directorio donde se esta ejecutando este programa.');
			TextColor(LightRed);
			Writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
			TextColor(LightRed);
			Writeln('');
			Writeln('Presione cualquier tecla para finalizar');
			ReadKey();
		end;

	  ContA:= 0;
	  ContB:= 0;
	  ContC:= 0;
	 Contot:= 0;

	 While not EOF(ArchClient) do
	 	begin
	 		Read(ArchClient, RegClient);
	 		if (RegClient.cod_client MOD 2 = 1) and (RegClient.baja = 'n') then
	 		begin
	 			ContA:= ContA + 1;
	 		end
	 		else
	 			if (RegClient.cod_client MOD 2 = 1) and (RegClient.baja = 'N') then
	 			begin
	 				ContA:= ContA + 1;
	 			end
	 			else
	 				if (RegClient.baja = 'n') or (RegClient.baja = 'N') then
	 				begin
	 					ContB:= ContB + 1;
	 				end
	 				else
	 					if (RegClient.baja = 's') or (RegClient.baja = 'S') then
	 					begin
	 						ContC:= ContC + 1;
	 					end;
	 		Contot:= Contot + 1;
	 	end;
	Close(ArchClient);
	Writeln('');
	TextColor(LightCyan);
	Writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
	TextColor(LightCyan);
	Write('Cuentas activas con codigo de cliente impar >> ');
	TextColor(White);
	Writeln(ContA);
	TextColor(LightCyan);
	Write('Cuentas activas >> ');
	TextColor(White);
	Writeln(ContA+ContB);
	TextColor(LightCyan);
	Write('Porcentaje de cuentas dadas de baja >> ');
	TextColor(White);
	Writeln((ContC * 100)/Contot:0:2,'%');
	TextColor(LightCyan);
	Writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
	TextColor(White);
	Writeln('');
	Writeln('Presione cualquier tecla para finalizar.');
	Writeln('');
	ReadKey();

End.
