.MODEL SMALL
.STACK 100H
.DATA
NUM1 DW 26
.CODE
MAIN PROC           
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,0H
    MOV AX,NUM1
    
    MOV BX,2
    DIV BX
    MOV BX,AX
    MOV CX,2
    
    L1:
    MOV DX,0H
    MOV AX,NUM1
    DIV CX
    CMP DX,0H
    JE NOT_PRIME
    
    CMP CX,BX
    JG PRIME
    
    ADD CX,1
    JMP L1
    
    NOT_PRIME:
    MOV AX,0H
    JMP EXIT
    
    PRIME:
    MOV AX,1H    ;AX=0 IF NUM1 IS NOT PRIME, 
                 ;AX=1 IF NUM1 IF PRIME
    JMP EXIT         
    
    EXIT:
    MOV AH,4CH   ;AH VALUE IS CHANGED. SO AL VALUE
                 ;WILL SHOW IF NUM1 IS PRIME OR NOT
    INT 21H
    MAIN ENDP
END MAIN