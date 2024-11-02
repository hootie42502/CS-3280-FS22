***************************************
*
* Name: Eric Hooten
* ID:   EBHGCP
* Date: 10/25/22
* Lab 4
*
* Program description:
*
*
* Pseudocode of Main Program:
*
*unsigned int NARR[] = {1,5,100,200,254,0};
*unsigned int sentinel = 0;
*unsigned int RESARR[5];
*
*int main()
*{
*    int k = 0;
*    do {
*        RESARR[k] = getNum(NARR[k]);
*        k++;
*        
*    } while(NARR[k] != sentinel);
*    
*}
*
*---------------------------------------
*
* Pseudocode of Subroutine:
*
*
*int getNum(int num) {
*    unsigned int result;
*    unsigned int count;
*    unsigned int i;
*    unsigned int j;
*    unsigned int square;
*
*    result = 0;
*    j = num;
*    do {
*        count = j;
*        i = 1;
*        square = 0;
*        do {
*            square += i;
*            i += 2;
*            count--;
*        } while(count >0) ;
*        
*        result += square;
*        j--;
*        
*    } while(j>0);
*    
*    return result;
*}
*
*	
***************************************
* start of data section
	ORG $B000
NARR	FCB	1, 5, 100, 200, 254, $FF
SENTIN	EQU	$FF

	ORG $B010
RESARR	RMB	20	



* define any variables that your MAIN program might need here
* REMEMBER: Your subroutine must not access any of the main
* program variables including NARR and RESARR.

	ORG $B100
RESULTADR	RMB	2

	ORG $C000
	LDS	#$01FF		initialize stack pointer
	LDX	#NARR
	LDAD	#RESARR
	STD	RESULTADR
	
WHILE	LDAA	0,X
	CMPA	#255
	BEQ	ENDWHILE

	JSR	SUB
	
	LDY	RESULTADR
	PULB	
	PULA
	STD	2,Y
	PULB
	PULA	
	STD	0,Y
	
	INY
	INY
	INY
	INY
	
	STY	RESULTADR
	INX
	BRA	WHILE
	
ENDWHILE	STOP
* start of your program



* define any other variables that you might need here using RMB (not FCB or FDB)
* remember that your main program must not access any of these variables, including
	ORG $C500
RESULT	RMB	4
SUBCOUNT	RMB	1
I		RMB	2
J		RMB	1
SQUARE	RMB	2



	ORG $D000
* start of your subroutine 
SUB	CLR	RESULT
	CLR	RESULT+1
	CLR	RESULT+2
	CLR	RESULT+3


	STAA	J
DO1	LDAA	J
	STAA	SUBCOUNT
	LDD	#1
	STD	I
	CLR	SQUARE
	CLR	SQUARE+1
DO2	LDD	SQUARE
	ADDD	I
	STD	SQUARE
	LDD	I
	ADDD	#2
	STD	I
	DEC	SUBCOUNT
UNTIL2	BNE	DO2
ENDDO2	LDD	RESULT+2
	ADDD	SQUARE
	STD	RESULT+2
IF	BCC	ENDIF
THEN	LDD	RESULT
	ADDD	#1
	STD	RESULT
	
ENDIF	DEC	J

UNTIL1	BNE	DO1
ENDO1	PULY
	LDAD	RESULT
	PSHA
	PSHB
	LDAD	RESULT+2
	PSHA
	PSHB
	PSHY
	RTS
	


