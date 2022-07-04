
{
Ejercicio 3.23

En un sector de un hospital, donde se encuentran internados 50 pacientes, se toma la temperatura de cada paciente 4 veces al día durante una semana.
Lectura 	Dom 	Lun 	Mar 	Mie 	Jue 	Vie 	Sab
    1 	     XX 	XX 	    XX 	    XX 	     XX 	 XX 	 XX
    2        XX 	XX 	    XX 	    XX 	     XX 	 XX 	 XX
    3 	     XX 	XX 	    XX 	    XX 	     XX 	 XX 	 XX
    4 	     XX 	XX 	    XX 	    XX 	     XX 	 XX 	 XX

Se dispone de un arreglo con la información recopilada de todos los pacientes.

Construir un algoritmo que:

    Liste por pantalla las temperaturas máxima y mínima de cada paciente, indicando el día y lectura en la que ocurrieron.
    Genere un nuevo arreglo que contenga la temperatura promedio por día de cada paciente.


Acción 323 ES;
Ambiente         //  x      y     z
    matt1: arreglo [1..4, 1..7, 1..50] de entero;
    matt2: arreglo [1..1, 1..7, 1..50] de entero;
    
    x: entero;
    y: entero;
    z: entero;
    
    procedimiento carga ES;
    proceso
        para z:= 1 hasta 50 hacer
            para y:= 1 hasta 7 hacer
                para x:= 1 hasta 4 hacer
                    esc('Ingrese un valor de temperatura >> ');
                    leer(matt1[x,y,z]);
                fin_para
            fin_para
        fin_para 
    fin_procedimiento
    
    procedimiento carga2 ES;
    proceso 
        x:= 1;
        para z:= 1 hasta 50 hacer
            para y:= 1 hasta 7 hacer
                    matt2[x,y,z]:= 0;
            fin_para
        fin_para 
    fin_procedimiento
    
    M: entero;
    m: entero;
    pMx: entero;
    pmx: entero;
    pMy: entero;
    pmy: entero;        
    
Proceso 
    carga;
    carga2;

    para z:= 1 hasta 50 hacer
        M:= 0;
        m:= 0;
       
        para y:= 1 hasta 7 hacer
       
            para x:= 1 hasta 4 hacer
                si (matt1[x,y,z] <= m) entonces
                    m:= matt1[x,y,z];
                    pmx:= x
                    pmy:= y
                sino
                    M:= matt1[x,y,z];
                    pMx:= x
                    pMy:= y
                fin_si
                
                matt2[1,y,z]:= matt2[1,y,z] + matt1[x,y,z];
            fin_para
       
        fin_para

        esc('La mayor temperatura registrada para la persona', z, 'fue de ', M, ' en la posición ', pMx, pMy);
        esc('La menor temperatura registrada para la persona', z, 'fue de ', m, ' en la posición ', pmx, pmy);
        
    fin_para 

Fin_Acción.
}



program matt_damon;
type           //  x      y     z
    matt1 = array [1..4, 1..7, 1..50] of integer;
    matt2 = array [1..1, 1..7, 1..50] of integer;
var
    mach5: matt1;
    mach6: matt2;

    x: integer;
    y: integer;
    z: integer;
    
    procedure carga1;
    begin
        for z:= 1 to 50 do
        begin
            for y:= 1 to 7 do
            begin
                for x:= 1 to 4 do
                begin
                    writeln('Ingrese un valor de temperatura >> ');
                    mach5[x,y,z]:= random(35)+7;
                end;
            end;
        end; 
    end;
    
    procedure carga2;
    begin
        x:= 1;
        for z:= 1 to 50 do
        begin
            for y:= 1 to 7 do
            begin
                mach6[x,y,z]:= 0;
            end;
        end;
    end;
    
    M: integer;
    m: integer;
    pMx: integer;
    pmx: integer;
    pMy: integer;
    pmy: integer;    
    
Begin
    carga1;
    carga2;
    
    for z:= 1 to 50 do
    begin
        M:= 0;
        m:= 0;
        for y:= 1 to 7 do
        begin
            for x:= 1 to 4 do
            begin
                if (mach5[x,y,z] <= m) then
                begin
                    m:= mach5[x,y,z];
                    pmx:= x
                    pmy:= y
                end
                else
                    begin
                        M:= mach6[x,y,z];
                        pMx:= x
                        pMy:= y
                    end;
                
                mach6[1,y,z]:= mach6[1,y,z] + mach5[x,y,z];
            end;
        end;

        writeln('La mayor temperatura registrada para la persona', z, 'fue de ', M, ' en la posición ', pMx, pMy);
        writeln('La menor temperatura registrada para la persona', z, 'fue de ', m, ' en la posición ', pmx, pmy);
        
    end;
End.
