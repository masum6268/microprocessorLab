include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data

msg_1 db 6 dup(?)
msg_2 db 6 dup(?)


.code
main proc
    mov ax,@data
    mov ds,ax
    
    print 'Enter Your String:'
    mov dx,6 ;ekhane joto length dibo compare o toto length er korte hobe
    lea di,msg_1
    call get_string
    printn
   
   ;How to compare two string is palendrome or not?
    print 'out1:'
    lea si,msg_1
    call print_string
      
    printn    
    call check_palindrome

      pali:
      print 'Palindrome'
      jmp exit
      not_palindrome:
      print 'Not Palindrome'


      exit:
      mov ah,4ch
      int 21h
main endp
      check_palindrome proc
      mov cx,5
      lea si,msg_1
      lea di,msg_1
      add si,4 ;Which length string check otherwise problem face in null character
      check_palindrome_loop:
      mov al,[di]
      cmp al,[si] 
      jne not_palindrome
 
      inc di
      dec si
      loop check_palindrome_loop
      ret
      check_palindrome endp

; All built-in function Define here
define_get_string
define_print_string
end main
    
    
    