

Ejercicio 2.2.1

Se dispone de una secuencia con los datos de los alumnos de la facultad:

    Apellido y Nombre
    Carrera (ISI - IEM - IQ)
    Nº de Legajo
    Fecha de Nacimiento
    Fecha de Ingreso
    D.N.I.
    Sexo (M o F)
    Fecha de último examen aprobado
    Nota

Se desea un listado de los mismos, con el siguiente formato:

    Nro_Legajo Apellido_Nombre Documento Carrera 



Ejercicio 2.2.20

Se desea generar una secuencia, a partir de la secuencia del problema 2.01, donde se actualice la fecha de aprobación del último exámen, para ello se cuenta con información del último turno de exámen, según el siguiente detalle:

EXAMENES Ordenado por Nro_Legajo

    Nro_Legajo Carrera Cod_Materia Fecha_Examen Nota 

Se debe considerar que no necesariamente todos los alumnos se presentan en cada turno de exámen, y que un alumno puede presentarse a rendir más de una materia en un mismo turno. Supónganse ambas secuencias ordenadas por Número de Legajo.


Acción 220 ES;
Ambiente    
    fecha = registro
        dd:(1..31)
        mm:(1..12)
        aaaa:N(4)
    fin_registro
    
    alumno = registro 
        leg: n(5);
        ayn: an(40);
        car: ('ISI', 'IQ', 'IEM');
        fnac: fecha;
        fing: fecha;
        dni: n(8);
        sex: ('M', 'F');
        fult: fechaM
        nota: n(2);       
    fin_registro 

    master: archivo de alumno ordenado por leg;
    rmaster: alumno;
    
    sally: archivo de alumno ordenado por leg;
    rsally;
    
    examen = registro
        leg: n(5);
        car('ISI', 'IQ', 'IEM');
        cmatt: n(4);
        fexam: fecha;
        nota: n(2);
    fin_registro 
    
    mavis: archivo de examen ordenado por leg;
    rmavis: examen
    
    procedimiento avanza_master ES;
    proceso
        leer(master, rmaster);
        si FDA(master) entonces 
            rmaster.leg:= HV;
        fin_si
    fin_procedimiento 

    procedimiento avanza_mavis ES;
    proceso 
        leer(mavis,rmavis)
        si fda(mavis) entonces
            rmavis.leg:= HV;
        fin_si
    fin_procedimiento

    procedimiento rmastermayor ES;
    proceso
        esc('Error, la persona no se encuentra en el archivo de alumnos de la facultad.');
    fin_procedimiento

    procedimiento rmastermenor ES;
    proceso 
        esc('Este alumno no se presentó a rendir en el último turno de examen.');
        rsally:= rmaster;
        esc(sally, rsally);
    fin_procedimiento;

    procedimiento rmasterigual ES;
    proceso
        rsally:= rmaster;

        mientras (rmaster.leg = rmavis.leg) hacer
           
            si (rmaster.fult < rmavis.fexam) y (rmavis.nota >= 6) entonces
    
                rsally.fult:= rmavis.fexam;
                rsally.nota:= rmavis.nota; 
    
            fin_si

            avanza_mavis;
        fin_mientras

        esc(sally, rsally);
    fin_procedimiento

Proceso 
    abrir e/(master);
    abrir e/(mavis);
    abrir /s(sally);
    
    avanza_master;
    avanza_master;
    
    mientras (rmaster.leg <> HV) o (rmavis.leg <> HV) hacer 
       
        si (rmaster.leg > rmavis.leg) entonces 
            rmastermayor;
            avanza_mavis;
        sino
            si (rmaster.leg < rmavis.leg) entonces 
                rmastermenor;
                avanza_master;
            sino
                // Son iguales // 
                rmasterigual;
                avanza_master;
                avanza_mavis;
            fin_si
        fin_si
   
    fin_mientras
    
    cerrar(master);
    cerrar(mavis);
    cerrar(sally);
Fin_Acción.
