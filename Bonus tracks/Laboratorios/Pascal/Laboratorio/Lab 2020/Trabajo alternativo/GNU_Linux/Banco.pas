Program Maculky_Coco_Reynolds;
uses crt;
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
	   optionM: char;
	   optionG: char;
	        NC: longint;
	        CC: integer;
	        TC: string[9];
	         T: string[50];
	         S: real;
	         B: char;
	    minInt: integer;
	    maxInt: integer;
	minLongInt: longint;
	maxLongInt: longint;
	   optionL: char;
	     ContA: integer;
         ContB: integer;
     	 ContC: integer;
	    Contot: integer;
		   OPT: char;

	
	function ValidInteger(value: Integer; minInt,maxInt: Integer): Boolean;
		begin
		  ValidInteger:= (value >= minInt) and (value <= maxInt); 
		end;

	function ValidLongInt(value: longint; minLongInt,maxLongInt: longint): Boolean;
		begin
		  ValidLongInt:= (value >= minLongInt) and (value <= maxLongInt); 
		end;
	
	
	Procedure menu;
		begin
			TextColor(LightGray);write('         =========================');TextColor(LightCyan);write(' Coco Reynolds & John bank enterprise. ');TextColor(LightGray);writeln('=========================');
			TextColor(LightGray);writeln('         ||                                                                                     ||');
			TextColor(LightGray);writeln('         ||                                Seleccione una opcion:                               ||');
			TextColor(LightGray);writeln('         ||                                1- Generar archivo.                                  ||');
			TextColor(LightGray);writeln('         ||                                2- Leer archivo.                                     ||');
			TextColor(LightGray);writeln('         ||                                3- Cumplir consigna.                                 ||');
			TextColor(LightGray);write('         ||                                4-');TextColor(LightRed);write(' Salir.');TextColor(LightGray);writeln('                                            ||');
			TextColor(LightGray);writeln('         ||                                                                                     ||');
			TextColor(LightGray);write('         ===================================================');TextColor(LightGreen);write(' conversion, software version 7.0 ');TextColor(LightGray);writeln('====');
			optionM:= readkey;
		end;	
	
	
	Procedure generador;
		begin
			minInt:= 0;
			maxInt:= 32767;			{Estos son los valores que toman la funciones para controlar}
			minLongInt:= 0;			{que no se exceda el rango de los datos ingresados.}
			maxLongInt:= 2147483647;
		
			Writeln('');
			TextColor(LightGreen);
			writeln('Ingrese numero de cuenta:');
			TextColor(White);
			{$i-}
			readln(NC);
			{$i+}
				if IOresult <> 0 then
				begin
					repeat
						TextColor(LightRed);
						Writeln('Ha ingresado un dato incorrecto. Por favor ingrese un numero entre 0 y 2147483647.');
						TextColor(White);
						{$i-}
						Readln(NC);
						{$i+}
					until IOresult = 0;
				end;
			
				if ValidLongInt(NC,minLongInt,maxLongInt) then
				begin
					RegClient.num_cuenta:= NC;
				end
				else
					begin
						repeat
							TextColor(LightRed);
							writeln('El numero ingresado es incorrecto. Por favor, ingrese un valor entre el 0 y 2147483647');
							TextColor(White);
							{$i-}
							readln(NC);
							{$i+}
								if IOresult <> 0 then
								begin
									repeat
										TextColor(LightRed);
										Writeln('Ha ingresado un dato incorrecto. Por favor ingrese un numero entre 0 y 2147483647.');
										TextColor(White);
										{$i-}
										Readln(NC);
										{$i+}
									until IOresult = 0;
								end;
						until ValidLongInt(NC,minLongInt,maxLongInt);
							RegClient.num_cuenta:= NC;
					end;
			
			
			TextColor(LightGreen);
			writeln('Ingrese codigo de cliente.');
			TextColor(White);
			{$i-}
			readln(CC);
			{$i+}
				if IOresult <> 0 then
				begin
					repeat
						TextColor(LightRed);
						Writeln('Ha ingresado un dato incorrecto. Por favor, ingrese un numero entre 0 y 32767.');
						TextColor(White);
						{$i-}
						Readln(CC);
						{$i+}
					until IOresult = 0;
				end;
			
			
				if ValidInteger(CC,minInt,maxInt) then
				begin
					RegClient.cod_client:= CC;
				end
				else
					begin
						repeat
							TextColor(LightRed);
							writeln('El numero ingresado es incorrecto. Por favor, ingrese un valor entre el 0 y 32767');
							TextColor(White);
							{$i-}
							readln(CC);
							{$i+}
								if IOresult <> 0 then
								begin
									repeat
										TextColor(LightRed);
										Writeln('Ha ingresado un dato incorrecto. Por favor, ingrese un numero entre 0 y 32767.');
										TextColor(White);
										{$i-}
										Readln(CC);
										{$i+}
									until IOresult = 0;
								end;
						until ValidInteger(CC,minInt,maxInt);
							RegClient.cod_client:= CC;
					end;
			
			
			TextColor(LightGreen);
			writeln('Ingrese tipo de cuenta (ahorro/cliente):');
			TextColor(White);
			readln(TC);
				if (TC = 'ahorro') or (TC = 'cliente') or (TC = 'Ahorro') or (TC = 'Cliente') or (TC = 'AHORRO') or (TC = 'CLIENTE') then
				begin
					RegClient.tipo:= TC;
				end
				else
					begin
						repeat
							TextColor(LightRed);
							writeln('Ingrese un dato valido >> (ahorro/cliente)');
							TextColor(White);
							readln(TC);
						until (TC = 'ahorro') or (TC = 'cliente') or (TC = 'Ahorro') or (TC = 'Cliente') or (TC = 'AHORRO') or (TC = 'CLIENTE');
						RegClient.tipo:= TC;
					end;
			
			TextColor(LightGreen);
			writeln('Ingrese el titular de la cuenta:');
			TextColor(White);
			readln(T);
			RegClient.titular:= T;
			
			TextColor(LightGreen);
			writeln('Ingrese el saldo existente en la cuenta:');
			TextColor(White);
			{$i-}
			readln(S);
			{$i+}
				if IOresult <> 0 then
				begin
					repeat
						TextColor(LightRed);
						Writeln('Ha ingresado un dato incorrecto. Por favor, ingrese un numero.');
						TextColor(White);
						{$i-}
						readln(S);
						{$i+}
					until IOresult = 0;
				end;
				RegClient.saldo:= S;
			
			TextColor(LightGreen);
			writeln('Ingrese estado de la cuenta (baja: s/n)');
			TextColor(White);
			readln(B);
				if (B = 's') or (B = 'n') or (B = 'S') or (b = 'N') then
				begin
					RegClient.baja:= B;
				end
				else
					begin
						repeat
							TextColor(LightRed);
							writeln('Ingrese un dato valido >> (s/n)');
							TextColor(White);
							readln(B);
						until (B = 's') or (B = 'n') or (B = 'S') or (b = 'N');
						RegClient.baja:= B;
					end;
			
			Write(ArchClient, RegClient);
	
		end;
		
		
	Procedure generar;
		begin
			TextColor(LightGray);
			Writeln('Recuerde que este proceso crea un archivo de clientes completamente desde cero');
			Writeln('por lo que cualquier archivo existente sera borrado en su totalidad.');
			Writeln('');
			TextColor(LightRed);
			Writeln('Proceda con precaucion. Tanto la entidad Coco Reynolds & Jonh como la subsidiaria');
			Writeln('Susy Suicide no se responsabilizan por datos corrompidos.');
			Writeln('');
			TextColor(LightGray);
			Writeln('Puede verificar la existencia de un archivo volviendo al menu principal presionando');
			TextColor(LightRed);Write('RETROCESO '); TextColor(LightGray);Write('y ejecutando la opcion 2 para leer el archivo. ');
			Writeln('');
			Writeln('');
			Write('Para continuar con el proceso, presione');
			TextColor(LightGreen);
			Writeln(' TAB.');
			OPT:= readkey;
			ClrScr;
			
			while (OPT <> #8) and (OPT <> #9) do
			begin
				TextColor(LightRed);
				Writeln('Ingrese una opcion correcta:');
				Writeln('');
				TextColor(LightGray);
				Write('Volver al menu >>');
				TextColor(Yellow);
				Writeln(' RETROCESO');
				TextColor(LightGray);
				Write('Continuar el proceso >>');
				TextColor(Yellow);
				Writeln('TAB');
				OPT:= readkey;
				Delay(200);
				ClrScr;
			end;
			
			if (OPT = #8) then
			begin
			{Al no tener nada, vuelve al menu.}
			end
			else
				if (OPT = #9) then
				begin					
					repeat
						Writeln('');
						TextColor(LightGray);
						Write('Generar >>');
						TextColor(Yellow);
						Writeln(' ENTER');
						TextColor(LightGray);
						Write('Salir >>');
						TextColor(Yellow);
						Writeln(' ESC');
						optionG:= readkey;
						if (optionG = #13) then
						begin
							Assign(ArchClient, 'Archivo_de_clientes.dat'); 
							Rewrite(ArchClient);
							while (optionG = #13) do
							begin
								generador;
								Writeln('');
								TextColor(LightGray);
								Write('Ingresar otro cliente >>');
								TextColor(Yellow);
								Writeln(' ENTER');
								TextColor(LightGray);
								Write('Salir guardando el archivo >>');
								TextColor(Yellow);
								Writeln('ESC');
								optionG:= readkey;
									if (optionG = #27) then
									begin
										TextColor(LightGreen);
										Writeln('');
										Writeln('Archivo generado exitosamente.');
										Delay(700);
										Close(ArchClient);
									end
									else
										if (optionG <> #13) and (optionG <> #27) then
										begin
											ClrScr;
											Delay(500);
											TextColor(LightRed);
											Writeln('Dato incorrecto, por favor, seleccione una de las dos opciones:');
											Writeln('');
										end;
							end;
						end
						else
							if (optionG = #27) then
							begin
								TextColor(LightCyan);
								Writeln('');
								Writeln('El proceso finalizara.');
								Delay(500);
							end
							else
								if (optionG <> #13) and (optionG <> #27) then
								begin
									Delay(1000);
									Writeln('');
									ClrScr;
									TextColor(LightRed);
									Writeln('Opcion incorrecta.');
									Writeln('Ingrese una de las dos a continuacion:');
								end;
					until (optionG = #13) or (optionG = #27);
					
				end;	
		end;


	Procedure leer;
		begin
			repeat
				Assign(ArchClient, 'Archivo_de_clientes.dat');
				{$I-}
				Reset(ArchClient);
				{$I+}
				if IOResult <> 0 then
					begin
						Writeln('');
						TextColor(LightRed);
						Writeln('=======================================================================');
						TextColor(Yellow);
						Writeln('No se encontro el archivo!');
						Writeln('Vuelva a inciar el programa y seleccione la opcion 1 para crearlo.');
						TextColor(LightRed);
						Writeln('=======================================================================');
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
				optionL:= readkey;
				Delay(200);
				ClrScr;
				Delay(200);
			until (optionL <> #13);	
		end;
		
	
	Procedure banco;
		begin
			Assign(ArchClient, 'Archivo_de_clientes.dat');
			{$I-}
			Reset(ArchClient);
			{$I+}
			if IOResult <> 0 then
				begin
					Writeln('');
					TextColor(LightRed);
					Writeln('=======================================================================');
					TextColor(Yellow);
					Writeln('No se encontro el archivo!');
					Writeln('Vuelva a inciar el programa y seleccione la opcion 1 para crearlo.');
					TextColor(LightRed);
					Writeln('=======================================================================');
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
									if (RegClient.baja = 's') or (RegClient.baja = 'N') then
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
		
		end;
	
	
	Procedure fin_hermoso;
		begin
			writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');
			write('                                              ');TextColor(LightGray);write('Finalizando el programa');
			delay(50);TextColor(LightBlue);write(' >');delay(50);write('>');delay(50);write('>');delay(50);write('>');delay(50);
			ClrScr;
			writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');
			write('                                              ');TextColor(LightGray);write('Finalizando el programa');
			delay(50);TextColor(LightGreen);write(' >');delay(50);write('>');delay(50);write('>');delay(50);write('<');delay(50);
			ClrScr;
			writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');
			write('                                              ');TextColor(LightGray);write('Finalizando el programa');
			delay(50);TextColor(LightMagenta);write(' >');delay(50);write('>');delay(50);write('<');delay(50);write('<');delay(50);
			ClrScr;
			writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');
			write('                                              ');TextColor(LightGray);write('Finalizando el programa');
			delay(50);TextColor(Cyan);write(' >');delay(50);write('<');delay(50);write('<');delay(50);write('<');delay(50);
			ClrScr;
			writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');
			write('                                              ');TextColor(LightGray);write('Finalizando el programa');
			delay(50);TextColor(White);write(' <');delay(50);write('<');delay(50);write('<');delay(50);write('<');delay(50);
			ClrScr;
		end;


Begin
	menu;
	repeat	
	if (optionM = '1') then
		begin
			Sound(350);        
			Delay(200);
			NoSound;
			ClrScr;
			generar;
		end
		else
			if (optionM = '2') then
			begin
				Sound(350);        
				Delay(200);
				NoSound;
				ClrScr;
				Leer;
			end
			else
				if (optionM = '3') then
				begin
					Sound(350);        
					Delay(200);
					NoSound;
					ClrScr;
					Banco;
				end
				else
					if (optionM = '4') then
					begin
						Writeln('');
						Writeln('Finalizando programa');
						Delay(500);
						ClrScr;
						fin_hermoso;
						halt();
					end
					else
						Writeln('Dato ingresado incorrecto');
						delay(1000);
						ClrScr;
						menu;
						
					if (optionM = '4') then
					begin
						Writeln('');
						Writeln('Finalizando programa');  {Esto "fuerza" a salir}
						Delay(500);             	      {siempre por el final lindo}
						ClrScr;
						fin_hermoso;
						halt();
					end
	until (optionM = '4');
End.

