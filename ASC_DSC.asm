.MODEL SMALL
.STACK 100H
.DATA                                                
DESCENDING 5 DUP(?)
ASCENDING 5 DUP(?)
ARR DB 3,7,1,5,2
N DB 5           ;NUMBER OF TERMS IN THE ARRAY 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV BL, N    
    DEC BL
    XOR BH,BH 
    XOR CX,CX
    MOV CL, N
    LEA SI,ARR
    LEA DI,DESCENDING
L1:
    MOV AL,[SI]
    MOV [DI],AL
    INC SI
    INC DI
    LOOP L1
    
    MOV SI, 00H
LO:
    MOV AL, [DESCENDING+SI]
    PUSH SI 
    CMP SI, BX
    JE ASC 
CHECK:
    ADD SI, 1
    CMP AL, [DESCENDING+SI]
    JNG GREATER
NEXT:
    CMP SI, BX
    JNE CHECK
    POP SI
    MOV [DESCENDING+SI], AL
    ADD SI, 1
    JMP LO    
GREATER:
    XCHG AL, [DESCENDING+SI]
    JMP NEXT          ;DESCENDING ORDER ARRANGING
ASC:
    XOR CX,CX
    MOV CL, N
    LEA SI, DESCENDING
L2:
    PUSH [SI]
    INC SI
    LOOP L2
    XOR CX,CX
    MOV CL, N
    LEA SI, ASCENDING
ASCEN:
    POP [SI]
    INC SI
    LOOP ASCEN       ;ASCENDING ORDER ARRANGING
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN