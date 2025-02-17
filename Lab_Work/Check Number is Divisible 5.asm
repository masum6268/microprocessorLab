org 100h
.model small
.stack 100h
.data
num db 0 ; To store the user's input

msg db "Enter a number: $"
msg_divisible db "The number is divisible by 5$"
msg_not_divisible db "The number is not divisible by 5$"
nl db 0dh,0ah,"$"

.code
main proc
 mov ax, @data
 mov ds, ax

 ; Display message for user input
 mov ah, 9
 lea dx, msg
 int 21h

 ; Input for the number
 mov ah, 1
 mov dx, 0 ; Clear DX to read a two-digit number
 int 21h
 sub al, '0' ; Convert ASCII digit to binary
 mov num, al ; Store the user's input in 'num'
 
 
 

 ; Check if the number is divisible by 5
 and al, 3Fh ; Clear the high 2 bits (in case of ASCII input)
 cmp al, 5
 je divisible
 jne not_divisible
 


 divisible: 
    mov ah,9
   lea dx,nl
   int 21h 
   
   mov ah, 9
   lea dx, msg_divisible
   int 21h
   jmp done

 not_divisible:
  mov ah,9
  lea dx,nl
  int 21h
  
   mov ah, 9
   lea dx, msg_not_divisible
   int 21h

 done:
   ; Your program continues here

main endp
end main

----------------
include 'emu8086.inc'
org 100h
.model small
.data
n db ?
m db ?
k db 5

.code

main proc
    mov ax,@data
    mov ds,ax
    
    printn
    print 'Enter Your Num:'
    
    ;input
    mov ah,1
    int 21h 
    sub al,'0'
    mov n,al
    
    ;check divisible or not
    mov ah,0
    mov al,n
    ;mov bl,k 
    ;div bl 
    div k
    mov m,ah 

    cmp m,0
    je Divisible
    
    
    printn
     mov ah,2
    mov dl,n 
    add dl,48
    int 21h
    print ' Number is not Divisible by 5!'
    jmp exit
    
    Divisible:
    printn
    mov ah,2
    mov dl,n
    add dl,48
    int 21h
    print ' Number is Divisible by 5!'
    
    main endp

exit:
    mov ah,4ch
    int 21h
end main    
