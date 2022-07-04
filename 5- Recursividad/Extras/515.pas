

{
Dados dos números enteros, divídalos (división entera) y muestre el resultado, usando sólo la operación resta.

Caso base: a = 0 ; intdiv:= 0;

Caso recursivo: a <> 0 ; intdiv:= 1 + intdiv(a-b, b)
}

program something;
var
    a, b: integer;

    function intdiv(a, b: integer): integer;
    begin
        if (a = 0) then
        begin
            intdiv:= 0;
        end
        else
            begin
                intdiv:= 1 + intdiv(a-b, b);
            end;
    end;

begin

    writeln('Ingrese dos números.');
    write('Número a >> ');
    readln(a);
    write('Número b >> ');
    readln(b);

    writeln(#13#10, 'El resultado de la divisón entera entre a y b es >> ', intdiv(a, b));

end.
