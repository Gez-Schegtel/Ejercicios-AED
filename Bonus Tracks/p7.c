
La Liga Universitaria de Juegos Electrónicos cuenta con una red de servidores interconectados de forma tal de garantizar la competencia de UTNET para el fin de semana.
Los datos de cada servidor se encuentran en un archivo con el siguiente formato:

 ServerlD N(13) | SO (Windows | Linux | MAC OS)| Capacidad N(5) |
 En el campo Capacidad se almacena la cantidad máxima de conexiones activas que puede soportar

 La red se estructura ordenando los servidores de acuerdo a su capacidad (en orden ascendente).

Para validar la red, se arma una prueba piloto de la competencia, simulando conexiones entrantes a la red. Cada conexión se asigna a un servidor de acuerdo al orden en la red,siempre y cuando:

1. El SO de la conexión sea el mismo al servidor al cual se asigna

2. La capacidad del servidor actual esté ocupada en menos del 90%, sino se pasa al siguiente servidor.

Se necesita un algoritmo que simule la asignación de conexiones a cada servidor de la Red, e informe al final:
1. Lista de servidores con su capacidad ocupada, en orden inverso al cargado.

acción parci ES;
ambiente

    servidor = fin_registro
        servID: N(13);
        SO: ('Windows', 'Linux', 'MACOS');
        capacidad: N(5);
    fin_registro

    arch: archivo de servidor;
    reg: servidor;

    uSO: ('Windows', 'Linux', 'MACOS');

    NODO = fin_registro
        servID: N(13);
        SO: ('Windows', 'Linux', 'MACOS');
        capacidad: N(5);
        c_act: N(5);
        prox: puntero a NODO;
        ant: puntero a NODO;
    fin_registro

    rq,q,primq,ultq: puntero a NODO;
    op: ('S','N');

proceso
    abrir e/(arch);
    leer(arch, reg);

    primq:= NIL;
    /* Cargamos la lista */
    mientras NFDA(arch) hacer
        nuevo(q);
        *q.servID:= reg.servID;
        *q.SO:= reg.SO;
        *q.capacidad:= reg.capacidad;
        *q.c_act:= 0;

        si (primq = NIL) entonces
            primq:= q;
            *q.prox:= NIL;
            *q.ant:= NIL;
            ultq:= q;
        sino
            rq:= primq;
            mientras ((*rq.prox <> NIL) y (*q.capacidad > *rq.capacidad)) hacer
                rq:= *rq.prox;
            fin_mientras

            si (*q.capacidad < *rq.capacidad) entonces
                si (rq = primq) entonces
                    *q.prox:= primq;
                    *q.ant:= NIL;
                    primq:= q;
                sino
                    *q.ant:= *rq.ant;
                    *(*rq.ant).prox := q;
                    *q.prox:= rq;
                    *rq.ant:= q;
                fin_si
            sino
                q.ant:= ultq;
                *q.prox:= NIL;
                *ultq.prox:= q;
                ultq:=q;
            fin_si
        fin_si
    fin_mientras

    esc('¿Desea simular una conexión. S/N');
    leer(op);

    rq:= primq;
    mientras (op = 'S') hacer
        esc('Ingrese el SO.');
        leer(uSO);

        si ((*rq.SO = uSO) y (*rq.activas < (*rq.capacidad * 0.9))) entonces;
            *rq.c_act:= *rq.c_act + 1;
        sino
            si ((*rq.SO = uSO) y (*rq.activas > (*rq.capacidad * 0.9))) entonces}
                rq:= *rq.prox;
                *rq.c_act:= *rq.c_act + 1;
            fin_si
        fin_si

        esc('¿Desea realizar otra conexión.');
        leer(op);
    fin_mientras

    rq:= ultq;
    mientras (rq <> NIL) hacer
        si (*rq.c_act = *rq.capacidad) entonces
            esc(*rq.servID);
        fin_si
        rq:= *rq.ant;
    fin_mientras

fin_acción.
