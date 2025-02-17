.model small
.stack 100h
.data
msg db 0dh,0ah, "Enter your num:$"
msg_2 db 0dh,0ah, "Enter Divident:$"
msg_3 db 0dh,0ah, "Output:$"
nl db 0dh,0ah,"$"
a db 0
b dw 0
c dw 0
d dw 0
n db 0
m dw 0

.code
main proc
    
  mov ax,@data
  mov ds,ax
           
  mov ah,9
  lea dx,msg
  int 21h
  
  mov ah,1
  int 21h
  sub ax,'0'
  mov bx,10
  mul bx
  mov b,ax
  
  mov ah,1
  int 21h
  sub ax,'0'
  add ax,b
  mov d,ax
  
  mov ah,9
  lea dx,msg_2
  int 21h
  
  mov ah,1
  int 21h
  sub al,'0'
  mov c,ax 
  
  mov ax,d
  div c
  
  ;reminder and result
  mov n,dl
  mov m,ax 
  
  
  mov ah,9
  lea dx,nl
  int 21h
  
  mov ah,2
  mov dl,n 
  add dl,'0'
  int 21h 
  
  
  mov ah,9
  lea dx,msg_3
  int 21h
  
  mov ah,2
  mov dx,m
  add dx,'0'
  int 21h

  mov ah,4ch
  int 21h

    main endp
end main