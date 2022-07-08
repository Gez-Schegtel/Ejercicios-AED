
La empresa "Remises Yapú S.A." necesita solucionar el problema de asignación de vehículos para sus clientes. La empresa posee 105 autos, y maneja dos colas (estructuras FIFO) una llamada "No Asignados" y otra llamada "Asignados". En la primera se encuentran todos los autos que no han sido asignados a algún cliente en lo que va del día y en la segunda los autos que ya han sido asignados. La idea de la cola “Asignados” es manejar en forma equitativa la asignación de turnos, es decir que cada vehículo tenga igual oportunidad de obtener un cliente. Los vehículos se asignan de la siguiente forma:

    Si existen autos “No Asignados”, se toma uno de ellos y se lo mueve a la cola de “Asignados”.
    Si no existen autos “No Asignados”, se toma uno de la cola de “Asignados” , y se lo coloca al final de la cola.

Siempre que se asigna un vehículo se debe incrementar en uno un campo “cantidad_de_clientes", a fin de saber cuantos clientes tuvo. Por final de proceso se requiere saber la cantidad total de clientes de ese día. Se pide: Confeccionar una subacción que realice la asignación de vehículos y el mantenimiento de las colas, usando listas.

acción 4.7.c (primas,primna: puntero a simple) ES;
ambiente

    simple = registro
        cond: ('O','D');
        prox: puntero a simple;
    fin_registro

    p,r,primas,primna,antp: puntero a simple;
    cant_cl: N(8);
    op: ('S','N');
    cant_cl: N(5);

proceso
    p:= primas;
    r:= primna;

    esc('¿Desea asignar un vehículo? S/N')
    leer(op)

    cont_cl:=0
    Mientras (op= 'S') hacer
        si (primna = NIL) entonces
            esc('No hay autos sin asignar.');
            r:=primas;
            primas:= *p.prox;

            p:= primas;
            Mientras (*p.prox <> NIL) entonces
                p:= *p.prox;
            fin_mientras

            *p.prox:= r;
            *r.prox:= NIL;
        sino
            p:= primas;

            Mientras (*p.prox <> NIL) entonces
                p:= *p.prox;
            fin_mientras

            *p.prox:= primna;
            primna:= *primna.prox;
            *(*p.prox).prox:= NIL;

        fin_si
        cont_cl:= cont_cl + 1

        esc('¿Desea asignar otro vehículo?')
        leer(op);
    fin_mientras

    esc('La cantidad de clientes total es: ', cont_cl)
fin_acción
