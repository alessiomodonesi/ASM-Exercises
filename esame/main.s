.data
S:	    .ascii "I love programming in assembly"
	    .byte  0    @ EOS (terminatore di stringa)
	    .align      @ allineamento a indir. di word
.bss
	    .align 4
	    .skip 1024	@ spazio per lo stack
stack:  .space 4    @ base dello stack

.global main
main:   LDR SP, =stack  @ inizializza lo stack pointer
        LDR R1, =S      @ indirizzo di S
        
        PUSH {R1}       @ push
        MOV R1, #5      @ primo valore di N in R1
        PUSH {R1}       @ push
        BL NWORD        @ prima chiamata alla subroutine

        ADD SP, SP, #4  @ rimuove N dallo stack
        MOV R1, #6      @ secondo valore di N in R1
        PUSH {R1}       @ push
        BL NWORD        @ seconda chiamata alla subroutine

        ADD SP, SP, #8  @ rimuove i parametri dallo stack

INLOOP: B INLOOP        @ fine programma (loop infinito)