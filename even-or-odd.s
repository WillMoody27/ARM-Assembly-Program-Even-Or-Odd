           AREA RESET, DATA, READONLY
        EXPORT __Vectors
__Vectors
        DCD 0x20001000
        DCD Reset_Handler ; reset vector
        ALIGN
        AREA CS2400_Sp23, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler
Reset_Handler
;------------------CODE HERE--------------------
; William Hellems-Moody , (Time Taken: 3 hours 30 mins)

		LDR R0,=A ; Load the address of array A.
		LDR R5,=SE ; Load the address of even variable.
		LDR R6,=SO ; Load the address of even variable.
		
		MOV R1,#7 ; Store in R1 the size of array A based on number of letter in first name.
		MOV R2,#0; Temp set the largest value to default 0.
		BL high ; Branch to function high.
				
high

		; Loop and find the largest value in array based on number of letters in first name.
		MOV R3,#0 ; Counter to check size of array.
		
Loop

		LDR R4,[R0],#4 ; Get the next element in the array.
		CMP R1,R3 ; Compare the element with the largest value found so far.
		CMPNE R4,R2 ; Compare the value of R4 and current largest value (R2).
		MOVGT R2,R4 ; Set the new largest value if greater than current largest value (R2).
		SUBS R1,R1,#1 ; Decrement counter.
		BNE Loop ; Continue loop if not at the end of the array.
		
		; Check if the value is even or odd stored in R2 (largest value in array).
		MOV R7,R2 ; Store the result in temp variable to check if EVEN or ODD using ANDS.
		ANDS R7,R7, #1 ; Check largest value (R2) if EVEN or ODD from array A.
		BEQ even ; Branch to EVEN if largest result is EVEN.
		B odd ; Branch to ODD if largest result is ODD.
		
even

		STR R2,[R5] ; If the largest value of array is EVEN then store in SE variable(R5).
		B stop

odd
		
		STR R2,[R6] ; If the largest value of array is ODD then store in SO variable(R6).
		B stop
		
;------------------CODE HERE--------------------
stop B stop
A DCD 1,13,3,5,12,9,7 ; Integer Array A of size equal to number of alphabets in your firs name (william).

	AREA myData,DATA,READWRITE

SE DCD 0 ; Variable SE to store the largest value if EVEN.
SO DCD 0 ; Variable SO to store the largest value when ODD.

        END