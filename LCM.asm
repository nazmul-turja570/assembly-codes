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
    MOV BX,CX
    CMP DX,0H
    JNE GCD1
    JMP LCM
    
    GCD1:
    MOV CX,DX
    JMP GCD 
    
    LCM:
    MOV AX,NUM1
    MUL NUM2
    CWD
    DIV BX        ;THE LCM IS STORED IN AX
    MOV BX,AX     ;MOVING THE VALUE OF THE LCM FROM AX TO BX, 
                  ;WHERE THE RESULT WILL BE SHOWN  
    
    EXIT:
    MOV AH,4CH 
    INT 21H
    MAIN ENDP
END MAIN