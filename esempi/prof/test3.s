@ Implementa for loop
@ tmp = 0
@ for i = 0, i<100, i++:
@ 	tmp = tmp +i


.text
.global main

main:
	@ r0 contiene tmp
	@ r1 contiene i

	mov r0, #0 		@ tmp=0
	mov r1, #0		@ i = 0
	
forloop: add r0, r0, r1
	 add r1, r1, #1		@ i = i+1
	 cmpS r1, #100		@ confronta i con 100
	 blt forloop


@ Implementazione alternativa
@ forloop: cmp r1, #100		@ confronta i con 100
@	bge endfor		@ se i>= 100 esci da for
@	add r0, r0, r1
@	add r1, r1, #1		@ i = i+1
@	b forloop


endfor: @ termina programma
	mov pc, lr
