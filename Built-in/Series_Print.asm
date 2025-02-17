include 'emu8086.inc'

.model small
.stack 100h

.data
n dw ?
m dw ?
k dw ?
sum dw ?
test_case dw ?
var dw 1

Check macro
    mov dx, test_case
    
    
    call scan_num
    mov n,cx
    
    printn
    call scan_num
    mov m,cx

    
    sub dx,1
    cmp dx,0
    
endm    

.code
main proc
  mov ax, @data
  mov ds, ax

  printn 'Enter Test Case:'
  call scan_num 
  
  mov test_case,cx 
  printn      
  
  mov bx,test_case
  
  find:
  Check
  
  printn
    
  call FindSeries
  printn 
  
  print 'Case-'
  mov ax,var
  call print_num_uns
  print ':'
  sub ax,k 
  mov ax,sum
  call print_num_uns
  printn
  
  inc bx
  cmp bx,0
  inc var
  jnz find
  
  printn    
  

exit:
  mov ah, 4ch
  int 21h
main endp
    FindSeries proc
        
  print 'Seris is:'
  mov bx,0
  mov bx,m
  start:
  mov ax,n 
  add sum,ax
  call print_num_uns 
  cmp n,bx;
  je cal
  add n,2
  print '+'
  
loop start 
  cal:
  print '=' 
  mov ax,sum
  mov k,ax
  call print_num_uns
  
  ret
  FindSeries endp
    
    
    
define_scan_num 
define_print_num 
define_print_num_uns 
define_get_string 

end main


