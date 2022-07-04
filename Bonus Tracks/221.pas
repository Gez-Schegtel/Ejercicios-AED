

Ejercicio 2.2.21

En un práctico para la Facultad un grupo de alumnos debe implementar una Red Social llamada UTNBook. Para lo cual debe utilizar los siguientes archivos:

AMIGOS Ordenado por Cod_Usuario y Cod_Amigo

    Cod_Usuario Cod_Amigo Fecha_Amistad Mensaje_Muro 

Cada registro indica la fecha desde que los usuarios son amigos y el último mensaje que un amigo ha escrito en el muro del usuario.

NOTIFICACIONES Ordenado por Cod_Usuario y Cod_Amigo

    Cod_Usuario Cod_Amigo Cod_Movimiento Fecha_Amistad Mensaje_Muro 

Periódicamente se debe actualizar el archivo Amigos, con el fin de que refleje las amistades que posee cada usuario. En el archivo notificaciones pueden existir tres tipos de acciones: la solicitud de una amistad (Cod_mov = 'A'); la eliminación de una amistad (Cod_mov = 'B'); o la información de un mensaje que un amigo ha escrito en el muro del usuario (Cod_mov = 'M'). Considerar que la eliminación de una amistad implica la baja física de un registro y que hay un solo registro de Notificaciones por cada registro de Amigo.

Acción 2.2.21 es
Ambiente
    fecha = registro 
        aaaa: n(4);
        mm: 1..12;
        dd: 1..31;
    fin_registro 

    clave = registro
        cod_user: n(4);
        cod_friend: n(4);        
    fin_registro

    usuario = registro 
        clave_user: clave;
        fecha_amistad: fecha;
        msj_muro: an(340000);
    fin_registro

    mae: archivo de usuario ordenado por cod_user y cod_friend;
    rmae: usuario;

    sally: archivo de usuario ordenado por cod_user y cod_friend;
    rsally: usuario;
    
    notificaciones = registro
        clave_notif: clave;
        cod_movimiento: ('A','B','M');
        Fecha_Amistad: fecha;
        Mensaje_Muro: AN(340000);
    fin_registro

    mov: archivo de notificaciones ordenado por ordenado cod_user y cod_friend;
    rmov: notificaciones;
    
    procedimiento avanza_mae ES;
    proceso
        leer(mae,rmae)
        si FDA (mae) entonces
            rmae.cod_user:=HV
            rmae.cod_friend:=HV
        fin_si
    fin_procedimiento 

    procedimiento avanza_mov ES;
    proceso 
        leer(mov, rmov);
        si FDA(mov) entonces
            regmov.cod_user:= HV;
            regmov.cod_friend:= HV;
        fin_si    
    fin_procedimiento
    
    procedimiento maemenor ES;
    proceso 
        // el usuario no tuvo notificaciones //
        rsally:= rmae;
        esc(sally, rsally);
    fin_procedimiento

    procedimiento maemayor ES;
    proceso
        si (rmae.clave_user.cod_user = rmov.clave_notif.cod_user) y (rmae.clave_user.cod_friend > rmov.clave_notif.cod_friend) y (rmov.cod_mov = 'A') entonces 
            rsally.clave_user:= rmov.clave_notif;
            rsally.fecha_amistad:= rmov.Fecha_Amistad;
            rsally.msj_muro:= rmov.Mensaje_Muro;

            esc(sally, rsally);
        
        sino 
            esc('Error, no es posible el movimiento.');
        fin_si
    fin_procedimiento

    procedimiento maeigual ES;
    proceso
        si (rmov.cod_mov = 'A') entonces
            esc('Error, el movimiento dar de alta no es posible porque este usuario ya está en su lista de amigos.');
            rsally:= rmae;
            esc(sally, rsally);
        sino
            si (rmov.cod_mov = 'B') entonces
                esc('Amigo eliminado exitosamente.');        
            sino
                si (rmov.cod_mov = 'M') entonces
                    rsally:= rmae;
                    rsally.msj_muro:= rmov.Mensaje_Muro;
                    esc(sally, rsally);
                fin_si
            fin_si 
        fin_si 
    fin_procedimiento


Proceso 
    abrir e/(mae);
    abrir e/(mov);
    abrir /s(sally);
    
    avanza_mae;
    avanza_mov;

    mientras (rmae.clave_user <> HV) o (rmov.clave_notif <> HV) hacer

        si (rmae.clave_user > rmov.clave_notif) entonces 
            maemayor;
            avanza_mov;
        sino
            si (rmae.clave_user < rmov.clave)
                maemenor;
                avanza_mae;
            sino
                // Son iguales //
                maeigual;
                avanza_mae;
                avanza_mov;
            fin_si
        fin_si
    
    fin_mientras 
    
    cerrar(mae);
    cerrar(mov); 
    cerrar(sally);
Fin_Acción
