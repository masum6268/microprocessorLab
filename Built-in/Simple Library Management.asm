include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data

m dw 20
A db 11 dup(?)
final dw ?


.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,m
    Find:
    ;initialize book 
    printN
    print 'The Number of Books in the Library:'
    
    call print_num_uns
    printn  
    
    print 'How many books do you want to check out:'
    call scan_num
    sub ax,cx
    printn
    
    print 'How many books do you want to return:'
    call scan_num
    add ax,cx
    mov final,ax
    printn
    
    printn 'Do you want to continue?[Y/N]'
    
    lea di,A
    mov dx,10
    call get_string
    
    mov bl,A[0]
    cmp bl,'Y'
    jne next
    jmp Find
    
    next:
    printn
    print 'Final Total Book in the Library is:'
    mov ax,final
    call print_num_uns
    
exit:
    mov ah,4ch
    int 21h
    
main endp

define_scan_num
define_print_num_uns
define_get_string

end main
    
    
    