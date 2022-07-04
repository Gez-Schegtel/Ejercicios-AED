

program processes;
type
    puntero_a_nodo = ^nodo;

    nodo = record
        dato: integer;
        prox: puntero_a_nodo;
    end;

var
    primq, q, r, rr, u: puntero_a_nodo;

    top, i, udato: integer;

    op: char;

    procedure cargar;
    begin
        randomize;

        write('Ingrese el número de nodos para realizar la carga no ordenada en la lista circular >> ');
        readln(top);

        primq:= NIL;

        for i:= 1 to top do
        begin
            new(q);
            q^.dato:= random(100);

            if (primq = NIL) then
            begin
                primq:= q;
                q^.prox:= primq;
            end
            else
                begin
                    q^.prox:= primq^.prox;
                    primq^.prox:= q;
                end;
        end;
    end;

    procedure emitir;
    begin
        r:= primq;

        while (r^.prox <> primq) do
        begin
            write(r^.dato, ' ');
            r:= r^.prox;
        end;

        writeln;
    end;

    procedure cargar_orden;
    begin
        randomize;

        write('Ingrese el número de nodos para realizar la carga ordenada en la lista circular >> ');
        readln(top);

        primq:= NIL;

        for i:= 1 to top do
        begin
            new(q);
            q^.dato:= random(100);

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
        end;

        r:= primq;

        while (r^.prox <> NIL) do
            r:= r^.prox;

        r^.prox:= primq;
    end;

    procedure insertar_orden;
    begin
        if (primq <> NIL) then
        begin
            r:= primq;
            while (r^.prox <> primq) do
                r:= r^.prox;

            r^.prox:= NIL;
        end;

        write('Ingrese el número que desee agregar a la lista >> ');

        new(q);
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

        r:= primq;

        while (r^.prox <> NIL) do
            r:= r^.prox;

        r^.prox:= primq;
    end;

    procedure borrar;
    begin
        writeln('Ingrese el número que desee eliminar de la lista.');
        readln(udato);

        r:= primq;
        while (r^.prox <> primq) and (r^.dato <> udato) do
        begin
            rr:= r;
            r:= r^.prox;
        end;

        if (r^.dato = udato) then
        begin
            // Único elemento. //
            if (r^.prox = r) then
            begin
                primq:= NIL;
            end
            else
                // Primer elemento. //
                if (r = primq) then
                begin
                    // Es necesario actualizar el último elemento. //
                    u:= primq;
                    while (u^.prox <> primq) do
                        u:= u^.prox;

                    primq:= primq^.prox;
                    u^.prox:= primq;
                end
                else
                    begin
                        // Elemento del medio o último. //
                        rr^.prox:= r^.prox;
                    end;

            dispose(r);
        end
        else
            writeln('No se encontró el elemento.');
    end;

    procedure buscar;
    begin
        write('Ingrese el elemento que desee buscar en la lista: ');
        readln(udato);

        r:= primq;

        while (r^.prox <> primq) and (r^.dato <> udato) do
            r:= r^.prox;

        if (r^.dato = udato) then
            writeln('Se encontró el elemento ', r^.dato)
        else
            writeln('No se encontró el elemento ');
    end;

begin
    //cargar();
    //emitir();
    cargar_orden();
    emitir();

    repeat
        insertar_orden();
        emitir();

        writeln('¿Desea agregar otro número a la lista? s/n');
        readln(op);
    until(op = 'n');

    repeat
        borrar();
        emitir();

        writeln('¿Desea agregar eliminar número de la lista? s/n');
        readln(op);
    until(op = 'n');

    buscar();
end.
