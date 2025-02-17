include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
result dw ?
A db 17 dup(?)
size dw ?
c dw 0

input macro
    lea si,A
    mov cx,size
    read:
    mov ah,1
    mov [si],al
    int 21h
    inc si
    Loop read
    
endm

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Binary to Decimal conversion
    printn 'Enter the size of Number:'
    call scan_num
    mov size,cx 
    printn
    input
    
    printn

    
    mov cx,size
    lea si,A
    add si,size;
    mov bx,1 
    printn    
convert_loop: 
    mov al,[si]
    cmp al,48
    je find 
    add result,bx ;resutl=2+8=10 
      
    find:
    shl bx, 1                 ; Shift the multiplier to the left (multiply by 2)
    dec si
    sub cx,1                    ; Move to the next binary digit
    jnz convert_loop          ; Repeat for all bits
    
    ; Result is now in AX   
    printn
    print 'Decimal number:' 
    mov ax,result
    call print_num_uns 
    
    

exit:
    mov ah, 4ch
    int 21h

main endp
          
define_print_num_uns 
define_print_string
define_get_string
define_scan_num
end main
