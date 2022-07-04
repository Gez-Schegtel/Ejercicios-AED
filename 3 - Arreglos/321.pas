{
Ejercicio 3.21

Dada una matriz de 6 x 6 de enteros, cuya última fila y columna contienen ceros, calcular la suma de cada fila y guardar en la última celda de la misma; y la suma de cada columna y guardar en la última celda de la misma. Calcular también el total general y guardar en la posición (6,6).


Acción 321 ES;
Ambiente
    mach5: arreglo [1..6, 1..6] de entero

    x: entero;
    y: entero;
           
    procedimiento (carga) ES;
    proceso 
        para x:= 1 hasta 6 hacer 
            para y:= 1 hasta 6 hacer 
                esc('Ingresar un entero para la posición ', x, y, ' >> ');
                leer(mach5[x, y]);
            fin_para 
        fin_para
    fin_procedimiento
    
    procedimiento poner_a_cero_fila_6 ES;
    proceso
        para y:= 1 hasta 6 hacer
            mach5[6,y]:= 0;
        fin_para
        
    fin_procedimiento

    procedimiento poner_a_cero_columna_6 ES;
    proceso
        para x:= 1 hasta 6 hacer
            mach5[x,6]:= 0;
        fin_para
    fin_procedimiento
    
    procedimiento totales ES;
        para x:= 1 hasta 6-1 hacer
            para y:= 1 hasta 6-1 hacer
                    mach5[6,y]:= mach5[6,y] + mach[x,y];
                    mach5[x,6]:= mach5[x,6] + mach[x,y];
                    mach5[6,6]:= mach5[6,6] + mach[x,y];
            fin_para
        fin_para
    fin_procedimiento

Proceso
    carga;
    poner_a_cero_fila_6;
    poner_a_cero_columna_6;
    totales;

Fin_Acción.
}

program matriz;
uses crt;
type
    matt = array [1..6, 1..6] of integer;
var 
    mach5: matt;
    x: integer;
    y: integer;

    procedure carga;
    begin 
        for x:= 1 to 6 do
        begin  
            for y:= 1 to 6 do 
            begin
                writeln('Ingresar un entero para la posición ', x, y, ' >> ');
                mach5[x,y]:= random(5);
            end;     
        end;
    end;
    
    procedure poner_a_cero_fila_6;
    begin
        for y:= 1 to 6 do
        begin
            mach5[6,y]:= 0;
        end;
    end;    

    procedure poner_a_cero_columna_6;
    begin
        for x:= 1 to 6 do
        begin 
            mach5[x,6]:= 0;
        end;
    end;
    
    procedure ver_como_quedo_XD;
    begin
        for x:= 1 to 6 do
        begin
            for y:= 1 to 6 do
            begin
                textcolor(magenta);
                write(mach5[x,y], ' ');
            end;
            writeln;
        end;        
    end;

    procedure totales;
    begin
        for x:= 1 to 6-1 do // x = 3
        begin
            for y:= 1 to 6-1 do 
            begin
                mach5[x,6]:= mach5[x,6] + mach5[x,y];
                mach5[6,y]:= mach5[6,y] + mach5[x,y];
                mach5[6,6]:= mach5[6,6] + mach5[x,y];
            end;
        end; 
    end;  
    
    {
    0 0 0 0 0 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    }

Begin 
    carga;
    poner_a_cero_fila_6;
    poner_a_cero_columna_6;
    ver_como_quedo_XD;
    totales;
    writeln;
    ver_como_quedo_XD;
End.
