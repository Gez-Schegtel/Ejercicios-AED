Ejercicio 3.9
Se posee un arreglo de 200 libros con el siguiente formato:

NRO_LIBRO	TITULO	AUTOR	CANT_HOJAS
ordenado por AUTOR y se presentan las siguientes premisas:

Se necesita saber que libros se poseen de “Nicklaus Wirth”.
Se necesita saber en qué posición se encuentra “Algoritmos + Estructuras de Datos=Programa”.
Se necesita saber cual es el libro de “Nicklaus Wirth” de mayor volumen.

Acción 3.9 es
	Ambiente
		libro=registro
			autor:an(40)
			nro_libro:n(4)
			titulo:an(40)
			cant_hojas:n(4)               
		fin_registro


		//reg_libro:libro esto no va en este tipo de ejercicios

		arr1: arreglo de [1..200] de libro 

		Procedimiento carga es
			Proceso
				para i:=1 hasta 200
					escribir ('escriba el numero de libro')
					leer (arr1[i].nro_libro)
					
					escribir ('escriba el titulo del libro')
					leer (arr1[i].titulo)
					
					escribir ('escriba el nombre del autor')
					leer (arr1[i].autor)
					
					escribir ('escriba la cantidad de hojas')
					leer (arr1[i].cant_hojas)
				fin_para
		Fin_procedimiento
		i:entero
		pos_GhostRider:entero
		control:entero
		res_titulo:an(40)
	
	Proceso
		carga
		
		//busqueda lineal
		Escribir ("Los libros de Nicolas Cage:")
		control:=0
		
		para i:=1 hasta 200
			si arr1[i].autor= "Nicolas Cage" entonces
				Escribir ("el nombre del libro es", arr1[i].titulo)
				
				si arr1[i].cant_hojas > control entonces
					control:= arr1[i].cant_hojas
					//manera 1
					res_titulo:= arr1[i].titulo
					//manera 2
					res_pos:= i
				fin_si
			fin_si
		fin_para

		//manera 1
		Escribir ("El libro de Nicolas con mayor volumen es", res_titulo, ".")

		//manera 2
		Escribir ("El libro de Nicolas Cage con mayor volumen es", arr1[res_pos].titulo, ".")

		//busqueda lineal con centinela
		pos_GhostRider:=1

		Mientras (pos_GhostRider < 200) y (arr1[pos_GhostRider].titulo <> "Algoritmos + Estructuras de Datos=Programa") hacer
			pos_GhostRider:=pos_GhostRider+1
		Fin_Mientras

		Si arr1[pos_GhostRider].titulo = "Algoritmos + Estructuras de Datos=Programa" entonces
			Escribir ("Algoritmos + Estructuras de Datos=Programa está en la posición", pos_GhostRider)
		sino 
			Escribir ("Algoritmos + Estructuras de Datos=Programa no se ha encontrado")

		Fin_Si

Fin_acción


