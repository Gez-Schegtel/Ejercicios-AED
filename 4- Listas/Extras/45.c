

Dada una lista simplemente encadenada que contiene datos de todas las provincias de la República Argentina: nombre, capital, cantidad total de habitantes y cantidad de analfabetos, y está ordenada en forma decreciente por número de habitantes analfabetos, generar otras tres listas que contengan el nombre, la capital y el porcentaje de analfabetos de las Provincias que respondan a las siguientes restricciones.

    L1: <= 10 % analfabetos
    L2: 16 a 25 % analfabetos
    L3: => 26 % analfabetos
    primera lista: ordenada de forma decreciente según número de habitantes analfabetos

acción 45 (prim: puntero a NODO) es;
ambiente 
   
    NODO = registro 
        nombre: an(30);
        capital: an(30);
        cant_hab: entero;
        cant_ana: entero;
        prox: puntero a NODO;
    fin_registro 
    
    NODO2 = registro 
        nombre: an(30);
        capital: an(30);
        por_ana: entero;
        prox: puntero a NODO;
    fin_registro 

    p: puntero a NODO; 
    q, r, s, primq, primr, prims: puntero a NODO2;
    
    cond: entero

proceso 

    si (prim = NIL) entonces 
        esc('Error! la lista está vacía.');
    sino 
        p:= prim;
        primq:= NIL;
        primr:= NIL;
        prims:= NIL;
        
        mientras (p <> NIL) hacer
            cond:= ((*p.cant_ana*100) DIV *p.cant_hab);

            si (cond <= 10) entonces
                nuevo(q);
                *q.nombre:= *p.nombre;
                *q.capital:= *p.capital;
                *q.por_ana:= cond;
                *q.prox:= NIL;

                si (primq = NIL) entonces 
                    primq:= q;
                sino    
                    *antq.prox:= q;
                fin_si

                antq:= q;
            sino 
                si ((cond >= 16) y (cond <= 25)) entonces
                    nuevo(r);
                    *r.nombre:= *p.nombre;
                    *r.capital:= *p.capital;
                    *r.por_ana:= cond;
                    *r.prox:= NIL;

                    si (primr = NIL) entonces 
                        primr:= r;
                    sino    
                        *antr.prox:= r;
                    fin_si

                    antr:= r;   
                sino 
                    si (cond >= 26) entonces 
                        nuevo(s);
                        *s.nombre:= *p.nombre;
                        *s.capital:= *p.capital;
                        *s.por_ana:= cond;
                       
                        si (prims = NIL) entonces 
                            prims:= s;
                        sino    
                            *ants.prox:= s;
                        fin_si

                        ants:= s;
                    fin_si
                fin_si
            fin_si
            
            p:= *p.prox
        fin_mientras

    fin_si 

fin_acción.

/****************

>> Carga encolada (FIFO) << 

LEER (valor)

Prim:= nil
MIENTRAS (valor <> '*') HACER
    NUEVO (p)
    *p.Dato:= valor
    *p.Prox:= nil

    SI Prim = nil ENTONCES
        Prim = p
    SINO
        *a.Prox:= p
    FIN SI
    a:=p
    LEER(valor)
FIN MIENTRAS

****************/