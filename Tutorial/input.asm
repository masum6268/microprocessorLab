org 100h
.model small
.stack 100h
.data
; variable declearation
n dw 0 ;int a
.code

main proc  
;code here

; input
 mov ah,01 ;scanf function er moto kaj kore
 int 21h ;terminal ana
 ;input ta muloto al=store
 ;sub al,48
 sub al,'0' 
 ; char a='5'
 ;decimal ='5'-'0'


mov dl,al ;dl=al
add dl,48
mov ah,02 ;show output/printf
int 21h ;terminal call
main endp
; function
exit:
 mov ah,4ch
 int 21h
end main