
program delete;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
    end;

var
    primq, q, rq, rr, r: puntero_a_nodo;

    udato, top, i: integer;

    op: char;

    procedure cargar;
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

    procedure emitir;
    begin
        rq:= primq;
        while (rq <> NIL) do
        begin
            write(rq^.dato, ' ');
            rq:= rq^.prox;
        end;
        writeln(#13#10);
    end;

    procedure eliminar;
    begin
        write('Ingrese el número que desee eliminar de la lista >> ');
        readln(udato);

        rr:= NIL;
        r:= primq;

        while (r <> NIL) and (r^.dato <> udato) do
        begin
            rr:= r;
            r:= r^.prox;
        end;

        if (r <> NIL) then
        begin
            if (rr = NIL) then
                primq:= primq^.prox
            else
                rr^.prox:= r^.prox;

            dispose(r);
        end
        else
            writeln('No se encontró el elemento.');

        writeln;
    end;

begin
    cargar();
    emitir();

    repeat
        eliminar();
        emitir();

        writeln('¿Desea borrar otro elemento? s/n');
        readln(op);
    until(op = 'n');
end.
