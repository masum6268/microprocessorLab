ORG 100h    ; Origin at 100h (standard for DOS programs)
.model small
.stack 100h
.data
msg_1 db "Enter Value:$"
NDNA DB "The character is neither a digit nor an alphabet.", '$'
DigitMsg DB "The character is a digit.", '$'
AlphabetMsg DB "The character is an alphabet.", '$'
nl db 0Dh,0Ah,"$"

.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg_1
int 21h

mov ah, 1 ; Function to read a character from standard input
int 21h     ; Call DOS interrupt to read a character

mov bl, al  ; Copy the character to BL for comparison

mov ah, 9
lea dx, nl
int 21h 

; Check if the character is a special character
CMP BL, '&'  ; Compare with ASCII code for '&'
JE SpecialCharacter ; If it's '&', handle it as a special character
CMP BL, '.'  ; Compare with ASCII code for '.'
JE SpecialCharacter ; If it's '.', handle it as a special character 
CMP BL, ','  
JE SpecialCharacter
CMP BL, ';'  
JE SpecialCharacter
CMP BL, ':','#'  
JE SpecialCharacter
CMP BL, ','  
JE SpecialCharacter
cmp bl,'%'
JE SpecialCharacter    



; Check if the character is a digit (ASCII code 48-57)
cmp bl, 48  ; Compare with ASCII code for '0'
jb NotDigit ; If less than 48, it's not a digit
cmp bl, 57  ; Compare with ASCII code for '9'
ja NotDigit ; If greater than 57, it's not a digit

; Check if the character is an alphabet (A-Z or a-z)
cmp bl, 'A'
jb NotAlphabet
cmp bl, 'Z'
ja CheckLowerCase
; The character is an uppercase alphabet

; Check for lowercase alphabet
CheckLowerCase:
cmp bl, 'a'
jb NotAlphabet
cmp bl, 'z'
ja NotAlphabet
; The character is a lowercase alphabet

; If we reach this point, it's neither a digit nor an alphabet
SpecialCharacter:
mov ah, 9 ; Function to print a message
lea dx, NDNA ; Load the message address
int 21h     ; Call DOS interrupt to display the message
ret

; If it's an alphabet
NotDigit:
mov ah, 9 ; Function to print a message
lea dx, AlphabetMsg ; Load the message address
int 21h     ; Call DOS interrupt to display the message
ret

; If it's a digit
NotAlphabet:
mov ah, 9 ; Function to print a message
lea dx, DigitMsg ; Load the message address
int 21h     ; Call DOS interrupt to display the message

main endp
end main
---------------------
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
