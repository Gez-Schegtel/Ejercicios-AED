

{

Determine recursivamente si un número dado es par o impar, usando sólo la operación resta.

Caso base: n = 0 ; rp:= 1

Caso recursivo: n > 0 ; rp:= rp(n-2)

}

program something;
var
    n: integer;

    function rp(n: integer): integer;
    begin
        if (n = 0) then
        begin
            rp:= 1;
        end
        else
            if (n > 0) then
            begin
                rp:= rp(n-2);
            end
            else
                begin
                    rp:= 0;
                end;
    end;

begin
    writeln('Ingrese un número para determinar si es par o impar.');
    readln(n);

    if (rp(n) = 1) then
    begin
        writeln('El número es par.');
    end
    else
        begin
            writeln('El número es impar.');
        end;
end.
