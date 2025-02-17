ORG 100H

.MODEL SMALL
.DATA 


SUM DB 0
MSG_1 DB "ENTER NUM:$"
NL DB 10,13,"$"  
M DB ?
N DB ?
K DB 2
REM DB ? 

MULTIPLICATION DB ?
DIVISION DB ?



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
    MOV M,BL
    INC BL
    MOV N,BL
    
    ;SUM=N*(N+1)/2=8*9/2
    
    
    MOV AH,0
    MOV AL,N
    MOV CL,M
    MUL CL 
    MOV MULTIPLICATION,AL
    
    
    MOV BL,K
    DIV BL
    MOV DIVISION,AL
    MOV SUM,AL
    MOV REM,AH
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN

--------------
.model small
.stack 100h
.data

ans dw ?
n dw ?
m dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    
    ;take user input
    mov ah,1
    int 21h
    sub ax,48
    mov ah,0
    mov n,ax
    ;mov bx,10
    ;mul bx
    ;mov n,ax
    
    ;2nd digit take input
    ;mov ah,1
    ;int 21h
    ;sub ax,48
    ;add ax,n
   ; mov m,ax       
             
      
    xor ax,ax
    mov ax,n
    
    ;factorial count 
    ;mov ax,7 
    mov cx,ax
    dec cx
    fact:
    mul cx  
    loop fact
    mov ans,ax 
    
    mov ax,ans
    ;mov ah,0
    add ah,48
    add al,48
    aaa
    
    mov bx,ax
    
    mov ah,2
    int 21h
    mov dl,bh
  
   
    
main endp
end main
