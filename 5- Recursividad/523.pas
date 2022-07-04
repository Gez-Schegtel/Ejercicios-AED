
{
    Dada una lista de nombres ordenada de forma ascendente, emitir los mismos pero de manera inversa.

    Caso base: primq^.prox = NIL ==> write(primq^.dato)

    Caso recursivo: primq^.prox <> NIL ==> pr(primq^.prox)
}

program e523;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: string;
        prox: puntero_a_nodo;
    end;

var
    primq, q, r, rr: puntero_a_nodo;

    op: char;

    procedure carga_emision();
    begin
        // Carga ordenada con lista simplemente enlazada. //

        primq:= NIL;

        repeat
            new(q);
            writeln('Ingrese un nombre: ');
            readln(q^.dato);

            rr:= NIL;
            r:= primq;

            while (r <> NIL) and (r^.dato < q^.dato) do
            begin
                rr:= r;
                r:= r^.prox;
            end;

            if (rr = NIL) then
            begin
                q^.prox:= primq;
                primq:= q;
            end
            else
                begin
                    rr^.prox:= q;
                    q^.prox:= r;
                end;

            writeln('¿Desea ingresar otro nombre? s/n');
            readln(op);
        until(op = 'n');


        r:= primq;
        while (r <> NIL) do
        begin
            write(r^.dato, ' ');
            r:= r^.prox;
        end;
        writeln(#13#10);
    end;

    procedure pr(primq: puntero_a_nodo);
    begin
        if (primq^.prox <> NIL) then
            pr(primq^.prox);

        write(primq^.dato, ' ');
    end;

begin
    carga_emision();
    pr(primq);
    writeln;
end.
