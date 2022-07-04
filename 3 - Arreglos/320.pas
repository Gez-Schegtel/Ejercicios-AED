
{
Ejercicio 3.20

Dadas dos matrices A y B, cuadradas, de 5 x 5, con números enteros, cargar una matriz C, de 5 x 5 teniendo en cuenta las siguientes condiciones: la diagonal principal completar con ceros, en las posiciones que están por encima de la diagonal principal copiar los correspondientes elementos de la matriz A y en las posiciones que están por debajo de la diagonal principal, copiar los elementos correspondientes de la matriz B.


Acción 320 ES;
Ambiente 
    mach5: arreglo [1..5, 1..5] de entero;
    mach6: arreglo [1..5, 1..5] de entero;
    mach7: arreglo [1..5, 1..5] de entero;

    procedimiento carga ES;
    proceso
        para x:= 1 hasta 5 hacer
            para y:=  1 hasta 5 hacer
                esc('Cargue el elemento en la posición' x, y, ' para la matriz mach5.');
                leer(mach5[x,y])
                esc('Cargue el elemento en la posición' x, y, ' para la matriz mach6.');
                leer(mach6[x,y])

                mach7[x,y]:= 0;
        fin_para
    fin_procedimiento

Proceso 
    carga;

    para x:= 1 hasta 5 hacer 
        para y:= 1 hasta 5 hacer
            si (x = y) entonces
                mach7[x, y]:=0
            sino
                si (x > y) entonces
                    mach7[x, y]:=mach6[x, y]
                sino
                    mach7[x, y]:=mach5[x, y]
            fin_si
            
        fin_para 
    fin_para
  
    0     1 1 1 1
    2     0 1 1 1
    2     2 0 1 1 
    2     2 2 0 1
    2 2 2 2 0


Fin_Acción.
}

program speed_racer;
uses crt, sysutils, math;
type
    matt5 = array [1..5, 1..5] of integer;
    matt6 = array [1..5, 1..5] of integer;
    matt7 = array [1..5, 1..5] of integer;
var
    mach5: matt5;
    mach6: matt6;
    mach7: matt7; 

    x: integer;
    y: integer;

    procedure carga;
    begin
        for x:= 1 to 5 do
        begin
            for y:=  1 to 5 do 
            begin
                writeln('Cargue el elemento en la posición ', x, y, ' para la matriz mach5.');
                mach5[x,y]:= random(4);
                writeln('Cargue el elemento en la posición ', x, y, ' para la matriz mach6.');
                mach6[x,y]:= random(9);

                mach7[x,y]:= 0;
            end;
        end;
    end;

Begin
    carga;

    for x:= 1 to 5 do
    begin 
        for y:= 1 to 5 do
        begin
            if (x = y) then
            begin 
                mach7[x, y]:=0
            end
            else
                begin 
                    if (x > y) then
                    begin 
                        mach7[x,y]:=mach6[x,y]
                    end 
                    else
                        mach7[x,y]:=mach5[x,y]
                end;
        end; 
    end;

    for x:= 1 to 5 do
    begin
        for y:=  1 to 5 do 
        begin
            textcolor(yellow);
            write(mach5[x,y], ' ');
        end;
        writeln;
    end;

    for x:= 1 to 5 do
    begin
        for y:=  1 to 5 do 
        begin
            textcolor(red);
            write(mach6[x,y], ' ');
        end;
        writeln;
    end;

    for x:= 1 to 5 do
    begin
        for y:=  1 to 5 do 
        begin
            textcolor(cyan);
            write(mach7[x,y], ' ');
        end;
        writeln;
    end;
End.



