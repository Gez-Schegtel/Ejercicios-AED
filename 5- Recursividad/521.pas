
{
    Imprimir las cifras de un número en orden inverso al provisto por el usuario.

    Caso base: n div 10 = 0 ==> writeln(n)

    Caso recursivo: n div 10 > 0 ==> write(n mod 10); pr(n div 10)
}
program e521;
var
    n: longint;

    procedure pr(n: longint);
    begin
        if (n div 10 = 0) then
            writeln(n)
        else
            begin
                write(n mod 10);
                pr(n div 10);
            end;
    end;
    
begin
    write('Ingrese un número: ');
    readln(n);
    pr(n);
end.
