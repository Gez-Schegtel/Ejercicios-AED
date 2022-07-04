
Un supermercado desea conocer la totalidad de unidades existentes de cada artículo a fin de hacer un control de stock y decidir si se deben comprar nuevas unidades o redistribuir la mercadería existente.

El supermercado posee dos sucursales, cada una de las cuales envió su información en un fichero con el siguiente formato:

	ARTICULOS

	Cod_Prod Tipo Marca Descripción Cant_Unidades 

Escribir un algortimo que permita obtener un único fichero de salida, con el mismo formato, que contenga la información solicitada y además, emita un listado con los siguientes datos:

	Cod_Prod 	Tipo 	Marca 	Descripción 	Cant_Suc_1 	Cant_Suc_2 	Total_Unidades
						
						
Acción 2218 ES;
Ambiente
	Artículos = Registro
		Cod_Prod: n(5);
		Tipo: an(30);
		Marca: an(40);
		Descripción: an(255);
		Cant_Unidades: n(4);
	Fin_Registro
	
	archE1: archivo de Artículos ordenado por Cod_Prod;
	regE1: Artículos;
	
	archE2: archivo de Artículos ordenado por Cod_Prod;
	regE2: Artículos;
	
	archS: archivo de Artículos ordenado por Cod_Prod;
	regS: Artículos;


	Procedimiento leer_archE1 ES;
	Proceso
		leer(archE1, regE1);
		
		si FDA(archE1) entonces
			regE1.Cod_Prod:= HV;
		fin_si
	Fin_Procedimiento

	Procedimiento leer_archE2 ES;
	Proceso
		leer(archE2, regE2);
		
		si FDA(archE2) entonces
			regE2.Cod_Prod:= HV;
		fin_si 
	Fin_Procedimiento
	
Proceso
	abrir e/(archE1);
	leer_archE1;
	
	abrir e/(archE2);
	leer_archE2;
	
	abrir /s(archS);
	
	esc('| Cod_Prod | Tipo | Marca | Descripción | Cant_Suc_1 | Cant_Suc_2 | Total_Unidades |')
	
	mientras (regE1.Cod_Prod <> HV) o (regE2.Cod_Prod <> HV) hacer
		
		si (regE1.Cod_Prod < regE2.Cod_Prod) entonces
			regS:= regE1; //Se puede hacer esto porque son iguales los registros
			esc(archS, regS);
			
			//Escribo 0 para la sucursal 2, porque el código de prod. es único. Entonces si no se encontró, quiere decir que no hay
			esc(regE1.Cod_Prod, regE1.Tipo, regE1.Marca, regE1.Descripción, regE1.Cant_Unidades, ' 0 ', regE1.Cant_Unidades);
			
			leer_archE1;
		sino
			si (regE1.Cod_Prod > regE2.Cod_Prod) entonces
				regS:= regE2;
				esc(archS, regS);
				
				esc(regE2.Cod_Prod, regE2.Tipo, regE2.Marca, regE2.Descripción, ' 0 ',  regE2.Cant_Unidades, regE2.Cant_Unidades);
			
				leer_archE2;
			sino
				regS:= regE1;
				regS.Cant_Unidades:= regE1.Cant_Unidades + regE2.Cant_Unidades;
				esc(archS, regS);
				
				esc(regE1.Cod_Prod, regE1.Tipo, regE1.Marca, regE1.Descripción, regE1.Cant_Unidades, regE2.Cant_Unidades, (regE1.Cant_Unidades + regE2.Cant_Unidades));
				
				leer_archE1;
				leer_archE2;
			fin_si
		fin_si
	
	fin_mientras

	cerrar(archE1);
	cerrar(archE2);
	cerrar(archS);

Fin_Acción.












