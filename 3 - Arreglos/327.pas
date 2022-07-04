

Ejercicio 3.27

Se desea efectuar una estadística de ventas. Se cuenta para ello con una secuencia de las facturas emitidas, las cuales son identificadas por un Número; dicha secuencia contiene información relativa al cliente: su Número y Zona a la cual pertenece, como así también el Tipo de mercadería entregada, la Cantidad de unidades, el total gravado, el total exento de IVA y el valor del IVA. Construya un algoritmo que emita por zona, y dentro de la zona por tipo de mercadería el total de unidades vendidas, el total gravado, el total exento y el total de IVA, y además un total general con la misma información. Hay 9 zonas y 4 tipos de mercadería.

        zona 1  zona 2  zona 3 tot_tipo //no pide
tipo 1   ...
tipo 2
tot_zona ...  ... 

Acción 327 ES;
Ambiente 
    facturas = registro 
        nro_cli: n(4);
        zona: (1..9); 
        type_merch: (1..4);
        cant_unit: n(3)
        tot_grav:: real; 
        tot_exIVA: real;
        val_IVA: real;
    fin_registro 

    arch: archivo de facturas;
    reg: facturas;

    taxi_driver = registro 
        tot_unit_sell: n(3); 
        tot_grav: real; 
        tot_exIVA: real; 
        val_IVA: real;
    fin_registro 
    
    matt: arreglo [1..5, 1..10] de taxi_driver;
    x: entero;
    y: entero;    
    
    procedimiento carga es;
    proceso 
        para x:= 1 hasta 5 hacer
            para y:= 1 hasta 10 hacer
                matt[x,y].tot_unit_sell:= 0;
                matt[x,y].tot_grav:= 0;
                matt[x,y].tot_exIVA:= 0;
                matt[x,y].val_IVA:= 0;
            fin_para
        fin_para
    fin_procedimiento    

Proceso 
    carga;
    abrir e/(arch);
    leer(arch);

    Mientras NFDA (arch) hacer
        matt[reg.typemerch, reg.zona].tot_unit_sell:= matt[reg.typemerch, reg.zona].tot_unit_sell + reg.cant_unit;
        matt[reg.typemerch, reg.zona].tot_grav:= matt[reg.typemerch, reg.zona].tot_grav + reg.tot_grav; 
        matt[reg.typemerch, reg.zona].tot_exIVA:= matt[reg.typemerch, reg.zona].tot_exIVA + reg.tot_exIVA;
        matt[reg.typemerch, reg.zona].val_IVA:= matt[reg.typemerch, reg.zona].val_IVA + reg.val_IVA;
    
        matt[reg.typemerch, 10].tot_unit_sell:= matt[5, reg.zona].tot_unit_sell + reg.cant_unit;
        matt[reg.typemerch, 10].tot_grav:= matt[5, reg.zona].tot_grav + reg.tot_grav;
        matt[reg.typemerch, 10].tot_exIVA:= matt[5, reg.zona].tot_exIVA + reg.tot_exIVA;
        matt[reg.typemerch, 10].val_IVA:= matt[5, reg.zona].val_IVA + reg.val_IVA;
         
        matt[5, reg.zona].tot_unit_sell:= matt[5, reg.zona].tot_unit_sell + reg.cant_unit;
        matt[5, reg.zona].tot_grav:= matt[5, reg.zona].tot_grav + reg.tot_grav;
        matt[5, reg.zona].tot_exIVA:= matt[5, reg.zona].tot_exIVA + reg.tot_exIVA;
        matt[5, reg.zona].val_IVA:= matt[5, reg.zona].val_IVA + reg.val_IVA;

        matt[5, 10].tot_unit_sell:= matt[5, 10].tot_unit_sell + reg.cant_unit;
        matt[5, 10].tot_grav:= matt[5, 10].tot_grav + reg.tot_grav;
        matt[5, 10].tot_exIVA:= matt[5, 10].tot_exIVA + reg.tot_exIVA;
        matt[5, 10].val_IVA:= matt[5, 10].val_IVA + reg.val_IVA;

        leer(arch, reg);
    fin_mientras
    
    para y:= 1 hasta 10-1 hacer
        para x:= 1 hasta 5-1 hacer
            esc('Totales para Zona >> ', y, '| Tipo de mercadería >> ', x);
            esc('Unidades vendidas >> ', matt[x,y].tot_unit_sell);
            esc('Total gravado >> ', matt[x,y].tot_grav);
            esc('Total exento de IVA  >> ', matt[x,y].tot_exIVA);
            esc('Valor del IVA >> ', matt[x,y].val_IVA);
        fin_para
        esc('Total para Zona ', y,  ' >> ', matt[x+1, y]);
    fin_para 
   
    escribir ('El total de unidades vendidas es', matt[5, 10].tot_unit_sell)
    escribir ('El total gravado es', matt[5, 10].tot_grav)
    escribir ('El total exento de IVA es', matt[5, 10].tot_exIVA);
    escribir ('El valor total del IVA es', matt[5, 10].val_IVA)
   
    cerrar(arch);

Fin_Acción.

