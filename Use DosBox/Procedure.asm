include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
nl db 10,13,"$"

.code

main proc;description 
    mov ax,@data
    mov ds,ax
 print "Enter two number:"
main endp
     input proc
     mov ah,1
     int 21h
     mov bl,al

     mov ah,1
     int 21h
     mov bh,al

     call sum
     ret

sum PROC
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
sum ENDP

end main