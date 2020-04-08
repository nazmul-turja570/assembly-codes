.MODEL SMALL
.STACK 100H
.DATA
A DW 1234H, 5678H         ;A = 56781234H
B DW 3424H, 2874H         ;B = 28743424H
C DW 4 DUP(?)             ;PRODUCT
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
    MOV AX, A
    MUL B
    
    MOV C, AX
    MOV [C+2], DX
    
    MOV AX, A+2
    MUL B
    ADD [C+2], AX
    ADC [C+4], DX
    
    MOV AX, A
    MUL [B+2]
    ADD [C+2], AX
    ADC [C+4], DX
    
    MOV AX, [A+2]
    MUL [B+2]
    ADD [C+4], AX
    ADC [C+6], DX 
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN