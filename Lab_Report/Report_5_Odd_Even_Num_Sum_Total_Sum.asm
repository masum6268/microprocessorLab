org 100h
.model small
.stack 100h
.data
    array db 9 dup(?) ; Array to store input digits
    newline db 10,13,"$" ; Newline character for output
    msgInput db "Enter n: $"
    msgOdd db "Summation of Odd Numbers Sum= $"
    msgEven db "Summation of Even Numberes Sum= $"
    sum dw 0
    k dw ?
    EvenVal dw 0 ; Variable to store the minimum value
    OddVal dw 0 ; Variable to store the sum of the digits
show macro m
     mov ah,9 ; Function to print a string
     lea dx,m
     int 21h
endm 

SumUsingFormula macro n 
     ; Read n
     mov bh,n
    ; Calculate sum
    mov al, bh
    add al, 1  
    mul bh
    mov dl, 2
    div dl
    mov sum, ax

endm


input macro
    mov ah, 1 ; Function to read a character   
    int 21h 
    sub al, '0' ;
    mov bl,al    
    SumUsingFormula al
    mov bh,0
    mov k,bx
    
    mov cx, k ; Loop counter
    lea di, array ; Pointer to the array 
    ;mov si,offset array

inputLoop:
    
    mov [di], bl ; Store the digit in the array                                               
    ;space                                         
    sub bl,1
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
  mov cx,k
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
    mov ax, @data
    mov ds, ax
    
    ; Prompt for n
    show msgInput
    input

    ; Print sum
    ; TotalSum
    SumOddEven
    OddDigit
    EvenDigit
    
    
    mov ah, 4ch
    int 21h
main endp
end main