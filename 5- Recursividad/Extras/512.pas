
{

    Dado un número n como parámetro de entrada, calcular el n-ésimo número de la serie de Fibonacci. Tener en cuenta la siguiente definición:

    Caso base: n = 1 o n = 2 ; fb:= 1

    Caso recursivo: n > 2 ; fb:= fb(n-1) + fb(n-2)

}

program something;
var
    n: longint;
    function fb(n: longint): longint;
    begin
        if ((n = 1) or (n = 2)) then
        begin
            fb:= 1;
        end
        else
            begin
                fb:= fb(n-1) + fb(n-2);
            end;
    end;

begin
    writeln('Ingrese el orden de término que desee conocer su valor en la sucesión de Fibonacci.');
    readln(n);
    writeln('El término ', n, ' de la sucesión de Fibonacci es >> ', fb(n));
end.
