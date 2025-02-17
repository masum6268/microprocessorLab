;Structure Of Assembly language 
ORG 100H
.model small 
.data      
;extra variable declar

msg_1 db "Enter Your 1st Letter:$"
msg_2 db "Enter Your 2nd Letter:$"
msg_3 db "The Given Letter Alphabetic Order is:$"
     

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9;string print
    lea dx,msg_1
    int 21h
    
    ;input
    mov ah,1
    int 21h
    mov bl,al
    
    ;newline
    mov ah,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    
    mov ah,9
    lea dx,msg_2
    int 21h
    ;input 2
    mov ah,1
    int 21h
    mov bh,al 
    
    mov ah,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    
    
    ;jmp statement
    cmp bl,bh  ;bl-bh=positive
    jg order
    
    next:
    mov ah,9
    lea dx,msg_3
    int 21h 
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    jmp exit
    
    
    order:
    mov ah,9
    lea dx,msg_3
    int 21h 
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h  
main endp

end main  
--------------
EVEN ODD NUMBER
-------------

;Structure Of Assembly language 
ORG 100H
.model small 
.data      
;extra variable declar

msg_1 db "Enter Your Number:$"
msg_2 db "ODD NUMBER$"
msg_3 db "EVEN NUMBER$"
     

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9;string print
    lea dx,msg_1
    int 21h 
    
    
    ;input
    mov ah,1
    int 21h
    mov bl,al
    
    ;newline
    mov ah,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    
    ;compare
    
    and bl,1
    jnz Odd
    
    even:
    mov ah,9
    lea dx,msg_3
    int 21h
    jmp exit
    
    
    Odd:
    mov ah,9
    lea dx,msg_2
    int 21h
    

    exit:
    mov ah,4ch
    int 21h  
main endp

end main  
