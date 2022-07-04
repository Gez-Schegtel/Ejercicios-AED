
{
El siguiente es un ejercicio del primer recuperatorio del primer parcial del año 2017:

La AFIP dispone de dos secuencias de caracteres:

PERSONAS Contiene los siguientes datos de personas físicas o Empresas: nombre completo y fecha (de nacimiento o de creación, respectivamente), agrupadas por provincias. No existe carácter separador entre personas, el fin de cada provincia se indica con el carácter &.

Ejemplo: María Góm-14021977Carlos Alberto Rodriguez-20061990....&Lionel Messi-24061987....&....*fin* nombre-ddmmaaaanombre-ddmmaa....&

CUIT: contiene la Clave Unica de Identificación Tributaria de las personas de la secuencia PERSONAS (existiendo una correspondencia una a una, es decir la primer persona con el primer cuit, la segunda con el segundo y asi sucesivamente) Cada número de CUIT se almacena por medio de 11 caracteres: los 2 primeros indican el tipo, los 6 siguientes el número de DNI (en caso de personas físicas) o de sociedad (en caso de Empresas) y el último es un digito verificador.
    
Ejemplo: **20123456786**23134567823**30712434445** //Voy a hacer el ejercicio sin *

Los tipos pueden ser:20, 23, 24 y 27 para Personas Físicas y 30, 33 y 34 para Empresas.

Se solicita:

1_ Generar una secuencia de salida que contenga DNI, y el nombre completo de todas las personas físicas cuyo nombre comience con vocal.
    
2_ Para cada Provincia calcular el total de personas físicas y el porcentaje sobre el total de la provincia.

//Resolución 1: tomo de ejemplo las entradas...
//María Góm-14021977Alberto Rodriguez-20061990&Lionel Messi-24061987&
//201234567862313456782330712434445

Acción 2130 ES; 
Ambiente
	vocales = ('a', 'e', 'i', 'o', 'u');

	sec1: secuencia de Caracter;
	v1: caracter;
	
	sec2: secuencia de Caracter;
	v2: caracter;
	
	sally: secuencia de Caracter;
	
	i: entero;
	
	contf: entero;
	contj: entero;
	
Proceso
	arr(sec1);
	avz(sec1, v1);
	
	arr(sec2);
	avz(sec2, v2);
	
	crear(sally);
	
	mientras NFDS(sec1) y NFDS(sec2) hacer
		
		contf:= 0;
		contj:= 0;
		
		mientras (v1 <> '&') hacer
 
			si (v2 = '2') entonces
				contf:= cont + 1;
			sino
				contj:= contj + 1;
			fin_si

			si (v1 en vocales) y (v2 = '2') entonces
				
				avz(sec2, v2);
				avz(sec2, v2);
				para i:= 1 hasta 8 hacer
					esc(sally, v2);
					avz(sec2, v2);
				fin_para
				avz(sec2, v2);	
				
				mientras (v1 <> '-') hacer
					esc(sally, v1);
					avz(sec1, v1);
				fin_mientras
				
				para i:= 1 hasta 9 hacer
					avz(sec1, v1);
				fin_para
				
			sino
				para := 1 hasta 11 hacer
					avz(sec2, v2);
				fin_para
				
				mientras (v1 <> '-') hacer
					avz(sec1, v1);
				fin_mientras
				
				para:= 1 hasta 9 hacer
					avz(sec1, v1);
				fin_para
				
			fin_si
		
		fin_mientras
		
		esc('El número de personas físicas en la provincia es >> ', contf);
		esc('El promedio de personas físicas en la provincia es del ', contf*100/(contf+contj), '%');
		avz(sec1, v1);
	
	fin_mientras

	cerrar(sec1);
	cerrar(sec2);
	cerrar(sally);
	
Fin_Acción.

María Góm-14021977Alberto Rodriguez-20061990&Lionel Messi-24061987&FDS

20123456786|23134567823|30712434445|FDS

}


program something;
const
	vocales = ['A', 'E', 'I', 'O', 'U'];
var
	sec1: text;
	v1: char;
	
	sec2: text;
	v2: char;
	
	sally: text;
	
	i: integer;
	
	contf: integer;
	contj: integer;
	
Begin
	assign(sec1, 'entrada130.txt');
	reset(sec1);
	read(sec1, v1);
	
	assign(sec2, 'entrada230.txt');
	reset(sec2);
	read(sec2, v2);
	
	assign(sally, 'salida30.txt');
	rewrite(sally);
		
	while not eof(sec1) and not eof(sec2) do
	begin
		contf:= 0;
		contj:= 0;
		
		while (v1 <> '&') do
		begin 
			if (v2 = '2') then
			begin
				contf:= contf + 1;
			end
			else
				begin
					contj:= contj + 1;
				end;

			if (v1 in vocales) and (v2 = '2') then
			begin
				
				read(sec2, v2);
				read(sec2, v2);
				for i:= 1 to 8 do 
				begin
					write(sally, v2);
					read(sec2, v2);
				end;	
				read(sec2, v2);	
				
				while (v1 <> '-') do 
				begin
					write(sally, v1);
					read(sec1, v1);
				end;
				
				for i:= 1 to 9 do 
				begin
					read(sec1, v1);
				end;
				
			end
			else
				begin
					for i:= 1 to 11 do 
					begin
						read(sec2, v2);
					end;
					
					while (v1 <> '-') do 
					begin
						read(sec1, v1);
					end;
					
					for i:= 1 to 9 do 
					begin
						read(sec1, v1);
					end;
					
				end;
			
		end;
		
		writeln('El número de personas físicas en la provincia es >> ', contf);
		writeln('El promedio de personas físicas en la provincia es del ', contf*100/(contf+contj):0:2, '%');
		read(sec1, v1);
	
	end;

	close(sec1);
	close(sec2);
	close(sally);
	
