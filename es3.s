.data

vect: .word 1, 3, 6, 8, 10

.text
.global main

@vect[2] in R5

main:   ldr r0, =vect

        @ prima variante
        add r0, r0, #8
        ldr r5, [r0]

        @ seconda variante
        ldr r5, [r0, #8]

        @ somma degli elementi in vect
        @ r1 è il contatore del for loop for(i=0; i<5; i++) tmp = tmp + vect[i]
        @ r2 la somma parziale tmp
        @ r5 prossimo elemento da sommare a vect[i]
        @ r0 indirizzo di vect

        mov r1, #0
        mov r2, #0

loop:   ldr r5, [r0, r1]
        add r2, r2, r5
        add r1, r1, #4
        cmp r1, #20
        blt loop

        @ seconda variante somma
        mov r1, #0
        mov r2, #0

        @ r1 contiene indice non offset!
loop2:  ldr r5, [r0, r1, LSL #2] @ logical shift left
        add r2, r2, r5
        add r1, r1, #1
        cmp r1, #5
        blt loop2