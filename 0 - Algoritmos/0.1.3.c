
Suponga que los estados iniciales de K, Q y DOS son 4, 7 y 10. Especifique cuáles son los estados iniciales y finales de cada una de las variables después de las siguientes asignaciones.

	TOT := K*(DOS-Q)
	D := DOS/K + Q * 2
	E := TRUNC (Q*0,8 - DOS/3)
	R := REDOND (Q/(3/K))
	K := ABSO (K-Q) + 2 * DOS
	RESULTADO := REDOND (ABSO((K-DOS)/Q)+TRUNC(1,5))
    
	-E0: K = 4 ; Q = 7 ; DOS = 10 ; TOT = INDEF. ; D = INDEF ; E = INDEF ; R = INDEF ; RESULTADO = INDEF
	
	EF: Q = 7 ; DOS = 10 ; TOT = 12 ; D = 16.5 ; E = 2 ; R = 9 ; K = 17 ; RESULTADO = 2



