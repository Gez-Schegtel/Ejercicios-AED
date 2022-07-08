Program defi;
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

	function ValidInteger(value: Integer; minInt,maxInt: Integer): Boolean;
		begin
		  ValidInteger:= (value >= minInt) and (value <= maxInt); 
		end;

	function ValidLongInt(value: longint; minLongInt,maxLongInt: longint): Boolean;
		begin
		  ValidLongInt:= (value >= minLongInt) and (value <= maxLongInt); 
		end;
		
	Procedure generar;
		begin
			
			minInt:= 0;
			maxInt:= 32767;			{Estos son los valores que toman la funciones para controlar}
			minLongInt:= 0;			{que no se exceda el rango de los datos ingresados.}
			maxLongInt:= 2147483647;
		

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
						until (TC = 'ahorro') or (TC = 'cliente');
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
		
		
				
Begin
	Assign(ArchClient, 'Archivo_de_clientes.dat'); 
	Rewrite(ArchClient);
	
	repeat
		Writeln('Generar >> ENTER');
		Writeln('Salir >> ESC');
		optionG:= readkey;
		if (optionG = #13) then
		begin
			while (optionG = #13) do
			begin
				Generar;
				Writeln('Volver a Generar >> ENTER');
				Writeln('Salir >> ESC');
				optionG:= readkey;
					if (optionG = #27) then
					begin
						Writeln('Bueno, chau.');
						Delay(500);
					end
					else
						if (optionG <> #13) and (optionG <> #27) then
						begin
							Writeln('Ingresaste cualquier cosa.');
						end;
			end;
		end
		else
			if (optionG = #27) then
			begin
				Writeln('Bueno, chau.');
				Delay(500);
			end
			else
				Writeln('Ingresaste cualquier cosa.');
	until (optionG = #13) or (optionG = #27);
	
	Close(ArchClient);
End.






