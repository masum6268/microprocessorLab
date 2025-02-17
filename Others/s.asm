org 100h
.model small
.stack 100h
.data
    array db 3 dup(?) ; Array to store input digits
    temp db 0 ; Temporary variable for swapping
    msgInput db "Enter the elements of array (7 digits): $"
    msgAscending db "Ascending: $"
    msgDescending db "Descending: $"
    
    

   
    newline db 10,13,"$" ; Newline character for output
    msgAverage db "AVERAGE=$"
    msgReminder db "Reminder=$"
    msgLargest db "LARGEST=$"
    msgSmallest db "SMALLEST=$" 
    
    avgVal db 0 ; Variable to store the average value
    remVal db 0 ; Variable to store the reminder value
    maxVal db 0 ; Variable to store the maximum value
    minVal db 9 ; Variable to store the minimum value
    sumVal dw 0 ; Variable to store the sum of the digits
    
    
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h
     
endm

input macro
    
    mov cx, 7 ; Loop counter
    lea di, array ; Pointer to the array
    ;mov si,offset array

inputLoop:
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov [di], al ; Store the digit in the array
    ;mov [si], al ; Store the digit in the array                                             
     
    space " "                                          
                                                
    inc di
    loop inputLoop
        
endm

space macro char
    mov ah,2
    mov dl,char
    int 21h
endm    

output macro cha 
     mov ah, 2 ; Function to print a string
     mov dl,cha
     add dl,48
     int 21h
     
endm


calSumAvg macro 
          
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

    space " "

    inc di
    loop printAscendingLoop

    ; Arrange in descending order
    call descendingOrder
    ;ret 
    show newline
    show msgDescending
    

    mov cx, 7 ; Loop counter
    lea di, array ; Pointer to the array

printDescendingLoop:
    
    output [di]
    space " "

    inc di
    loop printDescendingLoop

main endp   



ascendingOrder proc
    ; Bubble Sort Algorithm for Ascending Order
    mov cx, 7 ; Outer loop counter
    lea si, array ; Pointer to the array

outerLoop:
    mov cx, 7 ; Inner loop counter
    lea di, array ; Pointer to the array

innerLoop:
    mov al, [di]
    cmp al, [di + 1]
    jg swap

    jmp nextIteration

swap:
    mov al, [di]
    mov ah, [di + 1]
    mov [di], ah
    mov [di + 1], al

nextIteration:
    inc di
    loop innerLoop

    dec cx
    jz outerLoop
    ret 
ascendingOrder endp 



descendingOrder proc
    ; Bubble Sort Algorithm for Descending Order
    mov cx, 7 ; Outer loop counter
    lea si, array ; Pointer to the array

outerLoopL:
    mov cx, 7 ; Inner loop counter
    lea di, array ; Pointer to the array

innerLoopL:
    mov al, [di]
    cmp al, [di + 1]
    jl swapL

    jmp nextIterationL

swapL:
    mov al, [di]
    mov ah, [di + 1]
    mov [di], ah
    mov [di + 1], al

nextIterationL:
    inc di
    loop innerLoopL

    dec cx
    jz outerLoopL

    ret
descendingOrder endp


    
    ; Exit
    mov ah, 4ch ; Function to exit the program
    int 21h 
    
end main

