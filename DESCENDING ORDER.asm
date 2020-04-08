.MODEL SMALL
.STACK 100H
.DATA
ARR DW 2H,3H,1H,9H,8H
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV SI, 00H
    LO:
    MOV AX, [ARR+SI]
    PUSH SI 
    CMP SI, 08H
    JE EXIT 

    
CHECK:
    ADD SI, 2
    MOV BX, [ARR+SI]
    CMP AX, [ARR+SI]
    JNG GREATER
NEXT:
    CMP SI, 08H
    JNE CHECK
    POP SI
    MOV [ARR+SI], AX
    ADD SI, 2
    JMP LO    
    
GREATER:
    XCHG AX, [ARR+SI]
    JMP NEXT
    
    EXIT:
    MOV AH,4CH
    INT 21H
END MAIN