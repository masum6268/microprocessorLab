include 'emu8086.inc'
org 100h
.model small
.stack
.data
a dw ?
b dw ?
c dw ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    printn 
    print 'Enter Reading:'
    call scan_num
    mov a,cx
    printn
        
        
    mov cx,a
    cmp cx,7
    jge step1
    cmp cx,5
    jl step2
    cmp cx,5
    jge step3
    cmp cx,7
    jb step3
    
    step1:
    print
    printn 'Increase heat'
    jmp exit
    
    step3:
    print
    printn 'Wait for 5 min then Increase heat'
    jmp exit
    
    
    step2:
    print
    printn 'Dicard Substance'
    jmp exit 
    
exit:
    mov ah,4ch
    int 21h
main endp
define_scan_num
end main