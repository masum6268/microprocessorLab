Find Max ,min and average from the Array

include 'emu8086.inc'
org 100h
.model small
.data

arr db 10,25,17,25,28,14,30 
len equ $-arr 

m db 10
double db ? 
res db ?
rem db ? 
max db 10
min db 30 
reminder db ?
Average db ?
Sum db ?


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
    mov cx,len
    lea si,arr
    
    findMinMax:
    mov bl,[si]
    add sum,bl
    cmp bl,max
    ja UpdateMax
    cmp bl,min
    jb UpdateMin
    jmp next 
    
    UpdateMax:
    mov max,bl
    jmp next
    
    UpdateMin:
    mov min,bl
    jmp next
    
    next: 
    inc si
    Loop findMinMax
    
    printn
    print 'Output'
    printn 
    
    mov ah,0
    mov al,sum
    mov bl,len
    div bl 
    mov average,al
    mov reminder,ah 
    
    print 'Average='
    double_digit_print average
    printn 
    
    print 'RIMINDER='
    double_digit_print REMINDER
    printn 
    
    
    print 'LARGEST='
    DOUBLE_DIGIT_PRINT max
    printn   
    
    print 'SMALLEST='
    DOUBLE_DIGIT_PRINT MIN
 
    
main endp

 

exit:
    mov ah,4ch
    int 21h
end main        