.MODEL SMALL
.STACK 100H
.DATA
M DW 3 
N DW 6
TOT DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AX, N
    DEC AX
    CMP AX,00H
    MOV BX,01H
    JZ N_IS_1
    MOV CX,AX
    MOV AX,01H
    
    LP:
    PUSH BX
    MOV DX,00H
    MOV BX,M
    MUL BX
    POP BX
    ADD BX,AX
    LOOP LP
    
    N_IS_1:
    JMP EXIT
    
    EXIT:
    MOV TOT,BX
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN