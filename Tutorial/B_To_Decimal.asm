include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
result dw ?
A dw ?
temp dw ?
rem dw ?
last_digit dw ? 
b dw 10 
base dw 1

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Binary to Decimal conversion
    printn 'enter your Binary:'
    call scan_num
    mov A,cx 
    
    printn
    mov ax,A
    convert:
    div b
    mov last_digit,dx
    mov temp,ax
    mov ax,last_digit
    mul base
    add result,ax
    shl base,1
    mov ax,temp
    
    cmp temp,0
    je p
    jmp convert 
    
    
    p: 
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
