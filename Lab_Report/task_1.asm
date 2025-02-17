org 100h
.model small
.stack 100h
.data
    array db 5 dup(?) ; Array to store input digits
    newline db 10,13,"$" ; Newline character for output
    msgInput db "Enter the elements of array (5 digits):$"
    msgAverage db "AVERAGE=$"
    msgLargest db "LARGEST=$"
    msgSmallest db "SMALLEST=$" 
    avgVal db 0 ; Variable to store the average value
    maxVal db 0 ; Variable to store the maximum value
    minVal db 9 ; Variable to store the minimum value
    sumVal dw 0 ; Variable to store the sum of the digits
    
    
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h
     
endm

input macro
    mov ah,1
    int 21h
    mov bl,al
    
    ;show newline 
    ;output bl
        
endm

space macro 
    mov ah,2
    mov dl,' '
    int 21h
endm    

output macro char 
     mov ah, 2 ; Function to print a string
     mov dl,char
     add dl,48
     int 21h
     
endm 

.code
main proc
    mov ax,@data
    mov ds, ax

    ; Input
      show msgInput

    mov cx, 5 ; Loop counter
    lea di, array ; Pointer to the array 
    ;mov si,offset array

inputLoop:
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov [di], al ; Store the digit in the array
    ;mov [si], al ; Store the digit in the array                                             
     
    space                                         
                                                
    inc di
    loop inputLoop

    ; Calculate average, largest, and smallest
    mov cx, 5 ; Reset loop counter
    lea di, array ; Reset pointer to the array
    ;mov si,offset array
    mov sumVal, 0 ; Reset sum

calculateLoop:
    mov al, [di] ; Load digit from the array 
    ;sub al,'0'
    mov ah,0
    add sumVal,ax ; Add to the sum

    ; Check for largest and smallest
    cmp al, maxVal
    jg updateMax

    cmp al, minVal
    jl updateMin

    jmp nextDigit

updateMax:
    mov maxVal, al
    jmp nextDigit

updateMin:
    mov minVal, al

nextDigit:
    inc di
    loop calculateLoop

    ; Calculate average
    mov ax, sumVal ; Convert sum to 16-bit
    mov bl, 5 ; Number of digits
    div bl ; Divide sum by the number of digits
    
    ;mov avg value
    mov avgVal,al

    show newline
    show msgAverage
    ;add al, '0' ; Convert result to ASCII
    output avgVal 
    
    
    ;show newline
    show newline

  
    show msgLargest
    output maxVal
   
   
    show newline
    
   
    show msgSmallest
    output minVal
    
   
    show newline
    
    ; Exit
    mov ah, 4ch ; Function to exit the program
    int 21h 
    
 main endp

end main

