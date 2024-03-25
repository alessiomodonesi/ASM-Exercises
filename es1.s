@ SOMMA 3+5

.data

@ tra e bss va dichiarato tutto cio' che verra' usato

ind_a:  .word 3 @ il compilatore dice "prendi 32 bit e scrivi il valore 3"

@ ind_a contiene l'indirizzo di memoria che contiene quel valore

ind_b:  .word 5

.bss

@ variabili non inizializzate

.word 0             @ primo metodo per creare una word a cui poi sovrascriveremo il valore di 3+5
ind_c:  .space 4    @ mi "unlock" una word, ovvero 4 byte (in compilazione questi 4 byte non verranno mai)

.text

@ quello che c'e' dopo questa istruzione va codificato

.global main

@ main indica il punto di partenza del programma

@ r0 ind A
@ r1 ind B
@ r2 ind C

@ main sara' un indirizzo di memoria: definisce una label "etichetta" che si chiama main (quella dopo i :), ovvero un'istruzione definita da 32 bit
main:   ldr r0, =ind_a  @ carico in r0 l'indirizzo di A
        ldr r3, [r0]    @ vai in memoria, leggi dal registro r0 l'indirizzo di memoria da cui prendere il valore da mettere in r3, r3 contiene il valore di A

        ldr r1, =ind_b  @ carico in r1 l'indirizzo di B
        ldr r4, [r1]    @ r4 contiene il valore di B

        add r5, r3, r4  @ risultato della somma tra r3 e r4 va in r5

        ldr r2, =ind_c  @ carico in r2 l'indirizzo di C
        str r5, [r2]    @ copia valore in r5 in memoria all'indirizzo r2

@ loop: b loop          @ loop infinito, b significa "salta". Dove? Di nuovo a questa istruzione

        @ mov r0, r1    @ questa istruzione non verra' mai eseguita a causa del loop all'istruzione precedente

        cmp r3, #0      @ cmp: "compare" confronta r3 con il valore 0 facendo r3 - 0. Troveremo informazioni sul risultato del confronto nei registri (bit di stato)
                        @ se r3 = 0, il risultato fa 0 --> bit Z diventa 1

        @ cmp r3, r4    @ Caso generale: calcola r3 - r4
                        @ se r3 = r4 --> Z = 1
                        @ se r3 > r4 --> Z = 0 e N = 0
                        @ se r3 < r4 --> Z = 0 e N = 1

        @ bGT positivo    @ esegui questa istruzione solo se r3 > 0 --> Program counter viene aggiornato a positivo
        @ questo b in realta' non serve (lo commento per fare vedere come si dovrebbe fare per esteso)

        bLE nonpositivo         @ esegui questa istruzione solo se r3 <= 0 --> Program counter viene aggiornato a nonpositivo

positivo:       mov r4, #5      @ metto in B (r4) il valore 5
                b endif         @ mi serve per uscire da questo pezzo di codice se viene eseguito "positivo"

nonpositivo:    mov r4, #10     @ metto in B (r4) il valore 10
                                @ non serve nessun codice di uscita perche' se viene eseguito questo codice, l'istruzione successiva e' fuori dall'if

endif:

@ load e store sono istruzioni di spostamenti di dati memoria/registri
@ add fa parte delle istruzioni aritmentico - logiche
@ mov: spostamento tra registri

@ cio' che inizia con il . sono direttive per il compilatore
@ load, add....: istruzioni per macchina arm

@ b: salto incondizionato
@ b..: salto con condizioni