.MODEL SMALL
.STACK 100H
.DATA
X DW 100H
Y DW 200H
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,X
    MOV BX,Y
    
    CMP AX,1000H
    JG GREAT
    JMP YCHECK
    
    GREAT:
    CMP BX,1000H
    JL 3RD
    ADD AX,BX
    JMP EXIT
    
    3RD:
    NOT AX
    JMP EXIT
    
    YCHECK:
    CMP BX,1000H
    JL LESS
    
    LESS:
    SUB AX,BX
    JMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN