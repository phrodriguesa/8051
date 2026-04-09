ORG 0000H            ; Endereço inicial (reset do 8051)

main:
    CLR P1.0         ; Coloca o pino P1.0 em nível baixo (LED desligado)

    NOP              ; Atraso de 1 us
    NOP              ; Atraso de 1 us

    CALL DELAY       ; Chama a rotina de atraso (~500 ms)

    SETB P1.0        ; Coloca P1.0 em nível alto (LED liga) (adicione um breakpoint aqui)

STOP:
    SJMP STOP        ; Loop infinito para travar o programa (evita reinício)


; DELAY (~500 ms)
DELAY:
    MOV R2,#5        ; Contador externo (repete tudo 5 vezes)

DL2:
    MOV R1,#199; Contador intermediário (200 repetições)

DL1:
    MOV R0,#249      ; Contador interno (249 repetições)

    NOP              ; Ajuste fino de tempo (1 us)

DL0:
    DJNZ R0,DL0      ; Loop interno: decrementa R0 até zero (~498 us total)

    DJNZ R1,DL1      ; Repete o loop interno 200 vezes

    DJNZ R2,DL2      ; Repete todo o conjunto 5 vezes (~499 ms acumulados)

    MOV R3,#250      ; Define contador extra
    DJNZ R3,$        ; Loop curto (~500 us)

    MOV R4,#248      ; Outro ajuste fino
    DJNZ R4,$        ; Loop curto (~496 us)

    RET              ; Retorna para o programa principal
