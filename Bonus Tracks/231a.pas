
Ejercicio 2.3.1.a
Dado un fichero secuencial de Facturas, ordenado por Nro. de Cliente y Nro. de Factura, con la siguiente estructura:

FACTURAS Ordenado por Nro_Cliente, Nro_Factura

Nro_Cliente Nro_Factura FechaImporte

Se desea un listado con el siguiente detalle:

Nro. Cliente	Nombre Cliente	Numero Factura

Los datos del cliente se encuentran en un fichero indexado por Nro. de Cliente, que tiene la siguiente estructura:

CLIENTES Indexado por Nro_Cliente

Nro_Cliente Nombre DNI CUIT Domicilio

Acción 231a ES;
Ambiente
    fecha = registro 
        aaaa: n(4);
        mm: (1..12);
        dd: (1..31);
    fin_registro 
    
    pastelera = registro 
        nro_cliente: n(4);
        nro_factura: n(4);
        f_importe: fecha;
    fin_registro

    arch: archivo de pastelera ordenado por nro_cliente y nro_factura;
    reg: pastelera;

    medialuna = registro
        nro_cliente: n(4);
        nombre_cliente: an(40);
        dni: n(8);
        cuit: n(11);
        dom: an(40);
    fin_registro

    arch2: archivo de medialuana indexado por nro_cliente;
    reg2: medialuna
    
    
Proceso 
    abrir e/(arch);
    abrir e/(arch2);
    
    leer(arch, reg);
    leer(arch2, reg2);

    mientras NFDA(arch) hacer 
        reg2.nro_cliente:= reg.nro_cliente;
        
        leer(arch2, reg2);

        si EXISTE entonces
            esc('Número de cliente >> ', reg1.nro_cliente);
            esc('Nombre del cliente >> ', reg2.nombre_cliente);
            esc('Número de factura >> ', reg1.nro_factura);
        sino
            esc('No se encontró al cliente. ', reg1.nro_cliente);
        fin_si 

        leer(arch, reg);
    fin_mientras
    
    cerrar(arch);
    cerrar(arch2);
Fin_Acción.

Se desea un listado con el siguiente detalle:

Nro. Cliente	Nombre Cliente	Numero Factura