org 100h
.model small
.stack 100h
.data
    array db 8 dup(?) ; Array to store input digits
    newline db 10,13,"$" ; Newline character for output
    msgInput db "Enter the elements of array (8 digits):$"
    msgOdd db "Odd Digits Sum=$"
    msgEven db "Even Digits Sum=$"
    sumVal dw 0
    avgVal db 0 ; Variable to store the average value
    remVal db 0 ; Variable to store the reminder value
    maxVal db 0 ; Variable to store the maximum value
    EvenVal dw 0 ; Variable to store the minimum value
    OddVal dw 0 ; Variable to store the sum of the digits
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h
endm
input macro   
    mov cx, 8 ; Loop counter
    lea di, array ; Pointer to the array 
    ;mov si,offset array

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

output macro value 
     mov ah, 2 ; Function to print a string
     mov dl,value
     add dl,48
     int 21h    
endm

EvenDigit macro
   show newline
   show msgEven
   mov ax,EvenVal
   mov bl,10
   div bl
   mov bx,ax 
   output bl
   output bh
endm

OddDigit macro
   show newline
   show msgOdd
   mov ax,OddVal
   mov bl,10
   div bl
      
   mov bx,ax
   output bl
   output bh
endm


SumOddEven macro 
  mov cx,8
  lea di,array   
calculateLoop:
    mov al, [di] ; Load digit from the array 

    ; Check for largest and smallest
    and [di],1
    jnz OddSum
    
    mov ah,0
    add EvenVal,ax
    jmp nextDigit

OddSum:
    mov ah,0
    add OddVal,ax
    jmp nextDigit

nextDigit:
    inc di
    loop calculateLoop
     
endm

.code  

main proc
    mov ax,@data
    mov ds,ax
    ; Input
      show msgInput
      input
      
      SumOddEven
      OddDigit
      EvenDigit
main endp
end main
;3 1 4 5 1 6 8 7