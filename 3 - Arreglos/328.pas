
Ejercicio 3.28

La Municipalidad de Resistencia desea obtener una estadística de los valores (en $) de los terrenos de la ciudad, discriminados por zona y ubicación dentro de la manzana (en esquina, interna, etc.), y los totales por zona y ubicación. El valor de cada final de cada terreno es igual a:

Valor del Terreno = Superficie terreno (en M2) * valor del M2 * coeficiente de incremento

Para ello cuenta con la siguiente información: 

    1- Un archivo de los terrenos con los siguientes datos:

        Nro_Terreno Zona Ubicacion Superficie 

    Zona: codificadas de A a F
    Ubicación: codificada de 1 a 10

    2- Un arreglo V que contiene los valores del M2 por zona.

Acción 328 ES;
Ambiente
    terreno = registro
        nro_terr: n(4); 
        xona: n('A', 'B', 'C', 'D', 'E', 'F');
        ubic: n(1..10);
        sup: n(4);
    fin_registro

    arch: archivo de terreno;
    reg: terreno;
    
    x: entero;
    y: entero;
    mach5: arreglo [1..11, 'A'..'G'] de real;
    
    procedimiento carga1 ES;
    proceso 
        para x:= 1 hasta 11 hacer
            para y:= 'A' hasta 'G' hacer 
                mach5[x,y]:= 0; 
            fin_para     
        fin_para 
    fin_procedimiento 

    v: entero;
    mach6: arreglo ['A'..'F'] de real;

    procedimiento carga2 ES;
    proceso
        para v:= 'A' hasta 'F' hacer
            esc('Ingrese el valor por m2 para la zona >> ', v);
            leer(mach6[v]);
        fin_para
    fin_procedimiento

    calc: real;

    coef_in = 1.5;
    
Proceso 
    carga1;
    carga2;

    abrir e/(arch);
    leer(arch, reg);

    mientras NFDA(arch) hacer
        calc:= reg.sup * mach6[reg.xona] * coef_in;
        
        mach5[reg.ubic, reg.xona]:= mach5[reg.ubic, reg.xona] + calc;
        
        // total por rexona
        mach5[11, reg.xona]:= mach5[11, reg.xona] + calc;

        // total por ubicate
        mach5[reg.ubic, 'G']:= mach5[reg.ubic, 'G'] + calc;

        // gracias totales
        mach5[11, 'G']:= mach5[11, 'G'] + calc;
        
        leer(arch, reg);
    fin_mientras
    
    para x:= 1 hasta 11-1 hacer 
        para y:= 'A' hasta 'F' hacer 
            esc('El valor de la ubicación ', x, ' zona ', y, ' es >> ');
            esc(mach5[x,y]);
        fin_para
    fin_para 

    para x:= 1 hasta 11-1 hacer
        esc('Valor total de la ubicación ', x, ' es >> ');
        esc(mach5[x, 'G']);
    fin_para

    para  y:= 'A' hasta 'F' hacer
        esc('Valor total de la zona ', y, ' es >> ');
        esc(mach5[11, y]);
    fin_para

    cerrar(arch);
Fin_Acción.



La Municipalidad de Resistencia desea obtener una estadística de los valores (en $) de los terrenos de la ciudad, discriminados por zona y ubicación dentro de la manzana (en esquina, interna, etc.), y los totales por zona y ubicación. El valor de cada final de cada terreno es igual a:

Valor del Terreno = Superficie terreno (en M2) * valor del M2 * coeficiente de incremento

Para ello cuenta con la siguiente información: 


Ubicación	 Zona A	 Zona B	      ...	 Zona F	Total por ubicación
1	            ...   ...	      ...	  ...	 ...
2	            ...   ...	      ...	  ...	 ...
...	            ...   ...	      ...	  ...	 ...
10	            ...   ...	      ...	  ...	 ...   
Total por zona	...	  ...	      ...	  ... Total General


