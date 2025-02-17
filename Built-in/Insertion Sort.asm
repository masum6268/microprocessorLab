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
    call Insertion
    
    
exit:
    mov ah, 4ch
    int 21h
main endp

    Insertion proc
       
        mov cx, size
    mov si, 1 
    
outer_loop:
    cmp si, cx
    jge finished 
    
    mov al, [Array + si] 
    mov di, si
    
inner_loop:
    cmp di, 0 
    jle next_iteration
    
    mov bl, [Array + di - 1] 
    
    cmp bl, al 
    jle next_iteration n
    
    
    mov [Array + di], bl
    dec di
    jmp inner_loop
    
next_iteration:
    mov [Array + di], al 
    inc si 
    jmp outer_loop
    
finished:
    printn
    print 'Sorted Array is:'
    
    printArr
    
    ret 
    Insertion endp

define_print_num_uns    
    
end main