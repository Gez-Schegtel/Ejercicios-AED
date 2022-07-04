

{
    Dados dos números: a y b. Calcule la potencia ab, usando sólo multiplicaciones sucesivas.

    Caso base: b = 1 ; pwr:= a

    Caso recursivo: b > 1 ; pwr(a, b-1)

}

program something;
uses crt;
var
    a, b: longint;

    function pwr(a, b: longint): longint;
    begin
        if (b = 1) then
        begin
            pwr:= a;
        end
        else
            begin
                pwr:= a * pwr(a, b-1);
            end;
    end;

begin
    clrscr;
    writeln('Este programa calcula la potencia a^b.', #13#10);
    write('Ingrese a >> ');
    readln(a);
    write('Ingrese b >> ');
    readln(b);
    writeln(#13#10, 'La potencia a^b es igual a ', pwr(a, b), #13#10);
end.
