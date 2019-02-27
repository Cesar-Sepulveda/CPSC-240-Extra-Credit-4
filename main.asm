;Cesar Sepulveda
;Date: 02/27/19
;CPSC 240
;Extra Credit #4:
;Summing Array Elements in a Range: Create a procedure that returns the sum of all 
;array elements falling within the range j…k (inclusive). Write a test program that 
;calls the procedure twice, passing a pointer to a signed doubleword array, the size 
;of the array, and the values of j and k. Return the sum in the EAX register, and 
;preserve all other register values between calls to the procedure.

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	myarray sDWORD N DUP (-5,-4,-3,-2,-1,0,1,2,3,4,5)		;Initializing the array
	j DWORD ?												;Initializing j
	k DWORD ?												;Initializing k
.code

main PROC
	mov j,-5												;Setting the value of j
	mov k, 5												;Setting the value of k
	mov esi, OFFSET myarray									
	call ArraySum											;Calling the procedure
	

	INVOKE ExitProcess, 0
main ENDP

ArraySum PROC
	mov esi,0												;Setting the array index
	mov eax,0												;Setting the sum to 0
	mov ecx,LENGTHOF myarray								;Getting the number of elements in the array

	L1:														;Starting the loop L1
		add eax myArray[esi]								;Adding the value
		add esi,4											;Getting the next value
	loop L1													;Looping

	mov TheSum,eax
	ret
ArraySum ENDP
END main
