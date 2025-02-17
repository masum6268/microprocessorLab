org 100h
.model small
.stack 100h
.data
    array db 10 dup(?) ; Array to store input digits
  
    msgInput db "Enter the elements of array: $"
    msgOutput db "Array is: $"
    sizeMsg db "Enter the size of Array: $"
    n dw ?
    
    newline db 10,13,"$" ; Newline character for output
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h    
endm
input macro 
    
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ;
    mov ah,0
    mov cx, ax; Loop counter
    mov n,ax
    lea di, array ; Pointer to the array
    show newline
    show msgInput

inputLoop:
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov [di], al ; Store the digit in the array
    space                                                                                      
    inc di
    loop inputLoop       
endm
space macro 
    mov ah,2
    mov dl," "
    int 21h
endm    
output macro cha 
     mov ah, 2 ; Function to print a string
     mov dl,cha
     add dl,48
     int 21h
     space
     
endm 
.code
main proc
    mov ax,@data
    mov ds,ax 
    show sizeMsg
    input
    
    
    ; Print the array
    show newline
    show msgOutput
    mov cx,n
    mov si,offset array
    ou:
     output [si]
     inc si

    loop ou


    ; Exit
    mov ah, 4ch ; Function to exit the program
    int 21h 
    
end main
        