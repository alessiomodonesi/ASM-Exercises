.data
   addr_n: .word 15             @ word in memoria con il valore di n

.bss
   addr_sum: .skip 4            @ word in memoria dove salvare il valore finale

.text
.global main

main:
        mov r2, #1
        mov r0, #0
        ldr r3, =addr_n
        ldr r4, [r3]
        ldr r3, =addr_sum

loop:
        mul r1, r2, r2
        add r0, r0, r1
        add r2, #1
        bl print_int
        cmp r2, #5
        bls loop

        add r0, r0

loop_1:
        mul r1, r2, r2
        add r0, r0, r1
        add r2, #1
        bl print_int
        cmp r2, r4
        bls loop_1

        str r0, [r3]
        bl exit_program

@ gcc -lwiringPi -ggdb  -o sum sum.s libae.s