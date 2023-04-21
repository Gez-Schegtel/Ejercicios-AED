Ante la variedad de los precios de un mismo producto de la canasta familiar, según el valor impuesto por cada uno de los negocios minoristas en los diferentes puntos de venta al público, se requiere informar a la comunidad el valor de los mismos y los comercios que ofrecen el mejor precio para cada uno de ellos en cada una de las zonas en las que se divide la ciudad de Resistencia.
Se cuenta con 3 archivos:
A- PRODUCTO: De cada producto se conoce su ID, su descripción y un dato indicando si pertenece a canasta familiar. ('SI','NO'). Indexado por ID.
B- LOCAL: De cada local se conoce su IDE, la zona a la que pertenece (1..5), y su razón social. Indexado por (IDE y zona).
C- PRECIO: Indexado por IDP, que es la combinación de ID de producto, IDE de local y precio sugerido.

Se solicita: 

A. Almacenar en la estructura de datos que considere más conveniente, datos de todos los productos que integran la canasta familiar (ID,Descripción) junto a los 3 mejores precios (IDE de local y precio sugerido).

¿Como se seleccionan los 3 mejores precios por producto? Se deben seleccionar los tres menores precios de cada producto, en caso de ser más de tres negocios con los mismos valores, mostrar todos los comercios que lo ofrecen. 

B. Informar la zona que más locales con mejores precios sugeridos se ha detectado en este proceso. 

Acción can_bas ES 
Ambiente

    producto = registro 
        id:n(4)
        desc:n(4)
        can_fam:('s','n')
    fin_registro
    
    prod: archivo de producto indexado por id
    reg_prod: producto

    local = registro 
        ide:n(4)
        zona:(1..5)
        raz_soc:an(10)
    fin_registro

    loc: archivo de local indexado por ide y zon
    reg_loc: local 

    precio = registro 
        idp: id:n(4)
             ide:n(4)
             prec_sug:real
    fin_registro

    prec: archivo de precio indexado por idp 
    reg_prec: precio

    prec_loc = registro 
        prec:real
        id:n(4)
    fin_registro
    
    nodo = registro 
        id:n(4)
        desc:an(50)
        arr:arreglo [1..3] de prec_loc
        prox:puntero a nodo
    fin_registro    
    aq,primq,q: puntero a nodo

    arr2:arreglo [1..5] de entero;

    x,cont,res,res_zona,cont_2:entero 
    res_prec: real
    band:= booleano

    procedimiento cargacero ES 
        para x:= 1 hasta 5 hacer
            arr2[x]:=0
        fin_para
    fin_procedimiento
    
    res_prec,res_id:entero 

Proceso
    abrir e/(prod)
    abrir e/(loc)
    abrir e/(prec)
    leer(prod,reg_prod)
    primq:= nil
    cargacero 

    Mientras NFDA (prod) hacer 
        si (reg_prod.can_fam = 's') entonces 

            reg_prec.idp.id:= reg_prod.id
            leer(prec,reg_prec)

            si EXISTE entonces 
                nuevo(q)

                si (primq = nil) entonces 
                    primq:=q
                    aq:=primq
                sino 
                    *aq.prox:=q
                    *q.prox:=nil
                fin_si 

                *q.id:= reg_prod.id
                *q.desc:= reg_prod.des 
                para x:= 1 hasta 3 hacer 
                    *q.arr[x].prec:=0
                fin_para
                
                Mientras (reg_prod.id = reg_prec.idp.id) hacer
                    reg_loc.ide:= reg_prec.idp.ide
                    leer(loc,reg_loc)
                
                    si EXISTE entonces 
                        band:= falso
                        x:=1
                        Mientras (x<4) y no(band) hacer
                            si (*p.arr[x].prec = 0) entonces
                                *p.arr[x].prec:= reg_prec.idp.prec_sug
                                *p.arr[x].id:= reg_prec.idp.ide
                                
                            sino
                                si (reg_prec.idp.prec_sug < arr[x].prec)
                                    res_prec:= arr[x].prec
                                    res_id:= arr[x].id
                                    arr[x].prec:= arr[]
                                sino 
                                    si (reg_prec.idp.prec_sug = arr[x].prec) entonces

                                    fin_si
                                fin_si
                                band:=verdadero
                            fin_si
                            x:= x + 1
                        fin_mientras
                    fin_si   
                    leer(prec, reg_prec)
                fin_mientras 

                rr:=primr
                cont:= 1

                Mientras (p <> nil) y (cont < 4) hacer
                    *q.arr[cont].prec:= *rr.prec
                    *q.arr[cont].id:= *rr.id
                    arr[*rr.zona]:= arr[*rr.zona] + 1
                    ar:=rr 
                    rr:=*rr.prox
                fin_mientras
                
                si (*rr.prec = *(*rr.prox).prec) entonces //la condicion de los 3 iguales
                    res_prec:= *rr.prec
                    rr:=primr

                    Mientras (res_prec <= *rr.prec) y (rr <> nil) hacer
                        esc('El comercio: ', *rr.id, ' tiene precios sugeridos para el producto: ', reg_prod.id, ' el cual es de: ', *rr.prec, ' $.')
                        rr:=*r.prox
                    fin_mientras
                fin_si
                
                {rr:=primr //otra forma de hacer 
                cont:=0
                cont2:=1
                band:= falso 
                Mientras (cont < 4) y no (band) hacer 
                    ar:=rr
                    Mientras (*rr.prec = *(*rr.prox).prec) y (cont2 < 3) hacer 
                        cont_2:= cont_2 + 1 
                        rr:=*rr.prox
                    fin_mientras

                    si (cont2>3) entonces 
                        rr:= ar
                        Mientras (*ar.prec = *rr.prec) hacer
                            esc('El comercio: ', *rr.id, ' tiene precios sugeridos para el producto: ', reg_prod.id, ' el cual es de: ', *rr.prec, ' $.')
                            rr:=*rr.prox
                        fin_mientras
                        band:=verdadero
                    sino
                        rr:= *rr.prox
                        cont:= cont + 1
                    fin_si
                fin_mientras
                
                }

                rr:=primr 

                Mientras (rr <> nil) hacer //borro todos los nodos de la lista auxiliar
                    ar:= rr 
                    rr:= *rr.prox
                    disponer(ar)
                fin_mientras
        fin_si
        leer(prod,reg_prod)
    fin_mientras
    
    res:= LV
    para x:= 1 hasta 5 hacer 
        si (arr2[x] > res) entonces 
            res:= arr2[x]
            res_zona:= x
        fin_si 
    fin_para  
    
    esc('La zona con mas locales con precios sugeridos es la:', res_zona, ' con: ', res, ' locales sugeridos.')

    cerrar(prod)
    cerrar(loc)
    cerrar(prec)    

fin_accion