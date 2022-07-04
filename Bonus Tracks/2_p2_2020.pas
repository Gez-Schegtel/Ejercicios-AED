


Teniendo en cuenta el escenario del ejercicio anterior y utilizando el archivo MOVIMIENTOS_DIARIOS y demás estructuras que usted considere necesarias.

Se pide realizar un algoritmo que permita determinar:

a- En qué rubro y tipo de envío se generó mayor movimiento en términos monetarios (importe total.).

b- Cuáles fueron los tipos de envíos cuyo volumen de venta en importe superaron los $200.000.

c- Cuántas devoluciones se produjeron en total.

                rubro     ...     ...     total tipo_env 
tipo_env          ...     ...     ...              ...
...               ...     ...     ...              ...
...               ...     ...     ...              ...
...               ...     ...     ...              ...
total_rubro       ...     ...     ...           total_gral.



Acción p2 ES;
Ambiente 
    
    mov_di = registro 
        p_id: n(4);
        cl_id: n(4);
        tipo: ('C', 'D');
        cant: n(4);
        p_unit: real;
        total: real;
        tipo_env: (1, 2); // ('ED', 'RS');
    fin_registro

    mov: archivo de mov_di ordenado por p_id;
    rmov: mov_di;

    productos = registro 
        p_id: n(4);
        nombre: an(40);
        desc: an(255);
        rubro: (1, 2, 3, 4, 5); // ('L', 'C', 'V', 'B', 'P');
    fin_registro 

    ind: archivo de productos indexado por p_id;
    rind: productos;

    matt: arreglo [1..3, 1..6] de real;   
    
    x:entero
    y:entero   

    procedimiento carga es;
    proceso
        para x:= 1 hasta 3 hacer
            para y:= 1 hasta 6 hacer
                matt[x, y]:= 0;
            fin_para    
        fin_para
    fin_procedimiento 

    cont_dev: entero;
    comp_tipo_env: real;
    comp_rubro: real;
    pos_envio: entero;
    pos_rubro: entero;

Proceso 
    abrir e/(mov);
    abrir e/(ind);
    carga;
    leer(mov,rmov);
    
    cont_dev:= 0;

    mientras NFDA (mov) hacer;

        rind.p_id:= rmov.p_id;
        leer(ind, rind);

        si EXISTE entonces 

            matt[rmov.tipo_env, rind.rubro]:= matt[rmov.tipo_env, rind.rubro] + rmov.total;
            matt[3, rind.rubro]:= matt[3, rind.rubro] + rmov.total;
            matt[rmov.tipo_env, 6]:= matt[rmov.tipo_env, 6] + rmov.total;
            matt[3, 6]:= matt[3, 6] + rmov.total; // Por las dudas xD

            si (rmov.tipo = 'D') entonces
                cont_dev:= cont_dev + 1;
            fin_si 

        sino 

            esc('No se encontró el elemento.');

        fin_si 

        leer(mov, rmov);
    fin_mientras  

    comp_tipo_env:= 0;
    esc('Recordar: tipo envío 1 = entrega a dom., tipo envío 2 = retiro en suc.');
    para x:= 1 hasta 3-1 hacer 
        si (matt[x,6] > comp_tipo_env) entonces
            comp_tipo_env:= matt[x,6];
            pos_envío:= x
        fin_si

        si (matt[x,6] > 200000) entonces
            esc('El tipo de envío ', x, ' superó los $200000 de importe total.');
        fin_si 
    fin_para 

    comp_rubro:= 0;
    para y:= 1 hasta 6-1 hacer
        si (matt[3,y] > comp_rubro) entonces
            comp_rubro:= matt[3,y];
            pos_rubro:= y;
        fin_si
    fin_para
   
    esc('Recordar: 1 = entrega a domicilio, 2 = retiro en sucursal.');
    esc('Tipo de envío que generó un mayor importe >> ', pos_envío, ' con importe total de ', comp_tipo_env);
    
    esc('Recordar: 1 = limpieza, 2 = carnicería, 3 = verdulería, 4 = bazar, 5 = panadería.');
    esc('Rubro que generó un mayor importe >> ', pos_rubro, ' con un importe total de ', comp_rubro);
    
    esc('Se produjeron ', cont_dev, ' devoluciones en total.');
    
    cerrar(mov);
    cerrar(ind);
Fin_Acción.
