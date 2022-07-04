


Ejercicio 2.3.1.b

Dado un fichero secuencial de Facturas, ordenado por Nro. de Cliente y Nro. de Factura, con la siguiente estructura:

FACTURAS Ordenado por Nro_Cliente, Nro_Factura

    Nro_Cliente Nro_Factura Fecha Importe 

Se desea un listado con el siguiente detalle:
Nro. Cliente 	Nombre Cliente 	Total Facturado 	Cantidad de Facturas
			

Los datos del cliente se encuentran en un fichero indexado por Nro. de Cliente, que tiene la siguiente estructura:

CLIENTES Indexado por Nro_Cliente

    Nro_Cliente Nombre DNI CUIT Domicilio 



Acción 231 ES;
Ambiente
    fecha = registro 
        aaaa: n(4);
        mm: 1..12; 
        dd: 1..31;
    fin_registro 

    facturas = registro
        nro_cli: n(3);
        nro_fact: n(3);
        fecha_fact: fecha;
        importe: real;
    fin_registro

    arch: archivo de facturas ordenado por nro_cli y nro_fact
    reg:factura

    clientes = registro
        nro_cli: n(3);
        nombre: an(40);
        dni: n(8);
        cuit: n(11);
        domicilio: an(40);
    fin_registro

    arch2: archivo de clientes indexado por nro_cli;
    reg2: clientes;
    cont: entero;
    acuml: real;

Proceso
    abrir e/(arch);
    abrir e/(arch2);
    leer(arch,reg);

    mientras NFDA(arch) hacer

        reg2.nro_cli:= reg.nro_cli;
        leer(arch2, reg2);
        
        si EXISTE entonces
            cont:= 0;
            acuml:= 0;
            mientras (reg.nro_cli = reg2.nro_cli) hacer
                cont:= cont + 1;
                acuml:= acuml + reg.importe;
                
                leer(arch, reg);
            fin_mientras 

            esc('Número de cliente >> ', reg.nro_cli);
            esc('Nombre del cliente >> ', reg2.nombre);
            esc('Total facturado >> ', acuml);
            esc('Cantidad de facturas >> ', cont);
        
        sino
            esc('No se encontró el cliente número >> ', reg.nro_cli);
            leer(arch,reg);
        fin_si
    
    fin_mientras
    
    cerrar(arch);
    cerrar(arch2);

Fin_Acción.