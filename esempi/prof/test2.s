@ DIRETTIVE: comandi per compilatore
@ ISTRUZIONI: comandi per macchina ARM

.data

ind_a:	.word 3
ind_b:	.word 5


.bss
ind_c: .space 4


.text 
.global main

@ r0 ind A
@ r1 ind B
@ r2 ind C

@ ldr -> load 
@ str -> store


@ Prima parte del codice, calcola 3+5 con valori di input/output in memoria

main:	ldr r0, =ind_a	@ r0 contiene ind. A
	ldr r3, [r0]	@ r3 contiene valore A

	ldr r1, =ind_b
	ldr r4, [r1]	@ r4 contiene valore B


	add r5, r3, r4	@ risultato r3+r4 (A+B) va in r5
	
	ldr r2, =ind_c
	str r5, [r2]	@ copia valore in r5 in mem all'ind, in r2


	@ Seconda parte del codice: implementa un if
	@ if a>0 then
	@ 	b = 5
	@ else
	@	b = 10
	cmp r3, #0	@ r3 - 0
	bGT positivo @ signed >
	bLE nonpositivo @ signed <=

positivo:	@ condizione r3>0
	mov r4, #5
	b endif	

nonpositivo:	@ condizine r3<=0
	mov r4, #10

endif:  @ Salva nuovo valore b in memoria
	str r4. [r1]  


	@ Termina programma
	mov pc, lr


@ b -> salto senza condizioni/incondizionato
@ bXX -> salto con condizioni/condizionato


