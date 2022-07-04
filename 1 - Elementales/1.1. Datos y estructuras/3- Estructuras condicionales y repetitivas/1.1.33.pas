
{
Escribir un algoritmo que permita imprimir la siguiente sucesión. Considere que N es un número par, que se ingresa.

    2   4   6    8  ...  N
    4   6   8   10  ...  N
    6   8  10   12  ...  N
    ....
    ....
    N
} 

{
Acción 1133 ES;
Ambiente
	x: entero;
	i: entero;
	num: entero;
	cont: entero;

Proceso
	esc('Ingrese un número par');
	leer(num);
	
	cont:= 0;
	para i:= 1 hasta (num) hacer 
	
		para x:= 1 hasta (num div 2) hacer
		
			cont:= cont + 2;
			esc(' ', cont, ' ');
		
		fin_para
		
		esc(''); //separa las líneas.
		cont:= i * 2;
		
	fin_para
	
Fin_Acción.
}  


program loops;
var 
	x: integer;
	i: integer;
	num: integer;
	cont: integer;
Begin
	writeln('Ingrese un número par');
	readln(num);
	
	cont:= 0;
	for i:= 1 to num do 
	begin
		for x:= 1 to (num div 2) do
		begin 
			cont:= cont + 2;
			write(' ', cont, ' ');
		end;
		writeln('');
		cont:= i * 2;
	end;
End.




	//** Ejemplo en C **//

//	#include <stdio.h>
//
//	int main(void)
//	{
//		int x, i, num;
//		
//		printf("Ingrese un número par: \n");
//		scanf("%d", &num);
//		res_num = num;
//		
//		int cont = 0;
//		for (i = 1 ; i <= num ; i++)
//		{
//			for (x = 2 ; x <= num ; x+=2)
//			{
//				printf(" %d ", cont+=2);
//			}
//			
//			cont = i * 2;
//			printf("\n");
//		}
//	}






