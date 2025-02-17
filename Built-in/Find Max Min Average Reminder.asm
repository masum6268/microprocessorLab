include 'emu8086.inc'
org 100h
.model small
.data

Array db 28,45,20,70,40,10,60,33

size equ $-Array

Search dw ?
     
     

printArr macro
    
     mov si, 0
print_array:
    mov ah, 2
    mov dl, [Array + si]
    ;int 21h
    mov dh,0
    mov ax,dx
    call print_num_uns
    
    print ' '
    
    inc si
    cmp si, size
    je exit
    
    jmp print_array
endm         

.code
main proc
    mov ax, @data
    mov ds, ax
    
    printn
    call FindMaxMin 
    printn
    print 'Array is:'
    printArr
    
    
exit:
    mov ah, 4ch
    int 21h
main endp

    FindMaxMin proc
       
       
   
    
    ret 
    FindMaxMin endp

define_print_num_uns    
    
end main