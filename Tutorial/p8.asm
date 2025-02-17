org 100h
.model small
.stack 100h
.data
; variable declearation
m db 0
n db 0 
k db 0 
msg_1 db "Enter Your Num:$"
msg_2 db "Double digit print and input$"

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
      show msg_1
      input 
      mov m,al
      mov bl,10
      mul bl
      mov n,al
      input 
      add al,n;al=al+n
      mov k,al
;  14=1*10+4*1=14 
      output k

main endp
; function
exit:
 mov ah,4ch
 int 21h
end main