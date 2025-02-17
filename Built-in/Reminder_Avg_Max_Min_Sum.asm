include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
avg dw 0
max db 0
min db 9
rem dw 0 
sum dw ?
Arr db 8,2,4,6,1,3,5,7,8
len equ $-Arr


space macro
    mov ah,2
    mov dl," "
    int 21h
endm

input macro
    lea si,Arr
    mov cx,5
    user:
    mov ah,1
    sub al,'0'
    int 21h
    mov [si],al
    inc si
    space
    Loop user
endm

PrintArr macro
    lea si,Arr
    mov cx,len
    Show:
    mov ah,2
    mov dx,[si]
    mov dh,0
    add sum,dx
    add dx,48
    int 21h
    space 
    inc si
    Loop Show
endm    

output macro m
    mov ah,2
    mov dl,m
    add dl,48
    int 21h
endm

Max_Min macro
    lea si,Arr
    mov cx,len
    
    
    find:
    mov bl,[si]
    cmp bl,max
    jg updateMax
    cmp bl,min
    jl updateMin
    
    jmp go
    
    updateMax:
    mov max,bl
    jmp go
    
    updateMin:
    mov min,bl
    jmp go
    
    go:
    inc si
    Loop find
    
    
endm
.code 
main proc
    mov ax,@data
    mov ds,ax
    print 'Size of The Array is:'
    output len
    printn
    
    print 'Array is:'
    printArr
    printn 
    
    Max_Min
    
    print 'Max element:'
    output max
    printn
    
    print 'Min Element:'
    output min
    printn
    
    print 'Sum is:'
    mov ax,sum
    call print_num_uns
    printn
    
    mov ax,sum
    xor dx,dx
    mov bx,len
    div bx
    mov avg,ax
    mov rem,dx
    
    print 'Average:'
    mov ax,avg
    call print_num_uns
    printn
    
    print 'Reminder:'
    mov ax,rem
    call print_num_uns
    printn 
    

    
  Exit:
      mov ah,4ch
      int 21h
main endp
define_scan_num
define_print_num
define_print_num_uns

end main
    
    