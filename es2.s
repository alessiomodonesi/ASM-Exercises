.text
.global main

@ voglio sommare i primi 100 numeri con un for loop
@ tmp = 0
@ for i = 0, i < 100, i++
@ tmp = tmp + i

main:       @ r0 contiene tmp
            @ r1 contiene i
            
            mov r0, #0          @ tmp = 0
            mov r1, #0          @ i = 0
            
forloop:    cmp r1, #100        @ check per vedere se sono arrivato alla fine del mio for (confronta i con 100) --> ci interessa il caso i > 100
            bGE endfor          @ se i > 100: esci dal for

            add r0, r0, r1

            add r1, r1, #1      @ i = i + 1

            b forloop

@ metodo piu' semplice

forloop:    add r0, r0, r1
            add r1, r1, #1
            cmp, r1, #100
            bLI endfor          @ continuo ad eseguire il programma se i < 100

endfor:     mov pc, lr          @ termina il programma

@ addS .... : questa operazione modifica anche il bit di stato (a seconda dell'esito dell'add)
@ cmpS .... : non cambia il bit di stato