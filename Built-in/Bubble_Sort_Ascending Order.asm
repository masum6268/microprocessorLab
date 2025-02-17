org 100h
.model small
.stack 100h
.data
    array db 7 dup(?) ; Array to store input digits
    msgInput db 10,13,"Enter the elements of array (7 digits): $"
    msgAscending db "Ascending: $"
   
    newline db 10,13,"$" ; Newline character for output
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
    mov ds,ax 
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

exit:
    mov ah,4ch
    int 21h    
main endp
ascendingOrder proc

; Here is the main logic of sort using BubbleSort
; 5,9,3,1,2,6,4  
; I see the debug this code how it work do not talk any confusion just try to understand it
; and comments below?
    mov si,0   
    mov cx,7   ;Number of array elements                           
    sub cx,1      ;n-1 iterations (bubble sort)
BubbleSort:
        cmp cx,si    ;check if we have reached the end of the array
        jz Next                    
        mov al,array[si]  ;prothom value ta ami al nilami array[si]
        mov bl,array[si+1]  ;2nd value ta ami al nilami array[si+1]
        cmp al,bl          ; al boro hole swap korlam nah lo si er maan ek baray abar check korte hobe ebae jokhon nah cx and si 0 nah hoy 
        ja Swap
        add si,1           
        jmp BubbleSort
    Swap:
        mov array[si+1],al
        mov array[si],bl
        add si,1
        jmp BubbleSort        
    Next:                   
        mov si,0 ;etar mane holo ami next step jabo ekhon eta bujar jonno ami bubble sort er algorithm dekhay ashi wait.      
        sub cx,1  ;No. of step check this value          
        cmp cx,0 ;if this value is zero then loop will be terminated and work will be done
        jnz BubbleSort
    ret       
ascendingOrder endp    
        
end main