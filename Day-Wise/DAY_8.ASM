ORG 100H

.MODEL SMALL
.DATA 


SUM DB 0
MSG_1 DB "ENTER NUM:$"
NL DB 10,13,"$"



.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MSG_1
    INT 21H
    
    ;INPUT
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    
    MOV BH,0
    MOV CX,BX
    MOV BL,1
    
    INPUT:
    
    ADD SUM,BL  ;SUM=N*(N+1)/2=9*10/2=45
    INC BL
     
    lOOP INPUT
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN