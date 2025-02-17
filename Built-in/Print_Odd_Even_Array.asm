include 'emu8086.inc'

org 100h
.model small
.stack 100h
.data

oddsum dw ?
evensum dw ?

array db 10 dup(?)

OddArray db 10 dup(?)
EvenArray db 10 dup(?)

;len equ $-array
size dw ?

input macro
    
    mov cx,size
    lea si,array
    User:
    mov ah,1
    int 21h
    sub al,'0'
    mov [si],al
    space 
    inc si
    Loop User
endm

space macro
    mov ah,2
    mov dl," "
    int 21h
endm

printArr macro m
    mov ah,2
    mov dl,m
    add dl,48
    int 21h
endm    

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    printn 
    print 'Enter size:'
    call scan_num
    mov size,cx
    printn
    
    input  
    
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
    
    print 'Odd Array is:'
    mov cx,size 
    lea si,OddArray
    printOdd:
    cmp [si],0
    je exit
    printArr [si]
    space
    inc si
    Loop printOdd
    
    
    
    
    
    
    

exit:
    mov ah,4ch
    int 21h
main endp
    
    SumOddEven proc
     
     mov cx,size
     lea si,array 
     lea di,OddArray
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
     mov [di],bl
     inc di
     add oddsum,bx
     jmp next
     
     next:
     inc si
     Loop Find
     
     ret
    SumOddEven endp    

define_print_num_uns
define_scan_num

end main