include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data

w dw 3
d dw 1
l dw 0
a dw ?
b dw ?
c dw ?

Points dw ?

space macro 
    mov ah,2
    mov dl," "
    int 21h
endm

.code
main proc
      mov ax,@data
      mov ds,ax
      
      ;input user values;
      printn
      ;print 'Enter Your Number:'
      call scan_num
      mov a,cx
      printn
      
      call scan_num
      mov b,cx
      printn
      
      call scan_num
      mov c,cx
      printn
      
      printn
      
      call FindTotal
      
      printn
      print 'Total Points:'
      mov ax,Points
      call print_num_uns
      
      
      
exit:
      mov ah,4ch
      int 21h
main endp       
        FindTotal proc        
         
         mov ax,a
         mov bx,w
         mul bx
         
         ;wining point store
         mov Points,ax
         mov ax,b
         add Points,ax
               
         ret 
        FindTotal endm   
;All procedure define here
define_scan_num
define_print_num_uns
end main