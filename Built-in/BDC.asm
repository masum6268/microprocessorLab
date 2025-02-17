include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
result dw ?
A db 17 dup(?)
size dw ?

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Binary to Decimal conversion
    printn 'enter your A:'
    mov dx,17
    lea di,A
    call get_string
    
    
    printn 
    print 'A:'
    lea si,A
    call print_string 
    
    
    printn
    
    ;find the length of the A value
    
    mov si,0
    Length:
    cmp [A+si],0 
    je convert
    inc si 
    mov size,si
    jmp Length 

   
    convert:
    printn
    print 'Length:'
    mov ax,size
    call print_num_uns
    
    mov cx,size
    lea si,A
    add si,size;
    mov bx,1 
    printn
   ; xor ax,ax    
convert_loop: 
    mov al,[si]
    cmp al,48
    je find 
    
    notfind:
    add result,bx ;resutl=2+8=10  
    shl bx, 1 
    find:
                     ; Shift the multiplier to the left (multiply by 2)
    dec si                     ; Move to the next binary digit
    loop convert_loop          ; Repeat for all bits
    
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
