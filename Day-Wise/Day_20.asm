   Insertion Sort Algorithm

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
    
    call Insertion
    
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
      
      Insertion proc
         
         mov cx,len
         mov si,1
        
        outer_loop:
            cmp si, cx   ;5,4
            jge finished 
            
            mov al, [arr + si] ;arr[1]
            mov di, si  ;di=1
    
        inner_loop:
            cmp di, 0 ;di=0 or -1
            jle next_iteration
            
            mov bl, [arr + di - 1] ;di=1-1=0 arr[0]
            
            cmp bl, al 
            jle next_iteration 
            
            
            mov [arr + di], bl
            dec di
            jmp inner_loop
            
        next_iteration:
            mov [arr + di], al 
            inc si 
            jmp outer_loop
                
            
            finished:        

        ret 
        
      Insertion endp    

exit:
    mov ah,4ch
    int 21h
end main        
