include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
result dw ?
A db 16 dup(?)
size dw ?
c dw 0

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Binary to Decimal conversion
    printn 'enter your A:'
    mov dx,16
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
    ;add si,size;
    mov bx,128 
    printn    
convert_loop: 
    mov al,[si]
    cmp al,48
    je find 
    
    notfind:
    add result,bx ;resutl=2+8=10   
    find:
    shr bx, 1                 ; Shift the multiplier to the left (multiply by 2)
    inc si
    sub cx,1                    ; Move to the next binary digit
    jnz convert_loop          ; Repeat for all bits
    
    ; Result is now in AX   
    printn
    print 'Decimal number:' 
    mov ax,result
    call print_num_uns 
    
    printn
    print 'Array:'
    mov cx,size 
    lea si,A
    p:
    mov ah,2
    mov dl,[si]
    int 21h 
    inc si
    loop p 

exit:
    mov ah, 4ch
    int 21h

main endp
          
define_print_num_uns 
define_print_string
define_get_string
define_scan_num
end main
