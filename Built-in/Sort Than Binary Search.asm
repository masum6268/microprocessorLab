include 'emu8086.inc'
org 100h
.model small
.data
     
Array db 15,25,70,10,9,8,3

size equ $-Array
Search dw ?

printArr macro
     mov si, 0
    print_array:
        ;mov ah, 2
        mov dl, [Array + si]
        mov dh,0
        mov ax,dx
        call print_num_uns
        print ' '
        
        inc si
        cmp si, size
        je BianrySearch
        
        jmp print_array
endm        
     

.code
main proc
    mov ax, @data
    mov ds, ax
    
    call Selection
    
    printn
    
    BianrySearch:
    printn
    print 'Which Element Your Search:'
    call scan_num
    mov Search,cx
    
    call Binary
    
exit:
    mov ah, 4ch
    int 21h
main endp
    Binary proc
      mov cx,0
      mov dx,size
      
      Find:
      cmp cx,dx
      jg NotFind
      
      mov si,cx
      add si,dx
      shr si,1
      
      ;check element
      mov bl,[Array+si]
      mov bh,0
      cmp bx,Search
      je FindSearch
      jl update_low
      jg update_high
      
      update_low:
      inc si
      mov cx,si
      jmp Find
      
      update_high:
      dec si
      mov dx,si
      jmp Find
      
      NotFind:
      printn
      print 'Digit is not exist in the Array!'
      jmp exit
      
      FindSearch:
      printn
      print 'Digit is exist in the Array'
      jmp exit
      
      ret
Binary endp
    
    Selection proc
       mov cx, size
       mov si, 0
    
    outer_loop:
        cmp si, cx
        jge finished
        
        mov di, si
        
    inner_loop:
        cmp di, cx
        jge next_iteration
        
        mov al, [Array + di]
        mov bl, [Array + si]
        
        cmp al, bl
        jb update_min
        
        inc di
        jmp inner_loop
        
    update_min:
        mov al, [Array + di]
        mov ah, [Array + si]
        mov [Array + si], al
        mov [Array + di], ah
        
        inc di
        jmp inner_loop
        
    next_iteration:
        inc si
        jmp outer_loop
        
    finished:
        printn
        print 'Sorted Array is:'
        
        printArr
        
        ret
    Selection endm

define_print_num_uns
define_scan_num    
end main