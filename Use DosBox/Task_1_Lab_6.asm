include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
nl db 10,13,"$"
arr db 5 dum(?)
.code

main proc;description 
    mov ax,@data
    mov ds,ax
main endp
     input proc
     mov si,offset arr

     print "Enter Array Values:"
     xor cx,cx
     mov cx,5
     inp:
     mov ah,1
     int 21h
     mov [si],al
     inc si
     Loop inp

     call Average
     call Largest
     call Smallest
     ret

sum proc
      mov ah,9
      lea dx,nl
      int 21h
      print "Result is:"
      add bh,bl
      sub bh,48
      ;output
      mov ah,2
      mov dl,bh
      int 21h
sum endp

end main