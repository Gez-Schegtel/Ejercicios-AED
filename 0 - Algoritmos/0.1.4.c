
Indique los estados iniciales, intermedios y finales para cada variable incluida en los siguientes enunciados:

1- 

	A := 1,3; X := 0; Y := 8;
	Z := A + Y * 2 - X/3;
	X := X + 2;
	C := (Z - X) * 1,2;
	
	
	- E0: A = INDEF ; X = INDEF ; Y = INDEF ; Z = INDEF ; C = INDEF
	
	- E1: A = 1.3 ; X = INDEF ; Y = INDEF ; Z = INDEF ; C = INDEF
	
	- E2: A = 1.3 ; X = 0 ; Y = INDEF ; Z = INDEF ; C = INDEF
	
	- E3: A = 1.3 ; X = 0 ; Y = 8 ; Z = INDEF ; C = INDEF
	
	- E4: A = 1.3 ; X = 0 ; Y = 8 ; Z = 17.3 ; C = INDEF
	
	- E5: A = 1.3 ; X = 2 ; Y = 8 ; Z = 17.3 ; C = INDEF
	
	- E6: A = 1.3 ; X = 2 ; Y = 8 ; Z = 17.3 ; C = 18.36


2- 

	C := 1; 
	C := 0;
	CA := REDOND (C*2,4 + 1);   
	X := CA + 2;


	
	- E0: C = INDEF ; CA = INDEF ; X = INDEF
	
	- E1: C = 1 ; CA = INDEF ; X = INDEF
	
	- E2: C = 0 ; CA = INDEF ; X = INDEF
	
	- E3: C = 0 ; CA = 1 ; X = INDEF
	
	- E4: C = 0 ; CA = 1 ; X = 3


3- // VOY A CAMBIAR EL ESTADO "INDEF" POR "?"

	BETA := 3/2;
	ALFA := BETA * 2;
	AUXI := ALFA;
	ALFA := BETA;
	BETA := AUXI;

	
	
	- E0: BETA = ? ; ALFA = ? ; AUXI = ? 
	
	- E1: BETA = 3/2 ; ALFA = ? ; AUXI = ? 
	
	- E2: BETA = 3/2 ; ALFA = 3 ; AUXI = ? 
	
	- E3: BETA = 3/2 ; ALFA = 3 ; AUXI = 3
	
	- E4: BETA = 3/2 ; ALFA = 3/2 ; AUXI = 3
	
	- E5: BETA = 3 ; ALFA = 3/2 ; AUXI = 3


4- 
	C := TRUNC (ABSO (4/-2) + 3);
	B := REDOND (-4,3);
	B := B + C;
  
	
	
	- E0: C = ? ; B = ? 
	
	- E1: C = 5 ; B = ? 
	
	- E2: C = 5 ; B = -4
	
	- E3: C = 5 ; B = 1	
	
	
5- 

	ALFA := 2,5; JOTA := 2;
	BETA := ALFA**JOTA;
	I := 2 * JOTA;
	L := JOTA * I;
	ALFA := ALFA + BETA;    
	
	
	
	- E0: ALFA = ? ; BETA = ? ; JOTA = ? ; I = ?  ; L = ?
	
	- E1: ALFA 2.5 ; BETA = ? ; JOTA = 2 ; I = ? ; L = ?
	
	- E2: ALFA 2.5 ; BETA 6.25 ; JOTA = 2 ; I = ? ; L = ? 
	
	- E3: ALFA 2.5 ; BETA 6.25 ; JOTA = 2 ; I = 4 ; L = ?
	
	- E4: ALFA 2.5 ; BETA 6.25 ; JOTA = 2 ; I = 4 ; L = 8
	
	- E5: ALFA 8.75 ; BETA 6.25 ; JOTA = 2 ; I = 4 ; L = 8
	
	
6- 
	
	NUM := ABSO (-10); A := 3;
	NUM2 := TRUNC (NUM/A) ** 2 /A;
	NUM := NUM2 - NUM * 5;
	B := REDOND (NUM/NUM2);
	A := (A + B) - 9 * 2 -1;    
	
	
	- E0: NUM = ? ; A = ? ; NUM2 = ? ; B = ?  
	- E1: NUM = 10 ; A = ? ; NUM2 = ? ; B = ?
	- E2: NUM = 10 ; A = 3 ; NUM2 = ? ; B = ?
	- E3: NUM = 10 ; A = 3 ; NUM2 = 3 ; B = ? 
	- E4: NUM = -47	; A = 3 ; NUM2 = 3 ; B = ?
	- E5: NUM = -47	; A = 3 ; NUM2 = 3 ; B = -16
	- E6: NUM = -47 ; A = -32 ; NUM2 = 3 ; B = -16
	
	
	
	
	
	
	
	
		



