include 'emu8086.inc'

.stack 100h
.model small
.data
 arr db 4 dup(?) 
 
 n  db ?
 size  equ '$'-arr
nl db 10,13,'$' 


.code
main proc
   mov ax,@data
   mov ds,ax

    main endp

    input proc
      print 'Enter Your number:'
      
      mov ah,1
      int 21h 
      sub ax,48
      mov bx,ax
     
      call factor   
      ret
    input endp
    
    factor proc
        
        mov ah,9
        lea dx,nl
        int 21h  
        
        mov bh,0
        mov cx,bx
        mov si,offset arr
        mov n,1
        
        F:
          mov ax,bx 
          div n
          
          and ah,0
          
          JZ find_F
           jmp next
           
          find_F:
          mov [si],al
          inc si
          jmp next

          next:
          inc n

        Loop F
         
        
        
          ;nl
        mov ah,9
        lea dx,nl
        int 21h 
     
        print 'Result:'
        ;mov bh,0
        mov cx,4
        mov si,offset arr
        
        L1:
        mov ah,2
        mov dl,[si]
        add dl,48
        int 21h
        inc si
        Loop L1

        ;ret ;dile bar bar  cholbe kaj
     factor endp

end main
