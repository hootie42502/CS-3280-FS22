**************************************
*
* Name: Eric Hooten
* ID: EBHGCP 12258201
* Date:9/26/2022
* Lab2
*
* Program description:This program is intended to generate the square of a number N
*			    by calculating the following sum:
*			    N^2 = 1 + 3 + 5 + 7 + ... + (2N-1), with N being between 1 and 255
* Pseudocode:
*int main()
*{
*    int sum = 0
*    int n = 255
*    int counter = 0;
*    
*    while(counter < n) {
*   	   counter++;
*        sum += (2*counter);
* 	   sum--;
*    }
*  
*}
*	
*
*
**************************************

* start of data section

	ORG $B000
N       	FCB 	  255

	ORG $B010
RESULT  	RMB     2

* define any other variables that you might need here
	ORG $BB00
COUNT		RMB	  2	  


	ORG $C000

  		CLR	RESULT		int sum = 0;
		CLR	RESULT+1	 	
   		CLR 	COUNT			int counter = 0;
		CLR 	COUNT+1	 	
    
WHILE		LDAA	COUNT+1       	while(counter < n) {
		CMPA  N
		BEQ	ENDWHILE

		INC   COUNT+1		counter++;

   		LDAD	COUNT			sum += (2*counter);
		ADDD	COUNT
		ADDD	RESULT
		STD	RESULT
		
		 
		DEC	RESULT+1 		sum--;
     		 		  	
        	BRA	  WHILE

ENDWHILE    STOP
						
    					

