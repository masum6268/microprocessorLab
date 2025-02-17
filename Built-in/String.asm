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
sum dw ?

.code
main proc
  mov ax, @data
  mov ds, ax

  printn 'Enter Num: '
  call scan_num ; Input number from built-in proc
  mov k, cx      ; Store number in k
  printn ' '
  print 'Enter Your String:'
  mov dx,30
  call get_string ; Input string from built-in proc

  printn ' '
  printn 'Output:'
  mov ax,1
  start:
  call print_num_uns
  inc ax
  print '->'
  call print_string
  printn ' '
loop start


exit:
  mov ah, 4ch
  int 21h
main endp  
define_scan_num ; Define scan_num macro
define_print_num ; Define print_num macro
define_print_num_uns ; Define print_num_uns macro
define_get_string ; Define get_string macro
define_print_string

end main


