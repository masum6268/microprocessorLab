org 100h
.model small
.stack 100h
.data
; variable declearation
n db 0 
k db 0 
msg_1 db "Enter 1st Num: $"
msg_2 db "Enter 2nd Num: $"
msg_3 db "Addition is: $"
msg_4 db "Subtruction is: $"
msg_5 db "Multipliction is: $"
msg_6 db "Division is: $" 
msg_7 db "Reminder is: $"
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
    show msg_1
    input
    mov n,al    
    show newline    
    show msg_2
    ;input  
    input
    mov k,al    
    ;newline 
    show newline    
    show msg_3     
    ;Addition 
    mov al,n 
    add al,k
    mov sum,al   
    output sum
        
    show newline    
    show msg_4     
    ;Sub 
    mov al,n 
    sub al,k
    mov minus,al    
    output minus   
    ;newline 
    show newline   
    show msg_5     
    ;multiplication 
    mov al,n 
    mul k
    mov multiplication,al    
    output multiplication
        
    show newline    
    show msg_6     
    ;Division
    mov ah,0 
    mov al,n;3 
    div k  ;al=3/2=1 rem=1 
    mov division,al 
    
    ;reminder ta motuto ah    
    mov rem,ah    
    output division
    
    ;reminder
    show newline
    show msg_7   
    output rem

main endp
; function
exit:
 mov ah,4ch
 int 21h
end main