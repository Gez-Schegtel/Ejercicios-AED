


Acción bla ES
Ambiente

    ejemplares = registro
        id_ejemplar: n(8)
        id_libro: n(30)
        sucursal: 1..5
        digital: (1, 2) // 's', 'n' 
        disponible: booleano
    fin_registro

    arch_ejemplares: archivo de ejemplares ordenado por id_ejemplar y id_libro
    reg_ejemplares: ejemplares

    matriz: arreglo [1..3, 1..6, 1..2] de entero
    x: entero
    y: entero
    z: entero

    comparador: entero;

Proceso
    abrir e/(arch_ejemplares)
    leer(arch_ejemplares)

    para x:= 1 hasta 2 hacer
        para y:= 1 hasta 6 hacer
            para z:= 1 hasta 3 hacer
                matriz[x,y,z]:= 0
            fin_para
        fin_para
    fin_para

    mientras NDFA(arch_ejemplares) hacer

        si (reg_ejemplares.disponible = verdadero) entonces
            matriz[reg_ejemplares.digital, reg_ejemplares.sucursal, 1]:= matriz[reg_ejemplares.digital, reg_ejemplares.sucursal, 1] + 1;
            matriz[3, reg_ejemplares.sucursal, 1]:= matriz[3, reg_ejemplares.sucursal, 1] + 1;
            matriz[reg_ejemplares.digital, 6, 1]:= matriz[reg_ejemplares.digital, 6, 1] + 1;
            matriz[3, 6, 1]:= matriz[3, 6, 1] + 1;

        sino
            matriz[reg_ejemplares.digital, reg_ejemplares.sucursal, 2]:= matriz[reg_ejemplares.digital, reg_ejemplares.sucursal, 2] + 1;
            matriz[3, reg_ejemplares.sucursal, 2]:= matriz[3, reg_ejemplares.sucursal, 2] + 1;
            matriz[reg_ejemplares.digital, 6, 2]:= matriz[reg_ejemplares.digital, 6, 2] + 1;
            matriz[3, 6, 2]:= matriz[3, 6, 2] + 1;
        fin_si

        leer(arch_ejemplares, reg_ejemplares)

    fin_mientras

    esc('Libros disponibles: ')
    para x:= 1 hasta 2 hacer
        para y:= 1 hasta 6-1 hacer
            esc('Tipo de libro >> digital = 1, >> físico = 2')
            esc('Sucursal', y)
            esc('Tipo de libro ', z)
            esc(matriz[x,y,1])
        fin_para
    fin_para

    esc('Libros no disponibles: ')
    para x:= 1 hasta 2 hacer
        para y:= 1 hasta 6-1 hacer
            esc('Tipo de libro >> digital = 1, >> físico = 2')
            esc('Sucursal ', y)
            esc('Tipo de libro ', z)
            esc(matriz[x,y,2])
        fin_para
    fin_para

    comparador:= lv;
    para y:= 1 hasta 6-1 hacer
        si (matriz[3,y,1] > comparador) entonces
            comparador:= matriz[3,y,1]
            posición:= y;
        fin_si
    fin_para

    esc('La sucursal que tiene más libros disponibles es ', posición)

    //Informar el total de libros digitales y físicos

    esc('Libros digitales disponibles', matriz[1,6,1])
    esc('Libros físicos disponibles', matriz[2,6,1])
    esc('Libros digitales no disponibles', matriz[1, 6, 2])
    esc('Libros físicos no disponibles', matriz[2, 6, 2])

    ('En la sucursal 2 hay ', matriz[3, 2, 1]+matriz[3, 2, 2], ' libros.')

    cerrar(arch_ejemplares)
Fin_Acción.
