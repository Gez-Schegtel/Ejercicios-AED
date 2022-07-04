
// Este programa inserta, en una lista previamente cargada, un elemento de forma ordenada. //
program insert;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
    end;

var
    primq, q, rq, rr, r: puntero_a_nodo;

    udato, top, i: integer;

    procedure carga;
    begin
        randomize;

        write('Ingrese el número de elementos con el que desee cargar la lista >> ');
        readln(top);

        primq:= NIL;

        for i:= 1 to top do
        begin
            new(q);
            q^.dato:= random(100);

            rr:= NIL;
            r:= primq;

            while (r <> NIL) and (r^.dato <= q^.dato) do
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
        end;

        writeln;
    end;

    procedure emision;
    begin
        rq:= primq;
        while (rq <> NIL) do
        begin
            write(rq^.dato, ' ');
            rq:= rq^.prox;
        end;
        writeln(#13#10);
    end;

    procedure insercion;
    begin
        write('Ingrese el número que desee agregar a la lista >> ');
        readln(udato);

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
            q^.prox:= primq;
            primq:= q;
        end
        else
            begin
                rr^.prox:= q;
                q^.prox:= r;
            end;

        writeln;
    end;

begin
    carga();
    emision();
    insercion();
    emision();
end.
