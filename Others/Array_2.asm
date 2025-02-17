include 'emu8086.inc'

.stack 100h
.model small
.data
 arr db 10 dup(?) 
 
nl db 10,13,'$'

.code
main proc
   mov ax,@data
   mov ds,ax
     mov cx, 10 
    mov si ,0
    mov dl,48
    
    print 'Input Array:'

ini:
       mov arr[si],dl
       inc dl
       inc si
    loop ini

    mov cx, 10 
    mov si ,0
    
    mov ah,9
    lea dx,nl
    int 21h
    
    print 'Output Array:' 
print:
    mov ah,2
    mov dl,arr[si]
    int 21h
    inc si  
    
    mov ah,02
    mov dl,032
    int 21h
    
    cmp si,10
    je end_program 
    
    jmp print
    
    
    end_program:
    mov ah,4ch
    int 21h 
    
    main endp

end main
