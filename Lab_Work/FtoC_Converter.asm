org 100h
.model small
.stack 100h
.data
    newline db 10,13,"$" ; Newline character for output
    msgInput db "Enter Fahrenheit Temperature:$"
    msgC db "F to C Temperature=$"
    msgF db "C to F Temperature=$" 
    nVal dw 0 ; Variable to store the input value
    CVal dw 0 ; Variable to store the Celcius value
    FVal dw 0 ; Variable to store the Fahrenheit digits
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h
endm
input macro   

inputLoop: 
    mov bl,10
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mul bl
    mov ah,0
    mov nVal,ax
    
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov ah,0
    add nVal,ax
      
endm

space macro 
    mov ah,2
    mov dl," "
    int 21h
endm    

output macro value 
     mov ah, 2 ; Function to print a string
     mov dl,value
     add dl,48
     int 21h    
endm


CT macro
   show newline
   show msgC
   ; Function to print a string
   ; c/5=(f-32)/9
   ;c=(f-32)*5/9
   mov ax,nVal
   sub ax,32
   mov bl,5
   mul bl
   mov cl,9
   div cl
   mov CVal,ax
   
   mov bl,10
   div bl
      
   mov bx,ax
   output bl
   output bh
endm

.code  

main proc
    mov ax,@data
    mov ds,ax
    ; Input
      show msgInput
      input
      CT
main endp
end main

=========================================

org 100h
.model small
.stack 100h
.data
    newline db 10,13,"$" ; Newline character for output
    msgInput db "Enter Fahrenheit Temperature:$"
    msgC db "F to C Temperature Converter=$" 
    nVal dw 0 ; Variable to store the input value
    CVal dw 0 ; Variable to store the Celcius value
    n db ?
    
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h
endm
input macro   

inputLoop: 
    mov bl,100
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mul bl
    ;mov ah,0
    mov nVal,ax
    
    mov bl,10
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov ah,0
    add nVal,ax 
    
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov ah,0
    add nVal,ax
      
endm

space macro 
    mov ah,2
    mov dl," "
    int 21h
endm    

output macro value 
     mov ah, 2 ; Function to print a string
     mov dl,value
     add dl,48
     int 21h    
endm


CT macro
   show newline
   show msgC
   ; Function to print a string
   ; c/5=(f-32)/9
   ;c=(f-32)*5/9
   mov ax,nVal
   sub ax,32
   mov bx,5
   mul bx
   mov cx,9
   div cx
   mov CVal,ax
   
   mov bh,100
   div bh
   mov ch,al
   output ch
   mov n,ah
   mov al,n 
   mov cl,10

   mov bx,ax
   output bl
   output bh
endm

.code  

main proc
    mov ax,@data
    mov ds,ax
    ; Input
      show msgInput
      input
      CT
main endp
end main

