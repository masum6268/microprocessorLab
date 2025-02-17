include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data

a1 db 50 dup(?)
a2 db 50 dup(?)
a3 db 50 dup(?)

OddSum dw ?
EvenSum dw ?

size dw ?

input macro
    lea si,a1
    mov cx,size
    
    user:
    mov ah,1
    int 21h
    sub al,'0'
    mov [si],al
    inc si
    space
    Loop user
    
endm

space macro
    mov ah,2
    mov dl," "
    int 21h
endm


printArr macro m
    mov ah,2
    mov dl,m
    add dl,48
    int 21h
endm    


.code 
main proc 
    mov ax,@data
    mov ds,ax
    
    printn
    print 'Enter the size of the Array:'
    call scan_num
    mov size,cx
    
    printn
    input
    
    printn  
    
    print 'Array is:'
    lea si,a1
    mov cx,size
    
    Arr:
    printArr [si]
    inc si
    space
    Loop Arr
    printn 
    
    ;print 'Find Even Values:'
    call FindEven
    printn 
    
    print 'Even Array:'
    lea si,a2
    mov cx,size
    
    Arr1:
    mov bl,[si]
    cmp bl,0
    je GoOdd
    
    printArr [si] 
    inc si
    space
    Loop Arr1
    printn
    
    
    
    
    GoOdd:
    ;print 'Odd Values:'
    call FindOdd
    printn
    
    printn
    print 'Odd Array:'
    lea si,a3
    mov cx,size
    
    Arr2:
    mov bh,[si]
    cmp bh,0
    je sum
    
    printArr bh 
    inc si
    space
    Loop Arr2
    printn
    
    sum:    
    
    print 'Even Sum:'
    mov ax,0
    mov ax,EvenSum
    call print_num_uns
    printn
    
    print 'Odd sum:'
    mov ax,0
    mov ax,OddSum
    call print_num_uns
    
exit:
    mov ah,4ch
    int 21h
main endp
    
FindEven proc 
        lea di,a2
        lea si,a1
        mov cx,size
        Even:
        mov bl,[si]
        mov dl,bl
        and bl,1
        jz evenAdd
        jnz next
        
        
        evenAdd:
        mov [di],dl 
        mov ax,[di]
        add EvenSum,ax
        inc di
        
        next:
        inc si
        Loop Even
       
        ret
FindEven endp
    
    
FindOdd proc 
        lea di,a3
        lea si,a1
        mov cx,size
        Odd:
        mov bl,[si]
        mov dl,[si]
        test bl,1
        jz next1
        
        
        mov [di],dl
        mov ax,[di]
        add OddSum,ax
        inc di
        next1:
        inc si
        Loop Odd
       
        ret
FindOdd endp

define_scan_num
define_print_num_uns

end main
    