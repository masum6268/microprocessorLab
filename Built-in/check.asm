include 'emu8086.inc'
org 100h
.model samll
.data

string db 10 dup(?)
vowel db 10 dup(?)
size dw ?

printArr macro
     mov si, 0
    print_array:
        mov ah, 2
        mov dl, [vowel + si]
        int 21h
        print ' '
        
        inc si
        cmp si, size
        je exit
        
        jmp print_array
endm  

CheckVowelCon macro
         
         mov cx,size
         lea di,string
         
         check: 
         cmp al, 'A'
         je vw
         cmp al, 'E'
         je vw
         cmp al, 'I'
         je vw
         cmp al, 'O'
         je vw
         cmp al, 'U'
         je vw
         cmp al, 'a'
         je vw
         cmp al, 'e'
         je vw
         cmp al, 'i'
         je vw
         cmp al, 'o'
         je vw
         cmp al, 'u'
         je vw
         
         
         conso:
         inc di
         sub cx,1
         cmp cx,0
         jnz check
         
         vw:
         mov bl,[di]
         mov [si],bl
         inc si
         inc di
         sub cx,1
         cmp cx,0
         jnz check 

endm 
.code

main proc 
    mov ax,@data
    mov ds,ax
    
    printn
    print 'Enter the Size How Many Char do you input:'
    call scan_num
    mov size,cx
    printn
    mov dx,size
    lea di, string
    call get_string
    
    CheckVowelCon 
    
    printArr
    
exit:
    mov ah,4ch
    int 21h
main endp

define_get_string
define_print_string
define_scan_num
end main
    
    
    