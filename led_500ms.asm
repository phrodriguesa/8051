ORG 0000H

main:
    CPL P1.0         ; alterna o LED

    CALL DELAY       ; espera ~500 ms

    SJMP main        ; repete

; DELAY (~500 ms)
DELAY:
    MOV R2,#5        ; Contador externo

DL2:
    MOV R1,#201      ; Ajustado (+1 para compensar R3 removido)

DL1:
    MOV R0,#249      ; Contador interno

DL0:
    DJNZ R0,DL0      ; Loop interno

    DJNZ R1,DL1      ; Loop intermediário

    DJNZ R2,DL2      ; Loop externo (~500 ms total)

    RET
