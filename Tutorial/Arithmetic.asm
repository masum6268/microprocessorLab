org 100h
.model small
.stack 100h
.data
; variable declearation
n db 0 ;int a
k db 10
sum db ?
minus db ?
multiplication db ?
division db ?
.code

main proc  
;code here
mov ax,@data
mov ds,ax
i. addition
ii. Subtruction
iii.multiplication
iv. divition

; Various Arithmetic 
      mov al,10
      mov bl,5
      ;addition
      add al,bl;al=al+bl
      mov sum,al
      ; subtruction
      sub al,bl;al=al-bl
      mov minus,al
      ; multiplication
      mul bl ;al=al*bl
      mov multiplication,al
      ; Division
      div bl;al=al/bl
      mov division,al
      



main endp
; function
exit:
 mov ah,4ch
 int 21h
end main