include 'emu8086.inc'

.model small
.stack 100h

.data
a db 10 dup(?)
b db 10 dup(?)
c db 10 dup(?)
n db ?
m db ?
k dw ?
multi dw ?

.code
main proc
  mov ax, @data
  mov ds, ax

  printn 'Enter Num:'
  call scan_num ; Input number from built-in proc
  mov k, cx      ; Store number in k
   
  print 'Seris is:'
  start:
  mov ax,k
  call print_num_uns
  mul k
  add multi,ax
  print '^2'
  sub k,2
  cmp k,1
  je cal
   

  print '+'
  
jmp start
  cal:
  print '='
  mov ax,multi
  call print_num_uns

exit:
  mov ah, 4ch
  int 21h
main endp  
define_scan_num ; Define scan_num macro
define_print_num ; Define print_num macro
define_print_num_uns ; Define print_num_uns macro
define_get_string ; Define get_string macro

end main


