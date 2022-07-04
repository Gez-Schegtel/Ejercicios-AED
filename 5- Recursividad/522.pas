
{
    Imprimir los caracteres de un texto en orden inverso al provisto por el usuario.

    Caso base: primq^.prox = NIL ==> write(primq^.dato)

    Caso recursivo: primq^.prox <> NIL ==> mostrar_izq(primq^.prox)
}

program e522;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: char;
        prox: puntero_a_nodo;
    end;

var
    primq, q, rq: puntero_a_nodo;
    udato: char;

    procedure cargar();
    begin
        writeln('Para terminar el proceso, presione el caracter asterisco (*).');
        writeln('Por cada caracter, debe confirmar la operación presionando ENTER.');

        primq:= NIL;

        write('>> ');
        readln(udato);

        while (udato <> '*') do
        begin
            new(q);
            q^.dato:= udato;

            if (primq = NIL) then
                primq:= q
            else
                rq^.prox:= q;

            rq:= q;

            write('>> ');
            readln(udato);
        end;
    end;

    procedure mostrar_der();
    begin
        rq:= primq;
        while (rq <> NIL) do
        begin
            write(rq^.dato);
            rq:= rq^.prox;
        end;
        writeln;
    end;

    procedure mostrar_izq(primq: puntero_a_nodo);
    begin
        if (primq^.prox <> NIL) then
            mostrar_izq(primq^.prox);

        write(primq^.dato);
    end;

begin
    cargar();
    mostrar_der();
    mostrar_izq(primq);
    writeln;
end.
