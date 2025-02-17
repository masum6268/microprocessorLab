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
.code

main proc  
;code here
mov ax,@data
mov ds,ax
    
    mov ah,9
    lea dx,msg_1
    int 21h    
    
    ;input 1st
    mov ah,1
    int 21h
    sub al,'0'
    mov n,al
    
    mov ah,9
    lea dx,newline
    int 21h 
    
    mov ah,9
    lea dx,msg_2
    int 21h
    ;input  
    mov ah,1
    int 21h
    sub al,'0'
    mov k,al
    
    ;newline 
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,msg_3
    int 21h
     
    ;Addition 
    mov al,n 
    add al,k
    mov sum,al
    
    mov ah,2
    mov dl,sum
    add dl,48
    int 21h
    
    
     mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,msg_4
    int 21h
     
    ;Sub 
    mov al,n 
    sub al,k
    mov minus,al
    
    mov ah,2
    mov dl,minus
    add dl,48
    int 21h
    
    
    ;newline 
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,msg_5
    int 21h
     
    ;multiplication 
    mov al,n 
    mul k
    mov multiplication,al
    
    mov ah,2
    mov dl,multiplication
    add dl,48
    int 21h
    
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,msg_6
    int 21h
     
    ;Division
    mov ah,0 
    mov al,n;3 
    div k  ;al=3/2=1 rem=1 
    mov division,al 
    
    ;reminder ta motuto ah
    
    mov rem,ah
    
    
    mov ah,2
    mov dl,division
    add dl,48
    int 21h
    
    ;reminder
    mov ah,9
    lea dx,newline
    int 21h
    
    lea dx,msg_7
    int 21h
    
    mov ah,2
    mov dl,rem
    add dl,48
    int 21h
    


main endp
; function
exit:
 mov ah,4ch
 int 21h
end main