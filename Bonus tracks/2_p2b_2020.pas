

Teniendo en cuenta el escenario del ejercicio anterior y utilizando el archivo PRECIPITACIONES_ANUALES y demás estructuras de datos que usted considere necesarias, se pide realizar un algoritmo que permita determinar...

	a) mes con mayores precipitaciones
	
	b) departamentos en los cuales la lluvia ha superado los 350mm caídos y el mes en el que se produjo
	
	c) en qué mes y en qué departamento se produjo la menor cantidad de precipitaciones


Acción parcial_2b_ej2 ES;
Ambiente
    fecha = registro 
        aaaa: n(4);
        mm: 1..12;
        dd: 1..31;
    fin_registro 

    clave = registro 
        pluv_id: n(4);
        f_reg: fecha;
    fin_registro

	precipitaciones_anuales = registro
        clave_mae: clave;
        precip: n(4);
        estado_pluv: ('AC', 'MA');
    fin_registro     

    mae: archivo de precipitaciones_anuales ordenado por pluv_id y f_reg;
    rmae: precipitaciones_anuales;

    pluviométros = registro 
        pluv_id: n(4);
        model: an(40);
        desc: an(255);
        dpto: 1..25;
    fin_registro 

    indie: archivo de pluviómetros indexado por pluv_id;
    rindie: pluviómetros;

    arr: arreglo [1..25] de an(40);
    w: entero;

    procedimiento cargar_arr ES; 
    proceso 
        para w:= 1 hasta 25 hacer 
            esc('Ingrese nombre de dpto >> ');
            leer(arr[w]);
        fin_para 
    fin_procedimiento 

	matt: arreglo [1..13, 1..26] de real;
	x: entero;
	y: entero;

	procedimiento cargar_matriz ES;
	proceso 
		para x:= 1 hasta 13 hacer 
			para y:= 1 hasta 26 hacer 
				matt[x,y]:= 0;
			fin_para  
		fin_para 
	fin_procedimiento
	
	may_precip: real;
	may_pos: entero;
	
	men_precip_mes: real;
	men_pos_mes: entero;
	
	men_precip_dpto: real;
	men_pos_dpto: entero;

Proceso 
	cargar_matriz;
	abrir e/(mae);
	leer(mae, rmae);
	abrir e/(indie);

	mientras NFDA(mae) hacer
		rindie.pluv_id:= rmae.pluv_id;
		leer(indie,rindie)
		
		si EXISTE entonces
			matt[rmae.clave_mae.mm, rindie.dpto]:= matt[rmae.clave_mae.mm, rindie.dpto] + rmae.precip;
			matt[rmae.clave_mae.mm, 26]:= matt[rmae.clave_mae.mm, 26] + rmae.precip;
			matt[13, rindie.dpto]:= matt[13, rindie.dpto] + rmae.precip;
			matt[13, 26]:= matt[13, 26] + rmae.precip;

		sino
			esc('No se encontró el id del pluviómetro.');
		fin_si
		
		leer(mae, rmae);
	fin_mientras	

	may_precip:= LV;
	men_precip_mes:= HV;
	para x:= 1 hasta 13-1 hacer
		si (matt[x,26] > may_precip) entonces
			may_precip:= matt[x,26];
			may_pos:= x;
		fin_si

		si (matt[x,26] < men_precip_mes) entonces
			men_precip_mes:= matt[x,26];
			men_pos_mes:= x;
		fin_si
	fin_para 

	esc('La mayor cantidad de precipitaciones se dieron en el mes ', may_pos, ' con ', may_precip, ' precipitaciones.');
	
	men_precip_dpto:= HV;
	para y:= 1 hasta 26-1 hacer 
		si (matt[13, y] < men_precip_dpto) entonces 
			men_precip_depto:= matt[13,y];
			men_pos_dpto:= y;
		fin_si;
	fin_para 
	
	
	esc('La menor cantidad de precipitaciones se dieron en el mes ', men_pos_mes, ' con ', men_precip_mes, ' precipitaciones.');
	esc('La menor cantidad de precipitaciones se dieron en el departamento ', arr[men_pos_dpto], ' con ', men_precip_dpto, ' precipitaciones.');


	para x:= 1 hasta 13-1 hacer
		para y:= 1 hasta 26-1 hacer
			si (matt[x,y] > 350) entonces
				esc('En el departamento ', arr[y], ' el mes ', x, ' la lluvia superó los 350mm caídos.');
			fin_si 
		fin_para
	fin_para

	cerrar(mae);
	cerrar(indie);
Fin_Acción.

