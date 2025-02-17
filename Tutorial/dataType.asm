org 100h
.model small
.stack 100h
.data
; variable declearation
n dw 0 ;int a
k db 10
.code

main proc  
;code here

mov n,k ;n=k




main endp
; function
exit:
 mov ah,4ch
 int 21h
end main