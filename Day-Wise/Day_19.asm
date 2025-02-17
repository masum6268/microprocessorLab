Selection Sort

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
    
    call Selection
    
    printn
    print 'After the Sort Array:'
    
    mov cx,len
    lea di,arr
    PrintArr:
    Double_digit_Print [di] 
    print ' '
    inc di
    Loop PrintArr 
    
    
    
    
    
main endp
      
      Selection proc
         
         mov cx,len
         mov si,0
         
         Outer_Loop:
         
            cmp si,cx
            jge Finished
            
            mov di,si
            
         Inner_Loop:
            
            cmp di,cx
            jge NextIteration
            
            mov al,arr[di]
            mov bl,arr[si]
            cmp al,bl
            ja update_min
            ;jb update_max
            
            inc di
            jmp Inner_Loop
            
                update_min: 
                mov arr[di],bl
                mov arr[si],al
                inc di
                jmp Inner_Loop
            
            NextIteration:
                inc si
                jmp outer_Loop
                
            
            finished:        
                 
         
        
        
        ret 
        
      Selection endp    
      
          
    
              

exit:
    mov ah,4ch
    int 21h
end main        
