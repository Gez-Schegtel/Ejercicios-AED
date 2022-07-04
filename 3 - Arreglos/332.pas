


Ejercicio 3.32¶

La municipalidad posee un archivo secuencial con los datos de todos los estacionamientos realizados en el mes de Octubre de 2018

ESTACIONAMIENTOS
FECHA: fecha 	PATENTE: AN(7) 	HoraDesde: N(2) 	HoraHasta: N(2) 	Posta: 1..100
				

El costo es por multiplos de 1 hora. El costo por hora se calcula considerando la franja horaria del estacionamiento (siempre tomar el mayor costo), las franjas horarias son:

    de 00 a 06: costo por hora $9
    de 07 a 13: costo por hora $14
    de 14 a 19: costo por hora $12
    de 20 a 23: costo por hora $6

Ejemplo: si una persona estaciona desde las 5 hasta las 10, son 6 horas de estacionamiento (10 - 5 + 1) y como se encuentra en dos franajas horarias se tiene que tomar la de mayor costo ($14 por hora). Por lo tanto el importe generado es 14 x 6 = 84. (NOTA a efectos de simplificar los calculos, solo calcular el costo de la franja horaria con respecto a la hora desde y la hora hasta).

Se pide realizar un algoritmo que permita determinar:

    Posta con mayor importe generado
    Día con mayor cantidad de estacionamientos.
    En qué día y en que posta se generó la mayor cantidad de estacionamientos

Otras Preguntas:

    1- ¿Es posible calcular cual fue la zona horaria con mayor cantidad de estacionamientos? En caso de ser posible, realizar el algoritmo.
    2- ¿Es posible determinar la cantidad maxima de permanencia que tienen los autos estacionados? En caso de ser posible, realizar el algoritmo.

              Día 1      Día 2    Día 3 ... Día 7 Total Posta
Posta 1        ...       ...      ...      ...       ...
Posta 2        ...       ...      ...      ...       ...
...            ...       ...      ...      ...       ...
Posta 100      ...       ...      ...      ...       ...
Total día      ...       ...      ...      ...    Total totalitario  


Acción 332 ES;
Ambiente 

    fecha = registro
        dd: (1..7);
        mm: 'octubre'
        aa: '2018' 
    fin_registro
    
    estacionamiento = registro 
        fecha_e: fecha;
        patente: an(7);
        hdesde: n(2);
        hhasta: n(2);
        posta: (1..100); 
    fin_registro

    arch: archivo de estacionamiento;
    reg: estacionamiento;

    x: entero;
    y: entero;

    fulham_united = registro
        est: n(4);
        imp: n(4);
    fin_registro

    mach5: arreglo [1..8, 1..101] de fulham_united;

    procedimiento carga ES;
    proceso 
        para x:= 1 hasta 8 hacer 
            para y:= 1 hasta 101 hacer
                mach5[x,y]:= 0;
            fin_para
        fin_para 
    fin_procedimiento;

    calc: real;
    stoke_city: entero;
    stoke_city2: entero;
    valor_hora: entero;
    SwanseaCityAssociationFootballClub: real;
    comparador: real;
    guardador: entero;
    guardador2: entero;
    preguntador: entero;
    patentador: an(7);

Proceso
    carga;
    
    abrir e/(arch);
    leer(arch, reg);

    mientras NFDA(arch) hacer

        // para la pregunta 2 //
        si ((reg.hhasta - reg.hdesde) > preguntador) entonces
            preguntador:= reg.hhasta - reg.hdesde;
            patentador:= reg.patente;
        fin_si 
        
        esc('El auto patente n° ', reg.patente, ' estuvo ', reg.hhasta-reg.hdesde, ' horas estacionado.');
        // ------------------------------ //
        
        según reg.hdesde hacer
            <= 6:  stoke_city:= 9;
            <= 13: stoke_city:= 14;
            <= 19: stoke_city:= 12;
            <= 23: stoke_city:= 6;
        fin_según
        
        según reg.hhasta hacer
            <= 6:  stoke_city2:= 9;
            <= 13: stoke_city2:= 14;
            <= 19: stoke_city2:= 12;
            <= 23: stoke_city2:= 6;
        fin_según
        
    
        si stoke_city > stoke_city2 entonces
            valor_hora:= stoke_city;
        sino
            si stoke_city < stoke_city2 entonces
                valor_hora:= stoke_city2;
            fin_si
        fin_si

        SwanseaCityAssociationFootballClub:= ((reg.hhasta-reg.hdesde) + 1) * valor_hora;
                
        mach5[reg.posta, reg.fecha_e.dd].imp:= mach5[reg.posta, reg.fecha_e.dd].imp + SwanseaCityAssociationFootballClub;
        mach5[reg.posta, reg.fecha_e.dd].est:= mach5[reg.posta, reg.fecha_e.dd].est + 1;

        mach5[101, reg.fecha_e.dd].imp:= mach5[101, reg.fecha_e.dd].imp + SwanseaCityAssociationFootballClub;
        mach5[101, reg.fecha_e.dd].est:= mach5[101, reg.fecha_e.dd].est + 1;

        mach5[reg.posta, 8].imp:= mach5[reg.posta, 8].imp + SwanseaCityAssociationFootballClub;
        mach5[reg.posta, 8].est:= mach5[reg.posta, 8].est + 1;

        mach5[101, 8].imp:= mach5[101, 8].imp + SwanseaCityAssociationFootballClub;
        mach5[101, 8].est:= mach5[101, 8].est + 1;
        
        leer(arch, reg);    

    fin_mientras

    // Posta con mayor importe generado
   
    para x:= 1 hasta 101-1 hacer
        
        si (mach5[x, 8].imp > comparador) entonces
            guardador:= x;
            comparador:= mach[x, 8].imp; 
        fin_si
    fin_para
    esc('Posta con mayor importes generados >> ', guardador, ' con un importe total de ', mach5[guardador, 8].imp, '$');


    // Día con mayor cantidad de estacionamientos
    
    para y:= 1 hasta 8-1 hacer
      
       si (mach5[101,y].est > comparador) entonces
            guardador:= y;
            comparador:= mach[101,y].est;        
        fin_si
    fin_para
    esc('Día con mayor estacionamientos >> ', guardador, ' donde se generaron ', mach5[101 ,guardador].est, ' estacionamientos');    


    // En qué día y en qué posta se generó la mayor cantidad de estacionamientos

    para x:= 1 hasta 101-1 hacer
        
        para y:= 1 hasta 8-1 hacer
        
            si (mach5[x,y].est > comparador) entonces
                guardador:= x;
                guardador2:= y;
                comparador:= mach[x,y].est;        
            fin_si
        
        fin_para
    fin_para 

    esc('El día donde se registraron un mayor estacionamientos fue el ', guardador2, ' en la posta ', guardador, ' con un total de ', mach5[guardador, guardador2].est);

    // para la pregunta 2
    esc('La cantidad máxima de permanencia fue de ', preguntador, ' horas, correspondiente al auto patente n° ', patentador);

    cerrar(arch)
Fin_Acción.




