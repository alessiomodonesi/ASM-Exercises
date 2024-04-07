.data
.word 1                                 @ crea una word e ci mette i valori
vect: .word 1, 3, 6, 8, 10              @ array statico con 5 posizioni, ognuna occupata da 1 word (4 byte per word) (indicizzato con la label "vect")
                                        @ la label "vect" punta alla prima cella

.text
.global main

@ voglio accedere al terzo elemento

main:   ldr, r0, =vect                  @ r0 contiene l'indirizzo del vettore

        @ prima versione
        add r0, r0, #8                  @ cambiamo il valore di r0 (8: offset --> indica di quanto bisogna saltare per accedere ad una determinata word)
        ldr, r5, [r0]                   

        @ seconda versione
        ldr r5, [r0, #8]                @ vai in memoria all'indirizzo r0 + 8

@ vogliamo sommare i primi 5 elementi
@ r1 è il contatore del for loop       for (i = 0, i < 5, i++) tmp = tmp + vect[i] --> quanto devo saltare da vect per accedere a vect[i]
@ r2 è la somma parziale tmp
@ r5 prossimo elemento da sommare (vect[i])

mov r1, #0
mov r2, #0

loop:   ldr r5, [r0, r1]
        add r2, r2, r5
        add r1, r1, #4                  
        cmp r1, #20                     @ 20 eè l'indirizzo dell'ultimo valore
        blt loop

loop2:  ldr, r5, [r0, r1, lsl #2]       @ lsl: logical shift left (r1 * 2^2 --> r1 * 4)
        add r2, r2, r5
        add r1, r1, #1
        cmp r1, #5
        blt loop2

main:   ldr r1, =A                      @ indirizzamento fatto con A sarebbe diretto, ma A è un valore troppo grande (non ci sta nei 32 bit disponibili)
                                        @ il compilatore trova un posto in memoria in cui mettere l'indirizzo di A
                                        @ quando carichiamo in r1 l'indirizzo di A diciamo prendi il valore del PC e ci aggiungi un offset (che è il valore di A)
        ldr r0, [r1]