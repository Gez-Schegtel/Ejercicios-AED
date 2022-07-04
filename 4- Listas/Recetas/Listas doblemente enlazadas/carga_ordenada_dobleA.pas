
// Este programa consiste en una carga ordenada ascendente en una lista doblemente enlazada. //
program carga_ordenada_doble;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
        ant: puntero_a_nodo;
    end;

var
    primq, ultq, q, r, rr: puntero_a_nodo;

    udato: integer;

    procedure carga;
    begin
        writeln('Para finalizar el proceso ingrese el número -1');

        write('>> ');
        readln(udato);

        primq:= NIL;

        while (udato <> -1) do
        begin
            new(q);
            q^.dato:= udato;

            rr:= NIL;
            r:= primq;

            while (r <> NIL) and (r^.dato <= udato) do
            begin
                rr:= r;
                r:= r^.prox;
            end;

            if (rr = NIL) then
            begin
                // Primer elemento. //
                q^.ant:= NIL;
                q^.prox:= primq;

                // Condicional necesario para evitar bugs. Probar secuencia 7 9 3 2 1 //
                if (primq <> NIL) then
                    primq^.ant:= q;

                primq:= q;

            end
            else
                if (r = NIL) then
                begin
                    // Último elemento. //
                    q^.ant:= rr;
                    rr^.prox:= q;
                    q^.prox:= NIL;
                end
                else
                    begin
                        // Elemento del medio. //
                        rr^.prox:= q;
                        q^.ant:= rr;
                        q^.prox:= r;
                        r^.ant:= q;
                    end;

            // Condicional NECESARIO por si se ingresan valores ordenados de manera descendente. //
            if (q^.prox = NIL) then
                ultq:= q;

            write('>> ');
            readln(udato);
        end;
    end;

    procedure emision;
    begin
        writeln('Lista desde primq: ');

        r:= primq;
        while (r <> NIL) do
        begin
            write(r^.dato, ' ');
            r:= r^.prox;
        end;

        writeln(#13#10, 'Lista desde ultq: ');

        r:= ultq;
        while (r <> NIL) do
        begin
            write(r^.dato, ' ');
            r:= r^.ant;
        end;

        writeln;
    end;

begin
    carga();
    emision();
end.
