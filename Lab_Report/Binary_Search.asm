; include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
arr db 10,15,25,30,40,50,60,70,80,90
len equ $-arr
search db 13 
newline db 10,13,'$'
msg_1 db "Value finded!$"
msg_2 db "Value not finded!$"

show macro m
                   mov ah,9
                   lea dx,m
                   int 21h
endm
.code
main proc
   mov ax,@data
   mov ds,ax
    
   mov cx,0 ;initial index/start index
   mov dx,len ;final index
  
   BinarySearch:
   cmp cx,dx ;if final index cross initial index then value not found
   jg notfound ;jump to notfound label
   mov si,cx ;store initial index in si
   add si,dx ;add final index to si
   shr si,1 ;divide by 2
   
   ;5,10,20,30,40,50
   ;search=5
   mov al,arr[si] ;store value at si in al
   cmp al,search ;compare value at si with search value
   je found ;jump to found label
   jl update_low
   jg update_high

   update_low:
   inc si
   mov cx,si
   jmp BinarySearch ;jump to BinarySearch label

   update_high:
   dec si
   mov dx,si
   jmp BinarySearch ;jump to BinarySearch label

   notfound:
;    printn 'Value not finded!'
      show msg_2
   jmp exit

   found:
;    printn 'Value finded!'
      show newline
      show msg_1
   jmp exit

exit:
      mov ah,4ch
      int 21h 
main endp
end main      