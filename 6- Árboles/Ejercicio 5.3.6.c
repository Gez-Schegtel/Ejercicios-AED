Escriba un algoritmo que permita recorrer el siguiente árbol en los tres procedimientos, realice la prueba de escritorio

Accion (prim:puntero a t) ES;
Ambiente

    t = registro    
        dato: entero
        izq,der: puntero a t
    fin_registro

    Procedimiento enorden(p:puntero a t) ES
        si (p <> nil) entonces
            enorden(*p.izq)
            esc(*p.dato)
            enorden(*p.der)
        fin_si
    fin_procedimiento

    Procedimiento preorden(p:puntero a t) ES
        esc(*p.dato)
        preorden(*p.izq)
        preorden(*p.der)
    fin_procedimiento

    Procedimiento postorden(p:puntero a t) ES 
        postorden(*p.izq)
        postorden(*p.der)
        esc(*p.dato)
    fin_procedimiento

Procedimiento
    esc('El recorrido inorden del arbol es: ')
    enorden(prim)

    esc('El recorrido preorden del arbol es: ')
    preorden(prim)

    esc('El recorrido postorden del arbol es: ')
    postorden(prim)

fin_ejercicio
