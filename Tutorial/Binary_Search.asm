org 100h
.model small
.stack 100h
.data
      arr     db  1,2,3,4,5,6,7,8,9,10
      len     equ $-arr                      ;this is use for find the length of array
      newline db  10,13,'$'
      msg_1   db  "Finded value!$"
      msg_2   db  "Not Finded value!$"
      search  db  15                        ;search value
; This time msg print value not find because Binary_Search work only sort array
show macro m
      mov ah,9
      lea dx,m
      int 21h
endm
.code
main proc
      mov ax,@data
      mov ds,ax

      ;First of all,we need to find the mid value of the array
      mov cx,0;start index of the array
      mov dx,len;end index of the array

      Binary_Search:
      cmp cx,dx ;compare start index and end index
      jg notfound ;if cx is greater than dx then we need to go to notfound
      mov si,cx
      add si,dx ;add start index and end index and mov si
      shr si,1 ;divide by 2 find the mid index

      ; now compare with mid value and index value
      mov al,arr[si]
      cmp al,search
      je found ;if equal then we need to go to found
      jl update_low
      jg update_high

      ; update low index
      update_low:
      inc si
      mov cx,si
      jmp Binary_Search

      ;update high index           
      update_high:
      dec si
      mov dx,si
      jmp Binary_Search           

      notfound:
      show msg_2
      jmp exit ;if cx is greater than dx then we need to go to exit

      found:
      show newline
      show msg_1
      jmp exit

      exit:
      mov ah,4ch
      int 21h
main endp
end main