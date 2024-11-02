**************************************
*
* Name: Eric Hooten
* ID: EBHGCP 12258201
* Date: 10/6/2022
* Lab3
*
* Program description: This program is meant to calculate the 'square pyramid number'
*			     By calculating the follwoing sum:
*				
*			     RESULT = 1^2 + 2^2 + 3^2 + ... + N^2, with 1<= N <= 254
*
* Pseudocode:
*	#define N 5
*
*int main(){
*	 unsigned int result;
*	 unsigned int i;
* 	 unsigned int j;
*
* 	 result = 0;
* 	 i = 0;
* 	 j = 0;
*
*  	 while(i < N){
*  	     i++;
*  	     j = 0;
*  	     while(j < i){
*  	         result += i;
*  	         j++;
*  	     }
*  	 }
*}
*
**************************************

* start of data section

	ORG $B000
N       	FCB    254

	ORG $B010
RESULT  	RMB    4

* define any other variables that you might need here
	ORG $BB00
I		RMB	2			unisgned int i;
J		RMB	2			unsigned int j;

	ORG $C000
* start of your program

		CLR	RESULT		result = 0;
		CLR	RESULT+1
		CLR	RESULT+2
		CLR	RESULT+3
		CLR	I			i = 0;
		CLR	I+1
		CLR	J			j = 0;
		CLR	J+1

WHILEONE	LDAA	I+1			while(i < n) {
		CMPA	N
		BHS	ENDWHILEONE
		
		
		LDAD	I			i++;
		ADDD	#1
		STD	I


		CLR	J			j = 0;
		CLR	J+1

WHILETWO	LDAA	J+1			while(j < i) {
		CMPA	I+1
		BHS	ENDWHILETWO

    		LDAD 	RESULT+2		result+=i;
		ADDD 	I
		STD 	RESULT+2


		LDAD	RESULT
		ADCB	#0
		STAB	RESULT+1
		ADCA	#0
		STAA	RESULT
 
		LDAD	J			j++;
		ADDD	#1
		STD	J

          
         	BRA   WHILETWO

ENDWHILETWO	

		BRA	WHILEONE

ENDWHILEONE	STOP


		
