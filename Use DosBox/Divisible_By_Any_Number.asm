org 100h
.model small
.stack 100h
.data
num dw 0 ; To store the user's input

msg db "Enter a 2-digit number: $"
msg_divisible db "The number is divisible by 5$"
msg_not_divisible db "The number is not divisible by 5$"
nl db 0dh, 0ah, "$"

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
 int 21h
 mov bl,10
 mul bl
 mov num, ax

 ; Input for the second digit
 mov ah, 1
 int 21h
 add ax,num ; Combine the two digits

 
 ;newline
 mov ah, 9
 lea dx, nl
 int 21h

 ; Check if the number is divisible by 5

mov dx, 0    ; Clear dx to prepare for division
mov bx, 5    ; Set bx to 5 (the divisor)
div bx       ; Divide ax by 5, quotient in ax, remainder in dx
cmp dx, 0    ; Check if the remainder is 0
je divisible ; Jump if equal (i.e., it's divisible)
jne not_divisible

 divisible:
   mov ah, 9
   lea dx, msg_divisible
   int 21h
   jmp done

 not_divisible:
   mov ah, 9
   lea dx, msg_not_divisible
   int 21h

 done:
   ; Your program continues here

main endp
end main
