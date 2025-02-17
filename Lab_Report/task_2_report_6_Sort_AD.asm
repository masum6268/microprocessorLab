 org 100h
.model small
.stack 100h
.data
    array db 7 dup(?) ; Array to store input digits
    temp db 0 ; Temporary variable for swapping
    msgInput db "Enter the elements of array (7 digits): $"
    msgAscending db "Ascending: $"
    msgDescending db "Descending: $"
    newline db 10,13,"$" ; Newline character for output
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h     
endm
input macro
    mov cx, 7 ; Loop counter
    lea di, array ; Pointer to the array
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
endm
.code  
main proc
    mov ax,@data
    mov ds, ax
      ;Input
      show msgInput
      input     
     ; Arrange in ascending order
    call ascendingOrder    
    show newline
    ; Output Ascending Order 
    show msgAscending
    mov cx, 7 ; Loop counter
    lea di, array ; Pointer to the array

printAscendingLoop:
    output [di]
    space
    inc di
    loop printAscendingLoop
    ; Arrange in descending order
    call descendingOrder 
    show newline
    show msgDescending
    mov cx, 7 ; Loop counter
    lea di, array ; Pointer to the array

printDescendingLoop:    
    output [di]
    space
    inc di
    loop printDescendingLoop
main endp   

ascendingOrder proc
    ; Bubble Sort Algorithm for Ascending Order
     mov si, 0 ; Pointer to the array
     mov cx, 7 ; Outer loop counter
     sub cx,1
    
BLoop:
    cmp cx,si
    jz nextIteration
    mov al, array[si]
    mov bl,array[si+1]
    cmp al,bl
    ja swap
    add si,1 
    jmp BLoop

swap:
    mov array[si+1],al
    mov array[si],bl
    add si,1
    jmp BLoop
    
nextIteration:
    mov si,0
    sub cx,1
    cmp cx,0
    jnz BLoop
    ret 
ascendingOrder endp 

descendingOrder proc
      ; Bubble Sort Algorithm for Ascending Order
     mov si, 0 ; Pointer to the array
     mov cx, 7 ; Outer loop counter
     sub cx,1
    
BLoop1:
    cmp cx,si
    jz nextIteration1
    mov al,array[si]
    mov bl,array[si+1]
    cmp al,bl
    jb swap1
    
    add si,1
    jmp BLoop1

swap1:
    mov array[si+1],al
    mov array[si], bl
    add si,1
    jmp BLoop1
    
nextIteration1:
    mov si,0
    sub cx,1
    cmp cx,0
    jnz BLoop1
    ret 
 
descendingOrder endp
    ; Exit
    mov ah, 4ch ; Function to exit the program
    int 21h 
    
end main


