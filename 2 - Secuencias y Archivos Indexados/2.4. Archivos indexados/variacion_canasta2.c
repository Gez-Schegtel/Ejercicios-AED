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

    x,res,res_zona: entero 
    band: booleano

    procedimiento cargacero ES 
        para x:= 1 hasta 5 hacer
            arr2[x]:=0
        fin_para
    fin_procedimiento

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
                    *q.arr[x].prec:=HV
                fin_para
                
                band:=falso 
                Mientras (reg_prod.id = reg_prec.idp.id) hacer
                    reg_loc.ide:= reg_prec.idp.ide
                    leer(loc,reg_loc)
                
                    si EXISTE entonces 
                        si (reg.ipc.prec_sug < arr[1].prec) entonces
                            arr[3].prec:=arr[2].prec 
                            arr[3].id:= arr[2].prec 
                            arr[2].prec:= arr[1].prec  
                            arr[2].id:= arr[1].id
                            arr[1].prec:= reg.idp.prec_sug 
                            arr[1].id:= reg.idp.id
                        sino 
                            si (reg.ipc.prec_sug < arr[2].prec) entonces
                                arr[3].prec:= arr[2].prec 
                                arr[3].id:= arr[2].id 
                                arr[2].prec:= reg.idp.prec_sug 
                                arr[2].id:= reg.idp.ide 
                            sino 
                                si (reg.ipc.prec_sug < arr[3].prec) entonces
                                    arr[3].prec:= reg.idp.prec_sug 
                                    arr[3].id:= reg.idp.ide 
                                fin_si 
                            fin_si 
                            band:= falso 
                        fin_si
                        
                        si no(band) y (arr[1].prec = arr[2].prec) y (arr[2].prec = arr[3].prec) y (arr[3].prec = reg.idp.prec_sug) entonces 
                            band:=verdadero 
                        fin_si 
                    fin_si
                    leer(prec, reg_prec)  
                fin_mientras

                si (band) entonces 
                    reg_prec_id:= reg_prod_id
                    leer(prec,reg_prec)

                    si EXISTE entonces 
                        Mientras (reg_prod.id = reg_prec.idp.id) hacer 
                            si (*q.arr[1].prec = reg_prec.idp.prec_sug) entonces 

                                esc('El comercio: ', reg_prec.idp.ide, ' para el producto: ', reg_prod.id, ' tiene un precio sugerido, el cual es: ', *q.arr[1].prec)

                                reg_loc.ide:= reg_prec.idp.ide 
                                leer(loc,reg_loc)

                                si EXISTE entonces 
                                    arr2[reg_loc.zona]:= arr[reg_loc.zona] + 1
                                fin_si
                            fin_si 
                            leer(prec,reg_prec)
                        fin_mientras
                    fin_si
                sino 
                    para x:= 1 hasta 3 hacer 
                        reg_loc.ide:= *q.arr[x].id 
                        leer(loc,reg_loc)
                        
                        si EXISTE entonces 
                            arr2[reg_loc.zona]:= arr2[reg_loc.zona] + 1
                        fin_si 
                    fin_para 
                fin_si 
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