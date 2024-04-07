.data
addr_n: .word 15		@ word in memoria con il valore di n 

.bss
addr_sum: .skip 4		@ word in memoria dove salvare il valore finale

.text
.global main

main:
	@@@ Inizializzazione registri 	
	ldr r4, =addr_n		@ Carico l'indirizzo in memoria di n
	ldr r3, [r4]		@ Carico il valore di n in r3
	mov r0, #0			@ r0 contiene la somma parziale dei quadrati
	mov r1, #0			@ r1 contiene il contatore 
	
loop:					@ inizio del loop
	@@@ Corpo centrale del loop
	mul r2, r1, r1		@ r2 contiene il quadrato r1^2
	add r0, r0, r2		@ aggungo il quadrato alla somma parziale
	bl print_int		@ stampo in output il risultato parziale
	add r1, r1, #1		@ incremento il contatore

	@@@ Verifica fine loop
	cmp r1, r3			@ controllo di essere arrivato alla fine del loop
	bls loop			@ torno indietro se r1<=r3

	@@@@ Esco dal loop
	ldr r5, =addr_sum	@ carico l'indirizzo dove salvare il risultato
	str r0, [r5]		@ salvo il risultato
	bl exit_program		@ esco dal programma

