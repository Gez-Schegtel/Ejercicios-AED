Suponiendo que un árbol está definido como la estructura recursiva de datos:


arbol = registro
    x: entero
    izq, der: puntero a arbol
fin registro

Escribir un algoritmo que encuentre un elemento con una clave dada C, y realice una operación P con él.

Accion (prim: puntero a arbol) ES 
Ambiente

    arbol = registro
        dato: entero
        izq, der: puntero a arbol
    fin registro

    cl:entero

    procedimiento bus(p:puntero a arbol) ES 
        si (p <> nil) entonces
            si (p.dato = cl) entonces
                esc(*p.dato)
             sino
                   bus(*p.izq)
                   bus(*p.der)
            fin_si
        fin_si
    fin_procedimiento
Proceso
    esc('Ingrese un elemento a encontrar en el arbol.')
    leer(cl)
    bus(prim)

fin_accion