Binary SEARCH Algorithm

Binary =
Array Sort =10,15,20,30,40
mid value=arr[2]=20

include 'emu8086.inc'
org 100h
.model small
.data

arr db 10,25,27,30,48,44,70 
len equ $-arr 

m db 10
double db ? 
res db ?
rem db ? 
search db ?

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
    print 'Apply Binary Search Algorithm!!'
    
    printn
    print 'Which value Search:'
    input
    mov dl,double
    mov search,dl 
    
    mov cx,0   ;starting index
    mov dx,len ;final index
    
    BinarySearch:
    cmp cx,dx ;f<i
    ja notfind
    
    mov si,cx
    add si,dx
    shr si,1
    mov bl,arr[si]
    
    cmp bl,search
    je find
    jl update_low
    jg update_high
    
    update_low:
    inc si
    mov cx,si
    jmp binarysearch
    
    update_high:
    dec si
    mov dx,si
    jmp BinarySearch     
    
    
    
     NotFind:
     printn
     print 'Value not find!!'
     jmp exit
     
     Find:
     printn
     print 'Value find!!'

main endp

exit:
    mov ah,4ch
    int 21h
end main        


