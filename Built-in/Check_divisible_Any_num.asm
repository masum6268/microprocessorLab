include 'emu8086.inc'
.model small
.stack 100h
.data
a db 50 dup(?)
b db 50 dup(?)
c db 50 dup(?)
n dw ?
m dw ?
divisi dw ?
rem dw ?
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
  mov divisi,ax
  mov rem,dx
   ;ax mov multiplication 
  printn ' '
 
  print ' Output:'
  call print_num_uns ;print number which is ax register
  
  printn ' ' 
  mov ax,rem
  print ' Reminder:'
  call print_num_uns ;print number which is ax register
  
  printn ' '

  cmp rem,0
  je Check 
  
  print ' Not Divisible'
  jmp exit
  Check:
  print ' Divisible'


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
