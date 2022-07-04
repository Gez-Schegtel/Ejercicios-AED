
acción 41 (pr: puntero a nodo) es;
ambiente
    nodo = registro
        dt: entero;
        prox: puntero a nodo;
    fin_registro

    p, a, q: puntero a nodo;
    k, c: entero;
    op: (1..3);

    procedimiento acceder es;
        esc('El dato de la posición solicitada (', k, ') es: ', *p.dt);
    fin_procedimiento

    procedimiento eliminar es;
        si (p = pr) entonces
            pr:= *p.prox;
            diponer(p);
        sino
            a:= *p.prox;
            disponer(p);
        fin_si
        esc('Elemento en la posición ', k, ' eliminado con éxito.');
    fin_procedimiento

    procedimiento insertar es;
        nuevo(q);
        esc('Ingrese el dato que almacenará el nodo: ');
        leer(*q.dt);

        si (p = pr) entonces
            *q.prox:= pr;
            pr:= q;
        sino
            *q.prox:= p;
            *a.prox:= q;
        fin_si
    fin_procedimiento

proceso
    si (pr <> NIL) entonces

        esc('Ingrese el k-ésimo elemento que quiera tratar.');
        leer(k);

        p:= pr;
        c:= 1;

        mientras (c <> k) y (*p.prox <> NIL) hacer
            a:= p;
            p:= *p.prox;
            c:= c + 1;
        fin_mientras

        si (c = k) entonces
            esc('Ingrese la opción que desee realizar con el elemento...');
            esc('1- Acceder.');
            esc('2- Eliminar.');
            esc('3- Insertar.');

            según (op) hacer
                1: acceder();
                2: eliminar();
                3: insertar();
            fin_según
        sino
            esc('Error, la posición buscada sobrepasó la longitud de la lista.');
        fin_si

    sino
        esc('Error, la lista de entrada está vacía!');
    fin_si
fin_acción.
