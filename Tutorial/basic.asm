org 100h
.model small
.stack 100h
.data
; variable declearation
n dw 0 ;int a=10

.code

main proc  
;code here

; input
 mov ah,01 ;scanf function er moto kaj kore
 int 21h
 sub al,48 

;  input value store in al register

;dl er valui tai mainly print hoy
mov dl,al
add dl,48
mov ah,02 ;show output/printf
int 21h ;terminal call
main endp
; function
exit:
 mov ah,4ch
 int 21h
end main