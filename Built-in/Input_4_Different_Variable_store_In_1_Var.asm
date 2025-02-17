INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
A DB 50 DUP(?)
B DB 50 DUP(?)
C DB 50 DUP(?)
D DB 50 DUP(?)
R DB 100 DUP(?)  
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    CALL NAME_INPUT_OUTPUT
    
    
    lea di,R
    lea si,A 
    mov cx,5
    l1:
    mov al,[si]
    cmp al,'$'
    je next1
    
    mov [di],al
    
    inc si
    inc di
    
    loop l1
    
    
    next1:
    inc di
    lea si,B
    
    mov cx,10
    l2:
    mov al,[si]
    cmp al,'$'
    je next2
    mov [di],al
    inc si
    inc di
    Loop l2
    
    
     next2:
    inc di
    lea si,C
    
    mov cx,2
    l3:
    mov al,[si]
    cmp al,'$'
    je next3
    mov [di],al
    inc si
    inc di
    Loop l3
    
    
     next3:
    inc di
    lea si,D
    
    mov cx,9
    l4:
    mov al,[si]
    cmp al,'$'
    je p
    mov [di],al
    
    inc si
    inc di
    Loop l4 
    
    
    p: 
    INC DI
    MOV [DI, '$']
    printn 'Result:'
    mov ah,9
    lea dx,R
    int 21h
    
    
   

EXIT: 

    MOV AH, 4CH
    INT 21H
MAIN ENDP

NAME_INPUT_OUTPUT PROC
    PRINT 'ENTER STRING A:'
    MOV DX, 50
    LEA DI, A
    CALL GET_STRING
    PRINTN 
    
    

    PRINT 'ENTER STRING B:'
    MOV DX, 50
    LEA DI, B
    CALL GET_STRING
    PRINTN 
    

    PRINT 'ENTER STRING C:'
    MOV DX, 50
    LEA DI, C
    CALL GET_STRING
    PRINTN
  

    PRINT 'ENTER STRING D:'
    MOV DX,50
    LEA DI, D
    CALL GET_STRING
    PRINTN 
    

    RET
NAME_INPUT_OUTPUT ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_GET_STRING 
define_print_string

end main