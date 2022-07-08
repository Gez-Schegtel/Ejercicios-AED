

Un importante supermercado de la ciudad de Rcia. cuenta con un archivo secuencial de STOCK (ordenadas por ProductoID) de sus productos para las ventas online:

| ProductoID | Stock | 

Durante el día, se van registrando ventas y devoluciones en el sitio web del supermercado. Estos movimientos se registran en el archivo secuencial MOVIMIENTOS_DIARIOS (ordenado por ProductoID)

| ProductoID | ClienteID | Tipo | Cantidad | PrecioUnitario | Total | TipoEnvío | 

Todas las madrugadas corre un proceso automático que genera las facturas correspondientes a las compras ingresadas. Se ha contratado a usted para que desarrolle un algoritmo de actualización de Stock.

La información de los PRODUCTOS se encuentra en un archivo separado, indexado por ProductoID.

| ProductoID | Nombre | Descripción | Rubro | 

Los Rubros pueden categorizarse como: Limpieza, Carnicería, Verdulería, Bazar, Panadería

Consideraciones a tener en cuenta: 

+ Solo se procederá a descontar el stock de aquellos movimientos para los cuales el stock sea mayor o igual a la cantidad demandada.

+ El tipo de envío puede ser: 
    - Envío a domicilio 
    - Retiro en sucursal

+ El campo TIPO en MOVIMIENTOS_DIARIOS indica:
    - C: Compra de un producto
    - D: Devolución de un producto 

+ Las compras disminuyen el stock del producto, mientras que las devoluciones deberán incrementar dicho valor 

Además, se solicita los siguientes informes: 
    a) Informar la cantidad de productos que no se han podido vender por falta de stock, mostrando nombre y rubro. 
    b) Informar la cantidad productos que deberán retirarse en sucursal.

Acción p1 ES;
Ambiente
    stock = registro 
        p_id: n(4);
        stock: n(4);
    fin_registro 

    mae: archivo de stock ordenado por p_id;
    rmae: stock;

    act: archivo de stock ordenado por p_id;
    ract: stock;

    mov_di = registro 
        p_id: n(4);
        cl_id: n(4);
        tipo: ('C', 'D');
        cant: n(4);
        p_unit: real;
        total: real;
        tipo_env: ('ED', 'RS');
    fin_registro

    mov: archivo de mov_di ordenado por p_id;
    rmov: mov_di;

    productos = registro 
        p_id: n(4);
        nombre: an(40);
        desc: an(255);
        rubro: ('L', 'C', 'V', 'B', 'P');
    fin_registro 

    ind: archivo de productos indexado por p_id;
    rind: productos;

    procedimiento avanzar_mae ES;
    proceso 
        leer(mae, rmae);
        
        si FDA(mae) entonces
            rmae.p_id:= HV;
        fin_si 

    fin_procedimiento

    procedimiento avanzar_mov ES;
    proceso
        leer(mov,rmov)
        si FDA (mov) entonces
            rmov.p_id:= HV
        fin_si
    fin_procedimiento

    cont_nv: entero;
    cont_env: entero; 
    
    procedimiento iguales ES;
    proceso 
        ract:= rmae;
        cont_nv:= 0;
            
        mientras (ract.p_id = rmov.p_id) hacer 

            si (ract.stock >= rmov.cant) y (rmov.tipo = 'C') entonces
                ract.stock:= ract.stock - rmov.cant;
                
                si (rmov.tipo_env = 'RS') entonces
                    cont_env:= cont_env + 1;
                fin_si

            sino
                si (ract.stock < rmov.cant) y (rmov.tipo = 'C') entonces  
                    esc('No se pudo concretar la venta por falta de stock en el inventario.');
                    cont_nv:= cont_nv + 1;
               
                sino
                    si (rmov.tipo = 'D') entonces
                        ract.stock:= ract.stock + rmov.cant;
                    fin_si 
                fin_si 
            fin_si

            avanzar_mov;
        fin_mientras 

        si (cont_nv <> 0) entonces 
            rind.p_id:= ract.p_id;
            leer(ind, rind);

            si EXISTE entonces
                esc('Nombre producto que no se consiguió vender >> ', rind.nombre);
                esc('Cantidad que no se consiguió vender >> ', cont_nv);
                esc('Rubro >> ', rind.rubro);
            sino 
                esc('No se encontró el artículo >> ', ract.p_id);
            fin_si 

        fin_si 

        esc(act, ract);
        avanzar_mae;
    
    fin_procedimiento

    procedimiento mae_menor ES;
    proceso 
        ract:= rmae;
        esc(act, ract);

        avanzar_mae;
    fin_procedimiento

Proceso 
    abrir e/(mae);
    abrir e/(mov);
    abrir e/(ind);
    abrir /s(act);
    
    avanzar_mae;
    avanzar_mov;

    cont_env:= 0;    

    mientras (rmae.p_id <> HV) o (rmov.p_id <> HV) hacer

        si (rmae.p_id = rmov.p_id) entonces
            iguales;
        sino
            si (rmae.p_id < rmov.p_id) entonces 
                mae_menor;
            sino 
                // rmae.p_id > rmov.p_id //
                esc('Error, no es posible el movimiento.');
                avanzar_mov;
            fin_si 
        fin_si 
    
    fin_mientras 
  
    escribir ('Cantidad de artículos para retirar en sucursal >> ', cont_env);
   
    cerrar(mae);
    cerrar(mov);
    cerrar(ind);
    cerrar(act);

Fin_Acción.

