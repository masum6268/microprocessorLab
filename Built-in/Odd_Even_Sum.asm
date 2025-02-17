include 'emu8086.inc'

org 100h
.model small
.stack 100h
.data

oddsum dw ?
evensum dw ?

array db 10,11,5,8,3,7,9

len equ $-array

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    printn 
    print 'Size of the array:'
    mov ax,len
    call print_num_uns
    printn 
    
    call SumOddEven
    
    printn  
    print 'Even Sum:'
    mov ax,evensum
    call print_num_uns
    printn
    
    print 'Odd Sum:'
    mov ax,oddsum
    call print_num_uns
    printn
    
    
    

exit:
    mov ah,4ch
    int 21h
main endp
    
    SumOddEven proc
     
     mov cx,len
     lea si,array
     Find:
     mov bl,[si]
     and bl,1
     jnz OddNum
     
     
     EvenNum:
     mov bh,0
     mov bl,[si]
     add evensum,bx
     jmp next
     
     OddNum:
     mov bh,0
     mov bl,[si]
     add oddsum,bx
     jmp next
     
     next:
     inc si
     Loop Find
     
     ret
    SumOddEven endp    

define_print_num_uns

end main