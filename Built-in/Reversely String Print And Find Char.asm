include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
Arr db 50 dup(?)
Copy db 10 dup(?)
;len equ $-Arr
size dw ?

space macro
    mov ah,2
    mov dl," "
    int 21h
endm

input macro
    lea si,Arr
    mov cx,size
    user:
    mov ah,1
    sub al,'0'
    int 21h
    mov [si],al
    inc si
    ;space
    Loop user
endm

PrintArr macro
    lea si,Arr
    mov cx,size
    Show:
    mov ah,2
    mov dl,[si]
    int 21h
    ;space 
    inc si
    Loop Show
endm    

output macro m
    mov ah,2
    mov dl,m
    ;add dl,48
    int 21h
endm

.code 
main proc
    mov ax,@data
    mov ds,ax
    print 'Size of The Array is:'
    call scan_num
    mov size,cx
    printn  
    
    print 'Enter String:'
    input 
    printn 
    
    print 'String is:'
    PrintArr
    printn
    
    call Reverse
    
    call CheckLetter
    printn
    
    
  Exit:
      mov ah,4ch
      int 21h
main endp

        Reverse proc
            lea si,Arr
            mov cx,size
            lea di,Copy
            add si,size
            ulta:
            mov bl,[si-1]
            mov [di],bl
            inc di
            dec si
            Loop ulta
            
            printn
            print 'Reverse String is:'
            
            mov si,offset Copy
            mov cx,size
            p:
            output [si]
            inc si
            Loop p
            ret
            
        Reverse endp    

        CheckLetter proc
            lea si,Arr
            mov cx,size
            Search:
            mov bl,[si]
            cmp bl,'O'
            je find
            inc si
            Loop Search
            
            Notfind:
            printn
            print 'Char not Exist in the String'
            printn
            RET 
            
            Find:
            printn 
            print 'Char is Exist in the String'
            RET
        CheckLetter endp     
        
define_scan_num
define_print_num
define_print_num_uns

end main
    
    