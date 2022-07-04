


Ejercicio 3.26
Se dispone de un archivo secuencial de facturas de una empresa de energía eléctrica, correspondientes a un año, con el siguiente formato:

Nro_Factura Nro_Usuario Zona Fecha Consumo

Se desea obtener un cuadro estadístico que informe los consumos y los importes totales facturados por mes discriminados por zona, con el siguiente formato:

                  Zona A	Zona B	Zona C	Zona D	Total por mes
    Enero	        ...	     ...	 ...	 ...	   ...
    Febrero	        ...	     ...	 ...	 ...	   ...
    ...	            ...	     ...	 ...	 ...	   ...	     
    Diciembre	    ...	     ...	 ...	 ...	   ...	 
    Total por zona	...	     ...	 ...	 ...    Total General

La ciudad está dividida en 4 Zonas (A,B,C,D), la tarifa por Kw. que cobra la empresa en cada una de ellas es: Zona A: $ 0,05, Zona B: $ 0,07, Zona C: $ 0,09 y Zona D: $ 0,13.

Acción 326 ES;
Ambiente
    fecha = registro
        aaaa: n(4);
        mm: (1..12);
        dd: (1..31);
    fin_registro
    
    factura = registro
        nro_fact: n(4);
        nro_user: n(4);
        zona: ('A', 'B', 'C', 'D');
        fecha_fact: fecha;
        consumo: n(4);
    fin_registro 
    
    arch_fact: archivo de factura;
    reg_fact: factura;
    
    emisión = registro
        consumo: n(4);
        importe: n(4);
    fin_registro 
    
    matt_damon: arreglo [1..13, 'A'..'E'] de emisión;
    
    x: entero;
    y: ('A'...'E');

    procedimiento carga ES;
    proceso 
        para x:= 1 hasta 13 hacer 
            para y:= 'A' hasta 'E' hacer
                matt_damon[x,y].consumo:= 0;
                matt_damon[x,y].importe:= 0;
            fin_para
        fin_para
    fin_procedimiento

Proceso     
    abrir E/(arch_fact)
    leer(arch_fact, reg_fact)
    
    carga;
    
    Mientras NFDA (arch_fact) hacer;
      
        matt_damon[reg_fact.fecha_fact.mm, reg_fact.zona].consumo:= matt_damon[reg_fact.fecha_fact.mm, reg_fact.zona].consumo + reg_fact.consumo;            
        
        según (reg_fact.zona) hacer 
            'A': import_fact:= reg_fact.consumo * 0,05;
            'B': import_fact:= reg_fact.consumo * 0,07;
            'C': import_fact:= reg_fact.consumo * 0,09;
            'D': import_fact:= reg_fact.consumo * 0,13;
        fin_segun
       
        matt_damon[reg_fact.fecha_fact.mm, reg_fact.zona].importe:= matt_damon[reg_fact.fecha_fact.mm, reg_fact.zona].importe + import_fact;

        matt_damon[13, reg_fact.zona].consumo:= matt_damon[13, reg_fact.zona].consumo + reg_fact.consumo;
        matt_damon[13, reg_fact.zona].importe:= matt_damon[13, reg_fact.zona].importe + import_fact;
        
        matt_damon[reg_fact.fecha_fact.mm, 'E'].consumo:= matt_damon[reg_fact.fecha_fact.mm, 'E'].consumo + reg_fact.consumo;
        matt_damon[reg_fact.fecha_fact.mm, 'E'].importe:= matt_damon[reg_fact.fecha_fact.mm, 'E'].importe + import_fact; 
        
        matt_damon[13, 'E'].consumo:= matt_damon[13, 'E'].consumo + reg_fact.consumo;
        matt_damon[13, 'E'].importe:= matt_damon[13, 'E'].importe + import_fact;
          
        leer(arch_fact, reg_fact);
    Fin_Mientras
    
    para x:= 1 hasta 13-1 hacer
        para y:= 'A' hasta 'D' hacer 
            esc('Para el mes ', x, ' y la zona ', y);
            esc('Consumo >> ', matt_damon[x,y].consumo);
            esc('Importe >> ', matt[x,y].importe)
        fin_para
    fin_para  
    
    cerrar(arch_fact);
Fin_Acción.
