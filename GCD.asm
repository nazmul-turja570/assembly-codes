.MODEL SMALL
.STACK 100H
.DATA
NUM1 DW 5
NUM2 DW 17
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BX,NUM1
    MOV CX,NUM2
    
    
    GCD:
    MOV DX,0H
    MOV AX,BX
    DIV CX
    MOV BX,CX   ;THE VALUE OF THE GCM IS MOVED TO BX,
                ;AS IT IS SELECTED TO SHOW THE RESULT
    CMP DX,0H
    JNE GCD1
    JMP EXIT
    
    GCD1:
    MOV CX,DX
    JMP GCD
    
    EXIT:
    MOV AH,4CH   
    INT 21H
    MAIN ENDP
END MAIN  