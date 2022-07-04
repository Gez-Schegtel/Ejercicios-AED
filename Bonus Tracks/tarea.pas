

Dado el sitio web de una empresa se quiere tener la opinión de los clientes en cuanto a su experiencia en la página, tanto para realizar consultas sobre productos como de compras realizadas. El archivo donde se guardó la información tiene el siguiente formato:
OPINIONES (ordenado por USUARIO, FECHA DE OPINIÓN)
    USUARIO FECHA OPINION FECHA ULTIMA COMPRA CALIFICACIÓN(1 a 5) SERVICIO CALIFICADO 

USUARIOS( Indexado por USUARIO)
    USUARIO APELLIDO Y NOMBRE CATEGORIA (Silver-Gold)

Los servicios son 20 y su descripción se encuentra cargada en un arreglo en el que la posición identifica el código de este.
Se necesita:
● Informar el nombre del servicio con mayor cantidad de calificaciones mínimas (igual a 1 o 2)
● Actualizar el archivo de usuarios a categoría “GOLD” a aquellos que hayan emitido más de 5 opiniones.

Acción tarea_rara ES;
Ambiente 
    fecha = registro
        dd: (1..31);
        mm: (1..12);
        aaaa: n(4);
    fin_registro
    
    opiniones = registro 
        usu: an(40); 
        f_op: fecha;
        f_uc: fecha;
        calif: (1..5);
        se_calif: (1..20);
    fin_registro 
            
    arch: archivo de opiniones ordenado por usu y f_op;
    reg: opiniones        

    usuarios = registro 
        usu: an(40);
        ayn: an(30);
        cat: ('Silver', 'Gold');
    fin_registro 
    
    user: archivo de usuarios indexado por usu;
    ruser: usuarios

    arr: arreglo de [1..20] de AN;
    x: entero;
    -
    procedimiento carga1 es;
    proceso
        para x:= 1 hasta 20 hacer
            esc('Cargue la descripción para el servicio', x)
            leer(arr[x])
        fin_para
    fin_procedimiento

    cont_usu: entero;

    cal_johnson: arreglo de [1..20] de entero;
    c: entero;

    procedimiento carga2 ES;
    proceso 
        para c:= 1 hasta 20 hacer
            cal_johnson[c]:= 0;
        fin_para
    fin_procedimiento
    
    ghost_rider: entero;
    poxi_mix: entero;
    
Proceso
    carga1; 
    carga2;

    abrir e/(arch);
    abrir e/s(user);
    
    leer(arch, reg);

    mientras NFDA(arch) hacer 

        ruser.usu:= reg.usu;
        leer(user, ruser);
        
        Si EXISTE entonces
            
            cont_usu:= 0;
            mientras (ruser.usu = reg.usu) hacer
                cont_usu:= cont_usu + 1;
                
                si (reg.calif <= 2) entonces 
                    cal_johnson[reg.se_calif]:= cal_johnson[reg.se_calif] + 1;
                fin_si 
                
                leer(arch, reg);
            fin_mientras

            si (cont_usu > 5) entonces 
                ruser.cat:= 'GOLD';
            fin_si
            
        sino
            esc('No se encontró el código de usuario.');
            leer(arch, reg);
        fin_si

    fin_mientras

    ghost_rider:= LV;
    para c:= 1 hasta 20 hacer
        si (cal_johnson[c] > ghost_rider) entonces
            ghost_rider:= cal_johnson[c];
            poxi_mix:= c;
        fin_si 
    fin_para
                                                     
    esc('Servicio con mayor cantidad calif. >> ', poxi_mix, ' con un total de ', ghost_rider, '. Con descripción >> ', arr[poxi_mix]);
    
    cerrar(arch);
    cerrar(user);

Fin_Acción.

● Informar el nombre del servicio con mayor cantidad de calificaciones mínimas (igual a 1 o 2)
● Actualizar el archivo de usuarios a categoría “GOLD” a aquellos que hayan emitido más de 5 opiniones.