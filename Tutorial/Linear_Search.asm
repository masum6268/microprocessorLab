org 100h
.model small
.stack 100h
.data
      arr     db  10,7,13,4,2,1,9,8,3,6
      len     equ $-arr                      ;this is use for find the length of array
      newline db  10,13,'$'
      msg_1   db  "Finded value!$"
      msg_2   db  "Not Finded value!$"
      search  db  15                         ;search value

show macro m
                   mov ah,9
                   lea dx,m
                   int 21h
endm
.code
; And print the message not finded value because search value is 15 which is not in array
main proc
                    mov  ax,@data
                    mov  ds,ax

                    mov  cx,len             ;mov len to counter variable
                    mov  si,offset arr

      Linear_Search:
                    mov  al,[si]
                    cmp  al,search          ;check equal or not
                    je   found
                    inc  si
                    loop  Linear_Search

      notfound:     
                    show msg_2              ;display not found message
                    jmp  exit
      
      found:
      show newline
      show msg_1              ;display found message
      jmp exit


      exit:         
                    mov  ah,4ch
                    int  21h
main endp
end main