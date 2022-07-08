

Program generar_archivo;
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

	function ValidInteger(value: Integer; minInt,maxInt: Integer): Boolean;
		begin
		  ValidInteger:= (value >= minInt) and (value <= maxInt); 
		end;

	function ValidLongInt(value: longint; minLongInt,maxLongInt: longint): Boolean;
		begin
		  ValidLongInt:= (value >= minLongInt) and (value <= maxLongInt); 
		end;

Begin

	minInt:= 0;
	maxInt:= 32767;			{Estos son los valores que toman la funciones para controlar}
	minLongInt:= 0;			{que no se exceda el rango de los datos ingresados.}
	maxLongInt:= 2147483647;

	Writeln('');
	Sound(600);        
	Delay(200);
	NoSound;
	TextColor(LightRed+Blink);
	Writeln('Proceda con precaución. Si genera un archivo y ya hay uno existente, el mismo se eliminará.');
	Writeln('Para verificar si hay un archivo, ejecute el programa "Leer_archivo" que se encuentra');
	Writeln('dentro de esta carpeta.');
	writeln('');
	TextColor(LightGray);
	write('Para ingresar un nuevo cliente, presione');
	TextColor(Yellow);
	writeln(' ENTER');
	TextColor(LightGray);
	write('Para salir, presione');
	TextColor(Yellow);
	writeln(' ESC.');
	option:= Readkey;
	if (option = #13) then  {#13 es equivalente a la tecla ENTER en ASCII. Por lo que al apretar ENTER, el sistema toma como input #13.}
	begin
		Assign(ArchClient, 'Archivo_de_clientes.dat'); {Así se va a llamar el archivo de salida.}
		Rewrite(ArchClient);
		writeln('');
		while (option = #13) do
			begin
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
				writeln('');
				TextColor(LightGray);
				write('Nuevo cliente >>');
				TextColor(Yellow);
				writeln(' ENTER.');
				TextColor(LightGray);
				write('Salir >>');
				TextColor(Yellow);
				writeln(' ESC.');
				writeln('');
				option:= Readkey;
				if (option = #13) then
				begin
					{Acá no hay acción, pero al ser el primer condicional, sirve para excluir 
					la tecla ENTER de los condicionales	que vienen abajo.}
				end
				else
					if (option = #27) then
					begin
						halt();
					end
					else
						if (option <> #27) or (option <> #13) then
						begin
							repeat
								TextColor(LightRed);
								Writeln('Para cargar otro cliente, presione ENTER.');
								Writeln('Para salir, presione ESC.');
								Writeln('');
								TextColor(White);
								option:= Readkey;
							until (option = #27) or (option = #13);
						end;
			end;
		end
		else
			if (option = #27) then  {#27 es equivalente a la tecla ESC.}
			begin
				halt(); //halt es una función que detiene la ejecución del programa
			end
			else
				if (option <> #27) then
				begin
					repeat
						TextColor(LightRed);
						writeln('Para salir, presione ESC.');
						TextColor(White);
						option:= Readkey;
					until (option = #27);
				end;

	Close(ArchClient);
End.

{Todos los writeln que están "vacíos", son para dejar una línea de espacio. Es una cuestión estética.}

{El uso de la función IOresult está tan presente en el código para controlar que no sean ingresados datos}
{erróneos que puedan perjudicar el funcionamiento del programa que utilice el archivo que se genera. Las}
{estructuras condicionales consecuentes a la lectura de los datos, persiguen el mismo objetivo también.}