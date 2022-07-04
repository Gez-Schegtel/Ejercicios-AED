
Encuentre el valor de la variable RESULT después de la ejecución de las siguientes secuencias de operaciones. Realizar prueba de escritorio.

1-
	RESULT := 5 + 2**3*2;
	
	- E0: 5 + 2**3*2
	- E1: 21


2-
	X := 2; Y := 3;
	RESULT := X**Y - X;
	
	- E0: X = ? ; Y = ? ; RESULT = ? 
	- E1: X = 2 ; Y = ? ; RESULT = ?
	- E2: X = 2 ; Y = 3 ; RESULT = ? 
	- E3: X = 2 ; Y = 3 ; RESULT 6

3- 

	UNO := 10; DOS := 200;
	RESULT := ABSO (UNO - DOS);
	UNO := TRUNC ( RESULT / 3 ) - UNO ** 2;
	RESULT := (DOS - UNO) * 2;

   	- E0: UNO = ? ; DOS = ? ; RESULT = ?
   	- E1: UNO = 10 ; DOS = ? ; RESULT = ?
   	- E2: UNO = 10 ; DOS = 200 ; RESULT = ?
   	- E3: UNO = 10 ; DOS = 200 ; RESULT = 190
   	- E4: UNO = -37 ; DOS = 200 ; RESULT = 190
   	- E5: UNO = -37 ; DOS = 200 ; RESULT = 474

4-

	VBLE1 := 10; VBLE2 := 3;
	RESULT := TRUNC (VBLE1 / VBLE2);
	VBLE1 := VBLE1 + VBLE2;
	RESULT := ABSO (VBLE2 - VBLE1) ** 2;
	RESULT := RESULT * 0,1;

	- E0: VBLE1 = ? ; VBLE2 = ? ; RESULT = ?
	- E1: VBLE1 = 10 ; VBLE2 = ? ; RESULT = ?
	- E2: VBLE1 = 10 ; VBLE2 = 3 ; RESULT = ?
	- E3: VBLE1 = 10 ; VBLE2 = 3 ; RESULT = 3
	- E4: VBLE1 = 13 ; VBLE2 = 3 ; RESULT = 3
	- E5: VBLE1 = 13 ; VBLE2 = 3 ; RESULT = 100
	- E6: VBLE1 = 13 ; VBLE2 = 3 ; RESULT = 10
	
5- 

	X := 10; RESULT := 3;
	TRES := ABSO (RESULT - X) + 2 * RESULT;
	X := REDOND (TRES / 2);
	Z := X MOD RESULT;
	RESULT := (2*(-5) + X)**2;

	- E0: X = ? ; RESULT = ? ; TRES = ? ; Z = ? 
	- E1: X = 10 ; RESULT = ? ; TRES = ? ; Z = ?
	- E2: X = 10 ; RESULT = 3 ; TRES = ? ; Z = ?
	- E3: X = 10 ; RESULT = 3 ; TRES = 13 ; Z = ?
	- E4: X = 7 ; RESULT = 3 ; TRES = 13 ; Z = ?
	- E5: X = 7 ; RESULT = 3 ; TRES = 13 ; Z = 1
	- E6: X = 7 ; RESULT = 9 ; TRES = 13 ; Z = 1
		
6- 

	UNO := 1; DOS := 2; TRES := 4;
	DOS := ABSO (UNO - TRES);
	RESULT := DOS * TRES;
	
	- E0: UNO = ? ; DOS = ? ; TRES = ? ; RESULT = ? 
	- E1: UNO = 1 ; DOS = ? ; TRES = ? ; RESULT = ? 
	- E2: UNO = 1 ; DOS = 2 ; TRES = ? ; RESULT = ?
	- E3: UNO = 1 ; DOS = 2 ; TRES = 4 ; RESULT = ?
	- E4: UNO = 1 ; DOS = 3 ; TRES = 4 ; RESULT = ?
	- E5: UNO = 1 ; DOS = 3 ; TRES = 4 ; RESULT = 12
	
	
	
	
	
	
	
	
	
	
