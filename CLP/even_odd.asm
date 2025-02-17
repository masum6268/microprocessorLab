
org 100h
.model small
.data
num db 10 ; To store the user's input

msg db "Enter a number: $"
msg_odd db "Number is odd$"
msg_even db "Number is even$"
nl db 0dh,0ah,"$"

show MACRO msg
     mov ah, 9
     lea dx, msg
     int 21h   
ENDM
.code
main proc
 mov ax, @data
 mov ds, ax

 ; Display message for user input
   show msg

 ; Input for the number
 mov ah, 1
 int 21h

 mul num
 mov bl,al

 mov ah,1
 int 21h 
 add bl,al 
 
 call even_odd
 ret
    

 done:
   ; Your program continues here 
   mov ah,4ch
   int 21h

main endp

 even_odd proc
     ; Check if the number is even or odd
 and bl, 1 ; alternative function for and is (test)
 
 ;newline
 mov ah,9
 lea dx,nl
 int 21h
         
         
 jz even   
 odd:
    show msg_odd
   ;jmp done 
   ret

 even:
   show msg_even
   ret
even_odd endp


end main
