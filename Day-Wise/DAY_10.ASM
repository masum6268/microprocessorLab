ORG 100H
.model small
.stack 100h
.data

ans dw ?
n dw ?
m dw ?
arr db "String" 

len equ $-arr;find the size of array
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,len
    lea si,arr;array base address store in si
    printArr: 
    mov bl,[si]
    
    mov ah,2
    mov dl,bl
    ;add dl,48
    int 21h
    
    mov ah,2
    mov dl,' '
    int 21h
    
    inc si
    Loop printArr
    
    
    

    
main endp
end main
