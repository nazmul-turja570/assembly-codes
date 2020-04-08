.MODEL SMALL
.STACK 100H  
.DATA
VAL DW 4
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,5
    MOV BX,VAL
    CMP BX,AX
    JG GREATER
    JE EQ
    JL LESS
    
    GREATER:
    MOV CX,0H
    JMP EXIT
    
    EQ:
    MOV CX,1H
    JMP EXIT
    
    LESS:
    MOV CX,2H
    JMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN