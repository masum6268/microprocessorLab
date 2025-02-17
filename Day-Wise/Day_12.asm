Todays Topics :
1. Find Min and Max
2. Input Double Digit User Input
3. Find The Sum of Array Element

Bonus Topics : User Define Macro 

---
  printn
    print 'Find Min and Max Element'
    
    mov cx,len
    lea si,arr
    
    findMinMax:
    mov bl,[si]
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
    print 'Max element:'
    
    ;25/10=result=2 ,rem=5
    ;rel=al and rem=ah 
    
    mov ah,0
    mov al,max
    div m
    mov res,al
    mov rem,ah
    
    ;macro call
    output res
    output rem
    
    
    
    printn
    print 'Min element:'
    mov ah,0
    mov al,min
    div m
    mov res,al
    mov rem,ah
    
    ;macro call
    output res
    output rem 


    ----------------
    include 'emu8086.inc'
org 100h
.model small
.data
arr db 77,88,35,25,47,28,56,40,70

len equ $-arr

max db 0
min db 100
m db 10 
rem db ?
res db ? 

Array db 10 dup(?) 

double db ?
size db ?
sum db ?

;Bonus Topics is Macro
;Bonus Topics 2 

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
    
    
    

input macro
    
    mov ah,1
    int 21h
    sub al,48
    mul m
    mov bl,al

    ;2nd
    mov ah,1
    int 21h
    sub al,'0'
    mov double,al
    add double,bl 
endm    
              
          


.code

main proc
    mov ax,@data
    mov ds,ax
    

    printn
    print 'User input Array size:' 
    
    input  
    mov bl,double
    mov size,bl
    
    printn
    print 'Enter the Array element:'
    
    mov ch,0
    mov cl,size 
    lea si,Array
    
    ArrInput:
    input
    mov bl,double
    mov [si],bl
    inc si  
    print ' '
    Loop ArrInput
    
    
    ;print Array
    
    printn 
    print 'User Input Arrray:'
    mov ch,0
    mov cl,size 
    lea si,Array
    
    PA:
    mov ah,0
    mov bl,[si]
    add sum,bl
    Double_Digit_Print bl
    
    print ' '
    inc si
    Loop PA
    
    printn
    print 'Sum Of The Array Is:'
    Double_Digit_Print sum
    printn
    

    
main endp

exit:
    mov ah,4ch
    int 21h
end main    

------