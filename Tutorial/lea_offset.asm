org 100h
.model small
.stack 100h
.data
; variable declearation
msg db "enter a number:$"
msg_2 db 10,13,"output is:$"
n db 0 ;int a 
newline db 10,13,"$"
.code

main proc  
mov ax,@data
mov ds,ax
;   lea/offset 

    
 
    mov ah,9 ;printf function
    mov dx,offset msg
    int 21h
    

    ; input
     mov ah,01 ;scanf function er moto kaj kore
     int 21h
     sub al,48 
     mov n,al

    mov ah,9 ;printf function
    lea dx,msg_2
    int 21h
    mov dl,n
    add dl,48
    mov ah,02 ;show output/printf
    int 21h ;terminal call
main endp
; function
exit:
 mov ah,4ch
 int 21h
end main