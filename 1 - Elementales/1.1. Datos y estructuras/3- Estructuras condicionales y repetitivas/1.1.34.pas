
{
Escribir un algoritmo que permita imprimir la siguiente sucesión. Considere que N es un número par, que se ingresa.

    2   4   6   ............    N
    2   4   6   ........    N-2
    2   4   6   ...     N-4
    ...........
    2   4   6   
    2   4   
    2   
    

Con num = 8
    
	2 4 6 8
	2 4 6
	2 4
	2

Acción 1134 ES;
Ambiente
	x: entero;
	i: entero;
	num: entero;
		
Proceso
	esc('Ingrese un número par');
	leer(num);
	
	Para x:= num hasta 2, -2 hacer 
	
		Para i:= 2 hasta x, 2 hacer
			 esc('El num. es >> ', i);
		Fin_para
	
	Fin_para
	
Fin_Acción.

}

// En pascal no se le puede dar más steps al bucle manejado por contador.

Program something;
uses crt;
var
	num: integer;
	cont: integer;
	res_num: integer;
		
Begin
	clrscr;
	write('Ingrese un número par >> ');
	readln(num);
	
	res_num:= num;	
	cont:= 2;
	
	while (res_num > 0) do
	begin
		while (num >= 2) do 
		begin
			write(' ', cont, ' ');
			cont:= cont + 2;	
			num:= num - 2;
		end;
		write(#13#10);
		cont:= 2;
		res_num:= res_num - 2;
		num:= res_num;
	end;
	
End.


// Versión en C que sigue la lógica del algoritmo escrito en pseudocódigo

//		#include <stdio.h>
//		int main(void)
//		{
//			int x, i, num;
//			
//			printf("Ingrese un número par \n");
//			scanf("%d", &num);
//			
//			for (x = num ; x >= 2 ; x = x - 2)
//			{
//			 
//				for (i = 2 ; i <= x ; i = i + 2)
//				{ 
//					 printf(" %d", i);   
//				}
//			
//				printf("\n");
//			}
//			
//		}



