include 'emu8086.inc'
.model small
.stack 100h
.data
a db 50 dup(?)
b db 50 dup(?)
c db 50 dup(?)
n db ?
m db ?
.code

main proc 
mov ax,@data
mov ds,ax
  print ' Enter Num:'  ; Built-in Macro
  
  call scan_num ;Input number from built-in proc
  mov ax,cx     ;this value store in cx register
  printn ' '
  print ' Output:'
  call print_num_uns ;print number which is ax register

  

   exit:
  mov ah,4ch
  int 21h
main endp
define_scan_num
define_print_num
define_print_num_uns
define_get_string
define_print_string


end main

