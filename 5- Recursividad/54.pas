
{
    Determinar si los dígitos de un "n" dado, son pares.

    Caso base: n = 0 ==> writeln('Todos los... bla bla')

    Caso recursivo: ((n mod 10) mod 2 = 0) ==> pr(n div 10)

    Si ((n mod 10) mod 2 <> 0), se cancela la ejecución.
}

program e54; // No encuentro el sentido de hacer esto como una función. //
var
    n: integer;

    procedure pr(n: integer);
    begin
        if (n = 0) then
            writeln('Todos los dígitos del número ingresado son pares.')
        else
            begin
                if ((n mod 10) mod 2 = 0) then
                    pr(n div 10)
                else
                    writeln('No todos los dígitos del número ingresado son pares.');
            end;
    end;

begin
    write('Ingrese un número: ');
    readln(n);
    pr(n);
end.
