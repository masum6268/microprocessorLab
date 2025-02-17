org 100h
.model small
.stack 100h
.data
; variable declearation
n db 0 
k db 0 
msg_1 db "n is Greater than k $"
msg_2 db "k is greater than n $"

sum db ?
minus db ?
multiplication db ?
division db ?
rem db ? 
newline db 10,13,"$"

; macro define here
show macro m
    mov ah,9
    lea dx,m
    int 21h  
endm

input macro
      mov ah,1
      int 21h
      sub al,'0'
endm

space macro
      mov ah,2
      mov dl,' '
      int 21h
endm 

output macro value
      mov ah,2
      mov dl,value
      add dl,48
      int 21h
endm

.code

main proc  
;code here
mov ax,@data
mov ds,ax    
      input 
      mov n,al
      space 
      input
      mov k,al
      show newline
      ; Compare n,k
      mov bl,n 
      cmp bl,k
      jg max
      show msg_2
      ret
      max:
      show msg_1
      ret
 

main endp
; function
exit:
 mov ah,4ch
 int 21h
end main