include 'emu8086.inc'

.stack 100h
.model small
.data
 arr db 10 dup(?) 
 
 value db ?
 n1 db ?
 n2 db ?
 
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
      sub al,48
      mov bl,al
      mov n1,al
      
      ;space
      mov ah,2
      mov dl, ' '
      int 21h
      
      mov ah,1
      int 21h 
      sub al,48
      mov bh,al
      
      mov n2,al
      mov cl,n1
      add cl,n2 
      mov value,cl 
      
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
        add bl,48     
        ;aaa
        
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
