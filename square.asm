.MODEL SMALL
.STACK 100H
.DATA
N DW 7
TOT DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,N 
    MOV BX,00H
    
    LOOP_1:
    MOV DX,00H
    MOV AX,00H
    MOV AX,CX
    MUL CX
    CWD
    ADD BX,AX
    LOOP LOOP_1
    
    MOV TOT,BX
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN