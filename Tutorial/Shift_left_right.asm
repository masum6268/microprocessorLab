include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
result dw ?
input dw ?
size dw ?

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Binary to Decimal conversion
    printn 'enter your input:'
    call scan_num
    mov input,cx
    
    printn 
    shl input,2
    printn 'value:'
    mov ax,input
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
