
{

Para convertir un número decimal a binario, simplemente debe dividirse sucesivas veces por dos (2) hasta quedarnos con el cociente cero (0). Todos los restos de las divisiones, tomados en orden inverso, forman el número binario objetivo. Escribir un procedimiento recursivo que, recibiendo como parámetro un número entero positivo, muestre en pantalla el mismo número codificado en binario.

caso base: n DIV  2 = 0; write(n mod 2)
caso binario: n DIV 2 <> 0; binary(n DIV 2);

}

program something;
var
    n: integer;

    procedure binary(n: integer);
    begin
        if ((n DIV 2) <> 0) then
        begin
            binary(n DIV 2);
        end;
        write(n MOD 2);
    end;

begin
    write('Ingrese un número para hallar su equivalente en binario: ');
    readln(n);
    write('El resultado es >> ');
    binary(n);
    writeln;
end.
