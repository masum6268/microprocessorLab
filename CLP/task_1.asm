org 100h
.model small
.stack 100h
.data
msg_1 db 10, 13, "Enter Your Char:$"
msg_2 db 10, 13, "Vowel:$"
msg_3 db 10, 13, "Consonant:$"
msg_4 db 10, 13, "Invalid Input! Only characters allowed.$"
msg_5 db 10, 13, "Enter a number to exit.$"
nl db 10,13,"$"

show MACRO msg
     mov ah, 9
     lea dx, msg
     int 21h   
ENDM

input MACRO 
      mov ah, 1
      int 21h  
ENDM

output_vowel macro char
    
     show msg_2
     mov ah,2
     mov dl,bl
     int 21h
endm 

output_consonant macro char
     show msg_3
     mov ah,2
     mov dl,bl
     int 21h
endm

check_vowel macro char
     cmp al, 'A'
     je vowel_found
     cmp al, 'E'
     je vowel_found
     cmp al, 'I'
     je vowel_found
     cmp al, 'O'
     je vowel_found
     cmp al, 'U'
     je vowel_found
     cmp al, 'a'
     je vowel_found
     cmp al, 'e'
     je vowel_found
     cmp al, 'i'
     je vowel_found
     cmp al, 'o'
     je vowel_found
     cmp al, 'u'
     je vowel_found
     cmp al, 'y'
     je vowel_found
     cmp al, 'Y'
     je vowel_found
 endm   
    

.code
main proc 
     mov ax, @data
     mov ds, ax 

main_loop:
     ; show input message
     show msg_1
     input

     ; check if input is a character or not
     cmp al, 'A'
     jl not_alpha
     cmp al, 'Z'
     jle vowel
     cmp al, 'a'
     jl not_alpha
     cmp al, 'z'
     jle vowel
 

not_alpha:
     ; invalid input, show error message
     show msg_4 
     jmp main_loop

vowel:
     ; check if the input is a vowel
     mov bl,al
     check_vowel al  ;call check_vowel

     ; consonant
     output_consonant bl ;call consonant
     jmp main_loop

vowel_found:
     ; vowel
      output_vowel bl ;call vowel
     jmp main_loop
      

exit:
     ; show exit message
     show msg_5
     mov ah, 4ch
     int 21h

main endp
end main
