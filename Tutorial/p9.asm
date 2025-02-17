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
  print ' Enter C Temperature:'  ; Built-in Macro
  
;   C to F Convert F=c*9/5+32
  call scan_num ;Input number from built-in proc
  mov c,cx     ;this value store in cx register
  mov ax,cx ;260
  mul n ;260*9=2340
  div m ;2340/5=468
  add ax,32 ;468+32=500
  mov f,ax
  printn ' '
  print ' F Temperature:'
  mov ax,f
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

