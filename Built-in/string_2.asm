include 'emu8086.inc'
.model small
.stack 100h
.data
a db 30 dup(?)
b db 30 dup(?)
c db 10 dup(?)
n db ?
m db ?
k dw ?
sum dw ?

.code
main proc
  mov ax, @data
  mov ds, ax

  print 'Enter Your 1st Array:'
  mov dx,30
  lea di,a
  call get_string ; Input string from built-in proc

  printn ' '
  print 'Enter Your 2nd Array:'
  mov dx,30
  lea di,b
  call get_string ; Input string from built-in proc

  printn ' '
  lea si,a
  print 'Output Array1:'
  call print_string ; Input string from built-in proc

  printn ' '
  lea si,b
  print 'Output Array2:'
  call print_string ; Input string from built-in proc

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


