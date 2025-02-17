.model small
.stack 100h
.data
a db ?
b db ?
c db ?
ans dw ?
nl db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,1
    int 21h
    ;sub al,48
    mov a,al
    
    mov ah,1
    int 21h
    ;sub al,48
    mul a
    mov b,al
    
    aam 
    
    add al,48
    add ah,48
    mov bl,al
    mov bh,ah
    
    lea dx,nl
    mov ah,9
    int 21h
    
    mov ah,2
    int 21h
    mov dl,bh
    
    mov ah,2
    int 21h
    mov dl,bl
     

  
    
main endp
end main
