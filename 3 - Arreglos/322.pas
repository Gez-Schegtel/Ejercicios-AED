
{
Acción 322 ES;
Ambiente 
    mach5 = arreglo [1..5, 1..5] de entero;
    mach6 = arreglo [1..2, 1..5] de entero;
    
    x: entero;
    y: entero;
    suma_columna: entero;
    suma_fila: entero;

    procedimiento carga_one ES;
    proceso 
        para x:= 1 hasta 5 hacer 
            para y:= 1 hasta 5 hacer 
                esc('Ingrese un valor para el elemento de la posición ', x, y);
                leer(mach5[x,y]);
            fin_para
        fin_para 
    fin_procedimiento

    procedimiento carga_two ES;
    proceso 
        para x:= 1 hasta 2 hacer   
            para y:= 1 hasta 5 hacer 
                mach6[x,y]:= 0;
            fin_para;
        fin_para;
    fin_procedimiento

Proceso
    carga_one;
    carga_two;

    para x:= 1 hasta 5 hacer 
        
        suma_fila:= 0;
        para y:= 1 hasta 5 hacer
            suma_fila:= suma_fila + mach5[x,y];
        fin_para
      
        mach6[1,x]:= suma_fila;
    fin_para

    para y:= 1 hasta 5 hacer 
        
        suma_columna:= 0;
        para x:= 1 hasta 5 hacer
            suma_columna:= suma_columna + mach5[x,y];
        fin_para
       
        mach6[2,y]:= suma_columna;
    fin_para
 
Fin_Acción.

}

program matriz;
uses crt;
type
    matt1 = array [1..5, 1..5] of integer;
    matt2 = array [1..2, 1..5] of integer;
var
    mach5: matt1;
    mach6: matt2;
    
    x: integer;
    y: integer;
    suma_columna: integer;
    suma_fila: integer;

    procedure carga_one_and_see_how_it_looks;
    begin
        for x:= 1 to 5 do 
        begin 
            for y:= 1 to 5 do 
            begin 
                mach5[x,y]:= random(9);
            end;
        end;

        for x:= 1 to 5 do 
        begin 
            for y:= 1 to 5 do 
            begin 
                textcolor(magenta);
                write(mach5[x,y], ' ');
            end;
            writeln;
        end; 
    end;

    procedure carga_two;
    begin
        for x:= 1 to 2 do 
        begin 
            for y:= 1 to 5 do 
            begin 
                mach6[x,y]:= 0;
            end;
        end;
    end;

    procedure see_how_two_looks;
    begin
        for x:= 1 to 2 do 
        begin 
            for y:= 1 to 5 do 
            begin 
                textcolor(magenta);
                write(mach6[x,y], ' ');
            end;
            writeln;
        end; 
    end;

Begin   
    carga_one_and_see_how_it_looks;
    writeln;
    carga_two;

    for x:= 1 to 5 do
    begin
        suma_fila:= 0;
        for y:= 1 to 5 do
        begin
            suma_fila:= suma_fila + mach5[x,y];
        end;
        mach6[1,x]:= suma_fila;
    end;

    for y:= 1 to 5 do
    begin
        suma_columna:= 0;
        for x:= 1 to 5 do
        begin
            suma_columna:= suma_columna + mach5[x,y];
        end;
        mach6[2,y]:= suma_columna;
    end;

    see_how_two_looks; 
End.