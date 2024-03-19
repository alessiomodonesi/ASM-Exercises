@ direttive per compilatore
.data @ dati inizializzati

ind_a:
        .word 3
ind_b:
        .word 5

.bss @ dati non inizializzati

ind_c:
        .space 4

.text @ istruzioni
.global main

@ istruzioni macchina

main:   ldr r0, =ind_a  @ r0 contiene ind_a   
        ldr r3, [r0]    @ carica r0 in r3

        ldr r1, =ind_b  @ r1 contiene ind_b
        ldr r4, [r1]    @ carica r1 in r4

        add r5, r3, r4  @ salva in r5 la somma r3+r4

        ldr r2, =ind_c  @ r2 contiene ind_c 
        str r5, [r2]    @ inserisce r2 in r5

@ add, sub      aritmetico logiche
@ ldr, str      spostamento mem/rigistri
@ mov           spostamento tra rigistri