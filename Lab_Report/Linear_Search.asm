; include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
      arr     db  10,15,7,8,9,13,5,2
      len     equ $-arr
      search  db  11
      newline db  10,13,'$'
      msg_1 db "Value finded!$"
      msg_2 db "Value not finded!$"

show macro m
                   mov ah,9
                   lea dx,m
                   int 21h
endm
.code
main proc
                mov  ax,@data
                mov  ds,ax
                mov  cx,len
                mov  si,offset arr
      findvalue:
                mov  al,[si]
                cmp  al,search
                je   found
                inc  si
                loop findvalue


      notfound: 
      ;    printn 'Value not finded!'
                show newline
                show msg_2
                jmp  exit

      found:    
      ;    printn 'Value finded!'
                show msg_1
                jmp  exit

      exit:     
                mov  ah,4ch
                int  21h
main endp
end main      