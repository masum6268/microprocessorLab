.model SMALL
.stack 100h
.DATA
msg db "Enter your Num:$"
sum db ?
nl 10,13,'$'
.Code
MOV ax,@DATA
MOV ds,ax

mov ah,9
lea dx,msg
int 21H

;new line
mov ah,9
lea dx,nl
int 21H

;sum=n*(n+1)/2
mov ah,1
int 21H
sub al,48
mov n,al
add al,1
aam
mul n
mov bl,2
aam
div bl
mov sum,al

;new line
mov ah,9
lea dx,nl
int 21H

mov ah,2
mov dl,sum
int 21H

mov ah,4CH
int 21H

main ENDP
end main

