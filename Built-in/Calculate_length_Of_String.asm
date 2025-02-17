INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
A DB 50 DUP(?)

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
  
    CALL NAME_INPUT_OUTPUT


  
    EXIT:
    MOV AH,04CH
    INT 21H  
    MAIN ENDP 

    NAME_INPUT_OUTPUT PROC
        PRINT 'ENTER YOUR  STRING : '
        MOV DX,50 
        LEA DI,A 
        CALL GET_STRING
        PRINTN ''
        
       
        PRINT 'OUTPUT  :'
        LEA SI,A
        CALL PRINT_STRING  
        PRINTN ' '   
        
    
                            
     PRINT ' TOTAL LENGTH : '    
           
    MOV SI, 0  
CALCULATE_LENGTH:  
    CMP BYTE PTR [A + SI], 0 ;compare with null equal to 0
    ; CMP [A+si], 0 
    JE  PRINT_LENGTH  
    INC SI  
    JMP CALCULATE_LENGTH  

PRINT_LENGTH:
    MOV AX, SI  
    CALL PRINT_NUM_UNS  

   
    RET
    NAME_INPUT_OUTPUT ENDP

    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    DEFINE_GET_STRING
    DEFINE_PRINT_STRING
