org 100h
.model small
.stack 100h
.data
    array db 5 dup(?) ; Array to store input digits
    newline db 10,13,"$" ; Newline character for output
    msgInput db "Enter the elements of array (5 digits):$"
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
    mov cx, 5 ; Loop counter
    lea di, array ; Pointer to the array 
    ;mov si,offset array
inputLoop:
    mov ah, 01h ; Function to read a character
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov [di], al ; Store the digit in the array                                           
    space " "                                                                             
    inc di
    loop inputLoop
        
endm
space macro char
    mov ah,2
    mov dl,char
    int 21h
endm    
output macro char 
     mov ah, 2 ; Function to print a string
     mov dl,char
     add dl,48
     int 21h     
endm
calSumAvg macro     
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
endm
.code  

main proc
    mov ax,@data
    mov ds, ax
    ; Input
      show msgInput
      input
    ; Calculate average, largest, and smallest
    mov cx, 5 ; Reset loop counter
    lea di, array ; Reset pointer to the array
    ;mov si,offset array
    mov sumVal, 0 ; Reset sum   
    calSumAvg

    ; Calculate average
    mov ax, sumVal ; Convert sum to 16-bit
    mov bl, 5 ; Number of digits
    div bl ; Divide sum by the number of digits
    
    ;mov avg value
    mov avgVal,al
    mov remVal,ah 
    
   
    ;Avg call Procedure
    call FindAverage
    call FindLargest
    call FindSmallest
    call FindReminder 
    
 main endp   
    FindAverage proc
        ;Average Value Here
        show newline
        show msgAverage
        ;add al, '0' ; Convert result to ASCII
        output avgVal 
        show newline        
    FindAverage endp

    FindLargest proc
        ;MaxValue Here
        show msgLargest
        output maxVal         
    FindLargest endp
           
   FindSmallest proc
        ;MinValue Here
        show newline
        show msgSmallest
        output minVal         
   FindSmallest endp
   
   FindReminder proc
        ;Reminder Here
        show newline 
        show msgReminder
        output remVal          
   FindReminder endp S
   ; Exit
    mov ah, 4ch ; Function to exit the program
    int 21h
    
end main

