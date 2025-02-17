include 'emu8086.inc'
.model SMALL
.stack 100h
.DATA
msg db "Enter your Num:$"
i db 1
n dw ?
sum dw ?
m dw ?
nl db 10,13,'$'
k dw ?
.Code 
main proc
MOV ax,@DATA
MOV ds,ax

 ;Using Loop
 print 'Enter the First Digit of The Series:'
 mov ah,1
 int 21h
 sub ax,48
 mov ah,0
 mov m,ax 
 
 ;newline
  mov ah,9
  lea dx,nl
  int 21h
  
  ;Enter how many loops going
  print 'Terms of item in the seris:'
  
  mov ah,1
  int 21h
  sub ax,48
  mov ah,0
  mov cx,ax

 xor ax,ax          
 mov bx,m
 ;mov cx,50
 mov n,cx
 
 SumOfOdd:
  add ax,bx
  inc bx
  inc bx
  ;inc bx ;Find Any series Just Change here increment and decrement
  Loop SumOfOdd  
  mov sum,ax

mov ah,4CH
int 21H
main endp
end main

