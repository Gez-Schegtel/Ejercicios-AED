Ejercicio 3.18

Se precisa diseñar una agenda electrónica, donde se archivará el nombre, la dirección y el teléfono de hasta 50 personas. Diseñe un algoritmo que permita efectuar consultas, modificaciones, eliminaciones de los datos de una persona y agregados de nuevas personas (sólo será posible incorporar una persona si hay menos de 50 archivadas en la agenda). Los datos se hallan almacenados en una secuencia. Considere que la agenda siempre debe mantenerse ordenada alfabéticamente.

Acción 318 ES;
Ambiente
    
    contacto = registro 
        nombre: an(40);
        dirección: an(40);
        teléfono: n(12);
    fin_registro

    arr1: arreglo [1..50] de contacto;

    procedimiento (carga) ES;
    proceso 
        para i:= 1 hasta 50 hacer
            esc('Nombre >> ');
            leer(arr1[i].nombre);

            esc('Dirección >> ');
            leer(arr1[i].dirección);

            esc('Teléfono >> ');
            leer(arr1[i].teléfono);
        fin_para
    fin_procedimiento

    op1: caracter;
    op2: caracter;
    i: entero;
    pos: entero;
    u_nombre: an(40);
    u_direc: an(40);
    u_tel: n(12);
    aux: contacto;
    xv: contacto;

Proceso
    //Hacemos de cuenta que el arreglo ya lo cargaron ordenado para no hacer un ordenamiento ahora
    carga;

    esc('¿Desea comenzar? s/n');
    leer(op1);
    
    mientras (op1 = 's') hacer

        esc('Para consultar ingrese >> C');
        esc('Para modificar ingrese >> M');
        esc('Para eliminar ingrese >> E');
        esc('Para agregar un nuevo contacto >> A');
        leer(op2);
        
        según (op2) hacer
            'C':    esc('Ingrese el nombre de la persona que quiera consultar');
                    leer(u_nombre);

                    pos:= 1;
                    mientras (pos < 50) y (arr1[pos].nombre <> u_nombre) hacer 
                        pos:= pos + 1;
                    fin_mientras

                    si (arr1[pos].nombre = u_nombre) entonces 
                        esc('Nombre >> ', u_nombre);
                        esc('Dirección >> ', arr1[pos].dirección);
                        esc('Teléfono >> ', arr1[pos].teléfono);
                    sino
                        esc('No se encontró el nombre solicitado.');
                    fin_si 
            

            'M':    esc('Ingrese el nombre de la persona que quiera modificar');
                    leer(u_nombre);   
                    
                    pos:= 1;                 
                    mientras (pos < 50) y (arr1[pos].nombre <> u_nombre) hacer 
                        pos:= pos + 1;
                    fin_mientras

                    si (arr1[pos].nombre = u_nombre) entonces 
                        esc('Ingrese la nueva dirección.');                   
                        leer(u_direc);
                        arr1[pos].dirección:= u_direc;

                        esc('Ingrese el nuevo número de teléfono.');
                        leer(u_tel);
                        arr1[pos].teléfono:= u_tel;

                    sino
                        esc('No se encontró el nombre solicitado.');
                    fin_si 
            

            'E':    esc('Ingrese el nombre de la persona que desee eliminar');
                    leer(u_nombre);
                    
                    pos:= 1;
                    mientras (pos < 50) y (arr1[pos].nombre <> u_nombre) hacer
                        pos:= pos + 1;
                    fin_mientras

                    si (arr1[pos].nombre = u_nombre) entonces
                        
                        para i:= pos hasta 50-1 hacer
                            aux:= arr1[i+1]         // guardo 41 pongo aux
                            arr1[i+1]:= arr1[pos];   // en 41 pongo pos
                            arr1[pos]:= aux;        // en 40 pongo aux
                        fin_para 
                    
                        arr1[50].nombre:= HV; 
                        arr1[50].dirección:= HV;
                        arr1[50].teléfono:= HV;

                    sino 
                        esc('No se encontró el nombre solicitado.');
                    fin_si
            
            
            'A':    pos:= 1;
                    mientras (pos < 50) y (arr1[pos].nombre <> HV) hacer 
                        pos:= pos + 1;
                    fin_mientras 

                    si (arr1[pos].nombre = HV) entonces 
                        esc('Ingresar nombre >> ');
                        leer(u_name);
                        arr1[pos].nombre:= u_name; 
                        
                        esc('Ingresar dirección >> ');
                        leer(u_direc);
                        arr1[pos].dirección:= u_direc;
                        
                        esc('Ingresar teléfono >> ');
                        leer(u_tel);
                        arr1[pos].teléfono:= u_tel;
                    sino 
                        esc('No es posible dar de alta un nuevo contacto.');
                        esc('Su agenda está completa.');
                    fin_si 

                    // Inserción directa - men/may

                    para i:= 2 hasta 50 hacer 
                        xv:= arr1[i];
                        j:= i - 1;

                        mientras (arr1[i].nombre > xv.nombre) y (j > 0) hacer
                            arr1[j+1]:= arr1[j]
                            j:= j - 1;                   
                        fin_mientras  
                        
                        arr1[j+1]:= xv;
                    fin_para                                
        fin_según

        esc('¿Desea repetir el proceso?');
        leer(op1);
    
    fin_mientras

Fin_Acción.





