org 100h
.model small
.stack 100h
.data
; variable declearation
n db 0 
k db 0 
msg_1 db "Even Number $"
msg_2 db "Odd Number $"

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
      mov bl,2;5/2=2 rem=1
      
      div bl;al=al/bl
      mov k,ah
      
      show newline
      ; Compare n,k
      mov bl,n 
      ;and bl,1 / test bl,1
      cmp k,0
      je even
      show msg_2
      output n
      ret
      even:
      show msg_1
      output n
      ret
 

main endp
; function
exit:
 mov ah,4ch
 int 21h
end main