End.


//Resolución 2: tomo de ejemplo las entradas...
//María Góm-14021977Alberto Rodriguez-20061990&Lionel Messi-24061987FDS
//201234567862313456782330712434445

{
Acción 2130 ES; 
Ambiente
	vocales = ('a', 'e', 'i', 'o', 'u');

	sec1: secuencia de Caracter;
	v1: caracter;
	
	sec2: secuencia de Caracter;
	v2: caracter;
	
	sally: secuencia de Caracter;
	
	i: entero;
	
	contf: entero;
	contj: entero;
	
Proceso
	arr(sec1);
	avz(sec1, v1);
	
	arr(sec2);
	avz(sec2, v2);
	
	crear(sally);
	
	mientras NFDS(sec1) y NFDS(sec2) hacer
		
		contf:= 0;
		contj:= 0;
		
		mientras NFDS(sec1) y (v1 <> '&') hacer
 
			si (v2 = '2') entonces
				contf:= cont + 1;
			sino
				contj:= contj + 1;
			fin_si

			si (v1 en vocales) y (v2 = '2') entonces
				
				avz(sec2, v2);
				avz(sec2, v2);
				para i:= 1 hasta 8 hacer
					esc(sally, v2);
					avz(sec2, v2);
				fin_para	
				avz(sec2, v2);
				
				mientras (v1 <> '-') hacer
					esc(sally, v1);
					avz(sec1, v1);
				fin_mientras
				
				para i:= 1 hasta 9 hacer
					avz(sec1, v1);
				fin_para
				
			sino
				para := 1 hasta 11 hacer
					avz(sec2, v2);
				fin_para
				
				mientras (v1 <> '-') hacer
					avz(sec1, v1);
				fin_mientras
				
				para:= 1 hasta 9 hacer
					avz(sec1, v1);
				fin_para
				
			fin_si
		
		fin_mientras
		
		esc('El número de personas físicas en la provincia es >> ', contf);
		esc('El promedio de personas físicas en la provincia es del ', contf*100/(contf+contj), '%');
		
		si NFDS(sec1) entonces
			avz(sec1, v1);
		fin_si
		
	fin_mientras

	cerrar(sec1);
	cerrar(sec2);
	cerrar(sally);
	
Fin_Acción.

}

{
program something;
const
	vocales = ['A', 'E', 'I', 'O', 'U'];
var
	sec1: text;
	v1: char;
	
	sec2: text;
	v2: char;
	
	sally: text;
	
	i: integer;
	
	contf: integer;
	contj: integer;
	
Begin
	assign(sec1, 'entrada130.txt');
	reset(sec1);
	read(sec1, v1);
	
	assign(sec2, 'entrada230.txt');
	reset(sec2);
	read(sec2, v2);
	
	assign(sally, 'salida30.txt');
	rewrite(sally);
		
	while not eof(sec1) and not eof(sec2) do
	begin
		contf:= 0;
		contj:= 0;
		
		while not eof(sec1) and (v1 <> '&') do
		begin 
			if (v2 = '2') then
			begin
				contf:= contf + 1;
			end
			else
				begin
					contj:= contj + 1;
				end;

			if (v1 in vocales) and (v2 = '2') then
			begin
				read(sec2, v2);
				read(sec2, v2);
				for i:= 1 to 8 do 
				begin
					write(sally, v2);
					read(sec2, v2);
				end;	
				read(sec2, v2);
				
				while (v1 <> '-') do 
				begin
					write(sally, v1);
					read(sec1, v1);
				end;
				
				for i:= 1 to 9 do 
				begin
					read(sec1, v1);
				end;
				
			end
			else
				begin
					for i:= 1 to 11 do 
					begin
						read(sec2, v2);
					end;
					
					while (v1 <> '-') do 
					begin
						read(sec1, v1);
					end;
					
					for i:= 1 to 9 do 
					begin
						read(sec1, v1);
					end;
					
				end;
			
		end;
		
		writeln('El número de personas físicas en la provincia es >> ', contf);
		writeln('El promedio de personas físicas en la provincia es del ', contf*100/(contf+contj):0:2, '%');
		
		if not eof(sec1) then 
		begin
			read(sec1, v1);
		end;
	end;

	close(sec1);
	close(sec2);
	close(sally);
	
End.
}




