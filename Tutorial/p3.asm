org 100h
.model small
.stack 100h
.data
; variable declearation
n db 0 
k db 0 
msg_1 db "Enter Character: $"
msg_2 db "Alphabet Order: $"
msg_3 db "Reversly Alphabet Order: $"
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
      ;sub al,'0'
endm

space macro
      mov ah,2
      mov dl,' '
      int 21h
endm 

output macro value
      mov ah,2
      mov dl,value
      ;add dl,48
      int 21h
endm

.code

main proc  
;code here
mov ax,@data
mov ds,ax     
    show msg_1
    input
    mov n,al
    mov bl,al
    space     
    ;show newline    
    ;show msg_2
    ;input  
    input
    mov k,al
    mov bh,al
    
    cmp bl,bh
    ja order
    
    show newline
    show msg_3 
    output k
    space 
    output n
    
    show newline
    show msg_2 
    output n
    space 
    output k
    ret     
      
    order:
    show newline
    show msg_3 
    output n
    space 
    output k
          
    show newline
    show msg_2 
    output k
    space 
    output n
    
   
    
      
 
   


main endp
; function
exit:
 mov ah,4ch
 int 21h
end main