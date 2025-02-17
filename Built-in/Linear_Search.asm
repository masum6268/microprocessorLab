include 'emu8086.inc'

org 100h
.model small
.stack 100h
.data
arr db 10,7,8,5,2,5,3
size equ $-arr
search db 5


.code
main proc 
      mov ax,@data
      mov ds,ax

      call Linear

Exit:
      mov ah,4ch
      int 21h
main endp
        
        Linear proc 
        lea si,arr
        mov cx,size
        check:
        mov bl,[si]
        cmp bl,search
        je find
        inc si
        Loop check

        notfind:
        printn 
        print 'Number not find!!'
        ret

        find:
        printn
        print 'Number is found!'
        ret
        Linear endp

define_scan_num
define_print_num_uns
define_print_num
end main