include 'emu8086.inc'
.model small
.stack 100h
.data
a db 50 dup(?)
b db 50 dup(?)
c db 50 dup(?)
n dw ?
m dw ?
res dw ?
rem dw ?
.code

main proc 
mov ax,@data
mov ds,ax
  print ' 1st Number:'  ; Built-in Macro
  
  call scan_num ;Input number from built-in proc
  mov n,cx     ;this value store in cx register
  printn ' '  
  print ' 2nd Number:'
  call scan_num
  mov m,cx
  
  printn ' ' 
  
  mov ax,n
  div m   ;calculation por ax=10
  mov res,ax 
  mov rem,dx
  
  cmp dx,0;reminder dx 
  je divi
  
  printn ' Not Divisible'
  jmp cal
  
  divi:
  printn 'Divisible'
  
  cal:
  printn ' '
  print ' Result:' 
  mov ax,res
  call print_num_uns ;print number which is ax register
  
  printn ' '
  print ' Reminder:' 
  mov ax,rem
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

