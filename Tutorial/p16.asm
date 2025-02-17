include 'emu8086.inc'

.model small
.stack 100h

.data
a db 50 dup(?)
b db 50 dup(?)
c db 50 dup(?)
n db ?
m db ?
k dw ?

.code
main proc
  mov ax, @data
  mov ds, ax

  print ' Enter Num:'

  call scan_num ; Input number from built-in proc
  mov k, cx      ; Store number in k
  printn ' '
  
  ;compare
  and cx,1
  jz even

  printn ' '
  printn ' Output:'
  print ' Odd'
  jmp exit
  
  even:
  printn ' '
  printn ' Output:'
  print ' Even'

exit:
  mov ah, 4ch
  int 21h
main endp  
define_scan_num ; Define scan_num macro
define_print_num ; Define print_num macro
define_print_num_uns ; Define print_num_uns macro
define_get_string ; Define get_string macro

 ; Implement missing macros
end main


