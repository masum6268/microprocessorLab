include 'emu8086.inc'

.model small
.stack 100h

.data
n db ?
m dw 2
k dw ?
sum dw ?

.code
main proc
  mov ax, @data
  mov ds, ax

  printn 'Enter Num:'
  call scan_num ; Input number from built-in proc
  mov k, cx      ; Store number in k
   
 ;sum=n*(n+1)/2
 mov ax,cx
 add ax,1
 mul k
 div m 
 mov sum,ax 

 printn 'Summation: '
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


