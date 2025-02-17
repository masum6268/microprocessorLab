include 'emu8086.inc'

.stack 100h
.model small
.data
 arr db 10 dup(?) 
 
nl db 10,13,'$'

.code  

;Main Function start
main proc
   mov ax,@data
   mov ds,ax

    main endp
  ;Main Function End
  
  
    ;Define Input naame ekta Function Jeta user define
    input proc
      print 'Enter two number:'
      
      mov ah,1
      int 21h
      mov bl,al
      
      ;space
      mov ah,2
      mov dl, ' '
      int 21h
      
      mov ah,1
      int 21h
      mov bh,al 
      
      call sum  ;etao ekta function jeta built in in 8086  
      ret
    input endp 
    
    ;End here input naame je function banaichilam
    
    sum proc
        
        mov ah,9
        lea dx,nl
        int 21h 
        
        print 'Result:'
        
        add bl,bh
        sub bl,48     
        aaa
        
        mov ah,2
        mov dl,bl
        int 21h 
        
        
        ;nl
        mov ah,9
        lea dx,nl
        int 21h
        ;ret ;dile bar bar  cholbe kaj
      sum endp

end main
