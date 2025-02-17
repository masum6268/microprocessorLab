include 'emu8086.inc'
.model small
.stack 100h
.data
a db 50 dup(?)
b db 50 dup(?)
c db 50 dup(?)
n dw ?
m dw ?
rem db ?
.code

main proc 
mov ax,@data
mov ds,ax
  print ' 1st Num:'  ; Built-in Macro
  
  call scan_num ;Input number from built-in proc
  mov n,cx     ;this value store in cx register
  printn ' '
  print ' 2nd Num:'  ; Built-in Macro
  call scan_num
  mov m,cx    
  
  ;n/m
  mov ax,n
  div m 
  
  printn ' '
  ;reminder store the dx register
  print ' Output:'
  call print_num_uns ;print number which is ax register
  
  printn ' '
  
  print ' Reminder:'
  mov ax,dx
  call print_num_uns
  
  
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
