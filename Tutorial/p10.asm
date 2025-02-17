include 'emu8086.inc'
.model small
.stack 100h
.data
c dw ?
f dw ?
n dw 9
m dw 5
.code

main proc 
mov ax,@data
mov ds,ax
  print ' Enter F Temperature:'  ; Built-in Macro
  
;   F to C Convert C=(F-32)*5/9
  call scan_num ;Input number from built-in proc
  mov f,cx     ;this value store in cx register
  mov ax,cx ;260
  sub ax,32
  mul m
  div n 
  mov c,ax
  printn ' '
  print ' C Temperature:'
  mov ax,c
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

