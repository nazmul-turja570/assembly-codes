.MODEL SMALL
.STACK 100H
.DATA
A DB 7,0,4
N DB    3
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    XOR DX, DX
    XOR CX, CX
    MOV CL, N
    L1:
    PUSH CX
    MOV SI, CX
    DEC SI
    MOV AX, 1H
    XOR CX, CX
    MOV CL, N
    L2:
    MUL A[SI]
    LOOP L2
    POP CX
    ADD DX, AX
    LOOP L1
    
    XOR CX, CX
    MOV CL, N
    MOV AX, 0
    MOV BL, 10D
    L3:
    MUL BL
    MOV SI, CX
    DEC SI
    ADD AL, A[SI]
    LOOP L3 
    
    CMP AX, DX
    JE EQ
    MOV BX, 0H
    JMP EXIT
    
    EQ:
    MOV BX, AX
    
    EXIT:    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN