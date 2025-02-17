User Define Procedure in Assembly Language


      Call 
      Ret

include 'emu8086.inc'
org 100h
.model small
.data

arr db 10,25,17,25,28,14,30 
len equ $-arr 

m db 10
double db ?
OddSum db ?
EvenSum db ? 
res db ?
rem db ? 


Output macro key
    mov ah,2
    mov dl,key
    add dl,48
    int 21h

endm

Double_Digit_Print macro value
   
    mov ah,0
    mov al,value
    div m
    mov res,al
    mov rem,ah
    output res
    output rem
endm  

.code
main proc
    
    mov ax,@data
    mov ds,ax
             
    printn
    print 'Sum of Even Number:'
    call SumOFEven 
   
    
    printn
    print 'Sum of Odd Number:'
    call SumOFOdd
   
    
    jmp exit
     
    
main endp

 SumOFEven proc
    
     mov cx,len
     lea si,arr
     
     FindEven:
     mov bl,[si] 
     and bl,1
     jz Even
     jmp next
     
     Even: 
     mov bl,[si]
     add EvenSum,bl
     double_digit_print bl 
     cmp cx,1
     je next
     print '+'

     next:
     inc si
     Loop FindEven
     print '='
     Double_Digit_Print EvenSum
     
     ret
  ret    
 SumOFEven endp
         

 SumOFOdd proc
     
     mov cx,len
     lea si,arr

     FindOdd:
     mov bl,[si]
     and bl,1
     jnz Odd
     jmp next1
     
     Odd:
     mov bl,[si] 
     add OddSum,bl
     double_digit_print bl 
     cmp cx,1
     je next1
     print '+'
     
     next1:
     inc si
     Loop FindOdd
     print '='
     Double_Digit_Print OddSum
     
     ret
 SumOFOdd endp

exit:
    mov ah,4ch
    int 21h
end main              