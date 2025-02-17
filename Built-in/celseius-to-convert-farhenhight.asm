INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
    M DW 9 ; Multiplication factor
    N DW 5 ; Division factor

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    PRINT "Input Celsius value: "
    CALL SCAN_NUM

    MOV AX, M
    MUL CX
    MOV BX, N
    DIV BX
    ADD AX, 32 ; Add 32 to the result

    PRINTN ' '
    PRINT "Fahrenheit temperature result: "
    CALL PRINT_NUM


        DEFINE_SCAN_NUM    
        
        DEFINE_PRINT_NUM
           
        DEFINE_PRINT_NUM_UNS

END MAIN

