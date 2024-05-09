EOS     =0
SPACE   =0x20

.text
NWORD:  PUSH {FP, LR}        @ salva FP e indirizzo di ritorno
	MOV  FP, SP          @ nuovo frame

       	PUSH {R1-R4}         @ salva i registri usati
	LDR R2, [FP, #12]    @ puntatore alla stringa da esaminare
        LDR R3, [FP, #8]     @ valore di N
        MOV R0, #0           @ valore iniziale del contatore di parole

LOOPW:  MOV R1, #0           @ valore iniziale del contatore di caratteri

LOOPI:  LDRB R4, [R2], #1    @ carattere in R4, poi punta al successivo
        CMP R4, #EOS         @ fine della stringa?
        BEQ EXIT             @ si: fine della subroutine

        CMP R4, #SPACE       @ verifica se è uno spazio
        BEQ LOOPI            @ ignora spazi iniziali e successivi al primo

        ADD R1, R1, #1       @ inizio di parola: conta il carattere

LOOP:   LDRB R4, [R2], #1    @ caratt. successivo in R4 e incr. puntatore
        CMP R4, #EOS         @ è il fine stringa?
        BEQ CHKLEN           @ si: salta a gestione fine parola

        CMP R4, #SPACE       @ è uno spazio?
        ADDNE R1,R1,#1       @ no: conta il carattere ...
        BNE LOOP             @ ... e prosegue la scansione della parola

CHKLEN: CMP R1, R3           @ si: fine parola; ha meno di N caratteri?
        ADDLO R0, R0, #1     @ si: conta la parola
        
        CMP R4, #EOS         @ fine stringa?
        BNE LOOPW            @ no: prosegue con la parola successiva

EXIT:   POP {R1-R4}          @ ripristina i registri usati
        POP {FP, PC}         @ elimina il frame e ritorna