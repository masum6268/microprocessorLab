Sort use in Assembly
Array=10,15,20,25,30,35,40,45,50,55

----
include 'emu8086.inc'
org 100h
.model small
.data

arr db 10,25,27,70,30,48,44,50 
len equ $-arr 

m db 10
double db ? 
res db ?
rem db ? 

input macro 
    mov ah,1
    int 21h
    sub al,48
    mul m
    mov double,al
    
    mov ah,1
    int 21h
    sub al,48
    add double,al
endm    

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
    print 'Before The Sort:'
    
    mov cx,len
    lea di,arr
    PrintA:
    Double_digit_Print [di] 
    print ' '
    inc di
    Loop PrintA
    
    printn
    
    call Asending
    
    printn
    print 'After the Sort Asending Order Array:'
    
    mov cx,len
    lea di,arr
    PrintArr:
    Double_digit_Print [di] 
    print ' '
    inc di
    Loop PrintArr 
    
    
    
    printn
    
    call Decending
    
    printn
    print 'After the Sort Decending Order Array:'
    
    mov cx,len
    lea di,arr
    PrintAr:
    Double_digit_Print [di] 
    print ' '
    inc di
    Loop PrintAr
    
    
    
main endp

      Decending proc
       mov si,0
       mov cx,len 
       sub cx,1
       
       BubbleSort:
            
            cmp cx,si
            jz Next
            
            mov al,arr[si]
            mov bl,arr[si+1]
            cmp al,bl
            jb Swap
            
            inc si
            jmp BubbleSort
            
            
            Swap:
            mov arr[si],bl
            mov arr[si+1],al
            
            add si,1
            jmp BubbleSort
            
            Next:
            mov si,0
            sub cx,1
            ;dec cx
            cmp cx,0
            
            jnz BubbleSort
               
        
        
        Ret
    Decending endp 
      
      
        
    
    Asending proc
       mov si,0
       mov cx,len 
       sub cx,1
       
       BubbleSort1:
            
            cmp cx,si
            jz Next1
            
            mov al,arr[si]
            mov bl,arr[si+1]
            cmp al,bl
            ja Swap1
            
            inc si
            jmp BubbleSort1
            
            
            Swap1:
            mov arr[si],bl
            mov arr[si+1],al
            
            add si,1
            jmp BubbleSort1
            
            Next1:
            mov si,0
            sub cx,1
            ;dec cx
            cmp cx,0
            
            jnz BubbleSort1

        Ret
    Asending endp    
    
              

exit:
    mov ah,4ch
    int 21h
end main        
