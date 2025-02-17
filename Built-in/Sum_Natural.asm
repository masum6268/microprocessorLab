include 'emu8086.inc'

.model small
.stack 100h

.data
n db ?
m db ?
k dw ?
sum dw ?

.code
main proc
  mov ax, @data
  mov ds, ax

  printn 'Enter Num:'
  call scan_num ; Input number from built-in proc
  mov k, cx      ; Store number in k
   
  print 'Seris is:'
  start:
  mov ax,k ;9,8,1
  add sum,ax;sum=9+8+....+1
  call print_num_uns ;9+8+.......+1=45
  dec k ;8,7,1,0
  cmp k,0;
  je cal
  print '+'
  
loop start ;8,7,1
  cal:
  print '='
  mov ax,sum
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


