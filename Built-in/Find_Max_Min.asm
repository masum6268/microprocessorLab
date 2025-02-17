include 'emu8086.inc'

.model small
.stack 100h

.data
a db 50 dup(?)
b db 50 dup(?)
c db 50 dup(?)
Max dw 0
Min dw 1000
k dw ?
n dw ?
m dw ?

input macro

store:
    printn ' '
    print ' Input:'
    call scan_num
    push cx
    
    dec k 
    cmp k,0
    
    jnz store


endm

outputArray macro
  
display:
  pop ax
  ;call print_num_uns
  mov bx,ax 
  
  cmp bx,Min
  jl updateMin
  jmp next
  
  updateMin:
  mov Min,bx
  jmp next
  
  
  next:
  cmp bx,Max
  jg updateMax
  jmp nextIteration
  
  updateMax:
  mov Max,bx
  
  
            
  nextIteration:          
  dec n
  cmp n,0
  je sumprint
  jmp display
endm

space macro
    mov ah,2
    mov dl," "
    int 21h
endm




    
    
endm

.code
main proc
  mov ax, @data
  mov ds, ax

  print ' Enter Num:'

  call scan_num ; Input number from built-in proc
  mov k, cx      ; Store number in k
  mov n,cx
  printn ' '

  input          ; Input values into array a

  printn ' '
 ; printn 'Output:'

  outputArray        ; Print values from array a
  
  sumprint:
  print 'Maxelement: '
  mov ax,Max
  call print_num_uns
  
  printn ' '
  print 'MinElement: '
  mov ax,Min
  call print_num_uns
  print ' '
exit:
  mov ah, 4ch
  int 21h
main endp  
define_scan_num ; Define scan_num macro
define_print_num ; Define print_num macro
define_print_num_uns ; Define print_num_uns macro

 ; Implement missing macros
end main


