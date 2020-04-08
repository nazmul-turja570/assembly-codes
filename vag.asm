.MODEL SMALL
.STACK 100H
.DATA
A DW 7834H,8273H, 2398H, 7684H  ;DIVIDEND
B DW 9124H              ;DIVISOR
C DW 3 DUP(?)           ;QUOTIENT
D DW ?                  ;REMAINDER
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, [A+6]
    MOV AX, [A+4]
    DIV B
    MOV [C+4], AX
    
    MOV AX, [A+2]
    DIV B
    MOV [C+2], AX
    
    MOV AX, A
    DIV B
    MOV C, AX
    MOV D, DX
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN