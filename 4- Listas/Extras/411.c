

En una empresa de servicios motorizados que NO posee una cantidad fija de integrantes, pero siempre es mayor que 1 (uno). Los datos de las personas está almacenados en un archivo (DNI, Nombre, Antigüedad) ordenado por DNI. Realizar un algoritmo que permita generar una lista de asignación (usando una estructura de lista doblemente encadenada), ordenada al principio por antigüedad, y un proceso que realice dicha asignación, en cada solicitud, por turno según orden en la lista. Una vez asignada dicha persona se va al final de la lista para esperar su nueva asignación. Al final del día informar cuantas asignaciones tuvo cada integrante.

    PERSONAL

    DNI N(5) Nombre AN(50) Asignaciones N(5) Antigüedad N(2)

/****************************************************************
*                                                               *
*   ACLARACIÓN:                                                 *
*   La consigna de este ejercicio la entedimos más o menos      *
*   y la adaptamos a nuestra imaginación xD                     *
*                                                               *
*****************************************************************/

acción ejercicioraro ES;
ambiente
    persona1 = registro
        DNI: N(5);
        Nombre: AN(50);
        Antiguedad: N(5);
    fin_registro

    arch: archivo de persona ordenado por DNI;
    reg: persona

    PERSONA = registro
        DNI: N(8);
        Nombre: AN(50);
        Antiguedad: N(2);
        Asignaciones: N(5);
        prox: puntero a PERSONA;
        ant: puntero a PERSONA;
    fin_registro

    prim, ult, p, q, nsx: puntero a PERSONA

    op: ('S', 'N');
    DNI:N(8);

proceso
    abrir E/(arch);
    leer(arch, reg);

    prim:= NIL;

    mientras (NFDA) hacer
        nuevo(q);
        *q.DNI:= reg.DNI;
        *q.nombre:= reg.Nombre;
        *q.Antiguedad:= reg.Antiguedad;
        *q.Asignación:= 0;

        si (prim = NIL) entonces
            prim:= q;
            ult:= q;
            *q.prox:= NIL;
            *q.ant:= NIL;
        sino
            /* Si entro acá, es porque tengo que insertar después del primer nodo */
            p:=prim;
            Mientras ((*p.dato < *(*p.prox).dato) y (*p.prox <> NIL)) hacer
                p:= *p.prox;
            fin_mientras

            si (p = prim) entonces
                /* Insertamos antes del primer elemento */
                prim:= q;
                *q.prox:= p;
                *q.ant:= NIL;
                *p.ant:= q;

            sino
                si (*p.prox = NIL) entonces
                    /* Insertamos en la última posición */
                    *p.prox:= q;
                    *q.ant:= p;
                    *q.prox:= NIL;
                    ult:= q;
                sino
                    /* Insertamos en el medio */
                    *(*p.prox).ant:= q;
                    *q.prox:= *p.prox;
                    *q.ant:= p;
                    *p.prox:= q;
                fin_si
            fin_si
        fin_si
        leer(arch,reg);
    fin_mientras
    cerrar(arch);

    esc('¿Desea asignar un envío? S/N');
    leer(op);

    mientras (op = 'S') hacer

        esc('Ingrese el DNI, mr. Stalker');
        leer(DNI);

        p:= prim;
        mientras (*p.DNI <> DNI) y (*p.prox <> NIL) hacer
            p:= *p.prox;
        fin_mientras

        si (*p.DNI = DNI) entonces
            /* Tenemos que mandar el nodo al final de la lista */
            *p.asignación:= *p.asignación + 1;

            si (p = prim) entonces
                /* Actualizamos prim y lo mandamos al final */
                prim:= *p.prox;
                *prim.ant:= NIL;

                *ult.prox:= p;
                *p.ant:= ult;
                ult:= p;
                *ult.prox:= NIL;
            sino
                si (*p.prox = NIL) entonces
                    /* Es el último nodo. Queda como está */
                sino
                    /* Mandamos un nodo del medio al final */
                    *(*p.prox).ant:= *p.ant
                    *(*p.ant).prox:= *p.prox

                    *ult.prox:= p;
                    *p.ant:= ult;
                    ult:= p;
                    *ult.prox:= NIL;

                fin_si
            fin_si

        sino
            esc('Error!, el DNI ingresado no se ha encontrado');
        fin_si

        esc('¿Desea realizar otra asignación? S/N');
        leer(op);

    fin_mientras

    p:= prim;
    mientras (*p.prox <> NIL) hacer
        esc('El repartidor', *p.nombre, ' tuvo ', *p.asignaciones, ' asignaciones.');
        p:= *p.prox
    fin_mientras

fin_acción
