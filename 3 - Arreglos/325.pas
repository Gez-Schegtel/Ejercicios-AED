Ejercicio 3.25

Una Fábrica que posee 4 plantas de producción en nuestro país y compra materia prima a 3 proveedores distintos, desea realizar un control de los montos totales correspondientes a compras realizadas en cada planta durante el último año, discriminados por proveedor y por mes. Para ello dispone de un archivo con los datos de las facturas correspondientes. (Aclaración: el archivo no está ordenado por ningún criterio)

COMPRAS

    Nro_Factura Proveedor(A,B,C) Fecha dd/mm/aaaa Nro_Planta 1..4 Importe 

Acción 325 ES;
Ambiente 
    fechaformato = registro
        dd: n(1..31);
        mm: n(1..12);
        aaaa: n(4);
    fin_registro                 
                                          
    compra = registro
        nro_factura: n(4);
        proveedor: ('A', 'B', 'C');
        fecha= fechaformato;
        nro_planta: (1..4);
        importe: n(5);
    fin_registro 
    
                    //   x     y     z
    matt1: arreglo de [1..4, 1..13, 1..4] de compra;
    
    procedimiento carga ES;
    proceso
        para z:= 1 hasta 4 hacer 
            para y:= 1 hasta 13 hacer
                para x:= 1 hasta 4 hacer
                    esc('Ingrese el número de factura.');
                    leer(matt1[x,y,z].nro_factura);
                    esc('Ingrese proovedor de la factura.');
                    leer(matt1[x,y,z].proveedor);
                    esc('Ingresá la fecha en el orden dd/mm/aaaa.');
                    leer(matt1[x,y,z].fecha.dd);
                    leer(matt1[x,y,z].fecha.mm);
                    leer(matt1[x,y,z].fecha.aaaa);
                    esc('Ingrese el número de planta.');
                    leer(matt1[x,y,z].nro_Planta)
                    esc('Ingrese el importe.');
                    leer(matt1[x,y,z].importe);
                fin_para
            fin_para 
        fin_para 
    fin_procedimiento

Proceso 
    carga;
    
    para z:= 1 hasta 4 hacer
        para y:= 1 hasta 13-1 hacer
            para x:= 1 hasta 4-1 hacer
                matt1[x,13,z]:= matt1[x,13,z] + matt1[x,y,z].importe;
                matt1[4,y,z]:= matt1[4,y,z] + matt1[x,y,z].importe;
                matt1[4,13,z]:= matt1[4,13,z] + matt1[x,y,z].importe;
            fin_para
        fin_para
    fin_para

Fin_Acción.


