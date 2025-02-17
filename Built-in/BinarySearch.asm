include 'emu8086.inc'

org 100h
.model small
.stack 100h
.data
arr db 15,25,35,45,55
size equ $-arr
search db 45 
index dw 0


.code
main proc 
      mov ax,@data
      mov ds,ax

      call BinarySearch

Exit:
      mov ah,4ch
      int 21h 
      
main endp
        
        BinarySearch proc
            
         mov cx,0 
         mov dx,size
  
       Binary:
       cmp cx,dx 
       jg notfound 
       mov si,cx 
       add si,dx 
       shr si,1 
       
       
       mov al,arr[si]
       mov index,si
        
       cmp al,search 
       je found 
       jl update_low
       jg update_high
    
       update_low:
       inc si
       mov cx,si
       jmp Binary 
    
       update_high:
       dec si
       mov dx,si
       jmp Binary

        notfound:
        printn 
        print 'Number not find!!'
       
        ret

        found:
        printn
        print 'Artifact Fount at Index:'
        
        mov ax,index
        call print_num_uns
        ret
        BinarySearch endp

define_scan_num
define_print_num_uns
define_print_num
end main