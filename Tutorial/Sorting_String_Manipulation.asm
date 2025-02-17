String Manipulation And SORTING Algorithm | Using Bubble Sort |
            1. CHECK STRING PALINDROME OR NOT (Solved)
            2. CHECK TWO STRING EQUAL OR NOT (Solved)
            3. SORTING ASCENDING AND DESCENDING ORDER(Solved)
 
           ***** BONUS PART IS FIND THE LENGTH OF THE STRING
Finished this live then add code Also Here !!!!!!!!!!!
How to take String input in assembly language
include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
a db 50 dup(?) 
b db 50 dup(?)
.code
main proc
      mov ax,@data
      mov ds,ax
      print 'Enter Your 1st:'
      mov dx,50   
      ;kothay store korbo bole dite hobe
      lea di,a
      call get_string ;take input from user 
      printn
      print 'Enter Your 2nd:' 
      mov dx,50   
      ;kothay store korbo bole dite hobe
      lea di,b
      call get_string ;take input from user  
      printn
      print 'output1:'
      lea si,a
      call print_string;print the output
      
      printn
      print 'output2:'
      lea si,b  ;
      call print_string;print the output
exit:
      mov ah,4ch
      int 21h
main endp 
;All procedure define here
define_get_string
define_print_string
end main
======================
include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
a db 50 dup(?) 
b db 50 dup(?)
.code
main proc
      mov ax,@data
      mov ds,ax
      print 'Enter Your 1st:'     
     mov dx,50   
      ;kothay store korbo bole dite hobe
      lea di,a
      call get_string ;take input from user     
      printn      
      print 'Enter Your 2nd:'      
      mov dx,50   
      ;kothay store korbo bole dite hobe
      lea di,b
      call get_string ;take input from user    
      printn
      print 'output1:'
      lea si,a
      call print_string;print the output      
      printn
      print 'output2:'
      lea si,b  ;
      call print_string;print the output       
      printn
      ;Check equal or not
      call EqualOrNot
exit:
      mov ah,4ch
      int 21h
main endp     
     EqualOrNot proc
        ;initialize first variable
        mov cx,50
        lea si,a
        lea di,b
        check:
        mov al,[si]
        cmp al,[di]
        jne NotEqual
        inc si
        inc di         
        Loop check      
        Equal:
        printn 'Equal two string'
        jmp exit        
        NotEqual:
        printn 'Not Equal two string'
        jmp exit        
         ret
        EqualOrNot endp    
;All procedure define here
define_get_string
define_print_string
end main
---------------------------
include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
a db 6 dup(?) 
.code
main proc
      mov ax,@data
      mov ds,ax
     print 'Enter Your String:'     
      mov dx,6   
      ;kothay store korbo bole dite hobe
      lea di,a
      call get_string ;take input from user
      printn
      print 'output1:'
      lea si,a
      call print_string;print the output      
      printn
      ;Check equal or not
      call CheckPalindrome      
      ;check madam,abcba,121 
      ;when check palindrome must be seem to that the 
      ;length of the string main focus
      ;because we use length 10 others char is null that
      ;time do not find the palindrome
exit:
      mov ah,4ch
      int 21h
main endp     
     CheckPalindrome proc
        ;initialize first variable
        mov cx,5 ;cx=dx-1
        lea si,a
        lea di,a
        add si,4 ;si=initial index+dx-2         
        ; we find the last index of the string
        ;must be same as dx,cx,and 1 kom add korbo si,a
        ;ar saathe mone rakhte hobe nah holo amar moto bhul hobei        
        check:
        mov al,[di]
        cmp al,[si]
        jne NotEqual
        dec si
        inc di        
        Loop check       
        Pali:
        printn 'Palindrome'
        jmp exit       
        NotEqual:
        printn 'Not a Palindrome'
        jmp exit        
         ret
        CheckPalindrome endp    
;All procedure define here
define_get_string
define_print_string
end main
-----------------------
include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
a db 50 dup(?) 
.code
main proc
      mov ax,@data
      mov ds,ax
      print 'Enter Your String:'     
     mov dx,50   
      ;kothay store korbo bole dite hobe
      lea di,a
      call get_string ;take input from user
      printn
      print 'Your String is:'
      lea si,a
      call print_string;print the output
      printn
      ;Print the total length of the string
      print 'Total Length:'
      call FindTotalLength     
      Find:
      mov ax,si
      call print_num_uns
exit:
      mov ah,4ch
      int 21h
main endp       
        FindTotalLength proc        
        ;initialize the string position
         mov si,0; size of length of the string
         Check:
         ;cmp [a+si],0;Check a[0+si]='$' then go to find
                     ;otherwise increase si =si+1 
         ;it work alternatively
         cmp byte ptr[a+si],0 ;same logic            
         je Find
         inc si
         jmp Check       
            ret 
        FindTotalLength endm   
;All procedure define here
define_get_string
define_print_string
define_print_num_uns
end main
---------------------------------
org 100h
.model small
.stack 100h
.data
    array db 7 dup(?) ; Array to store input digits
    temp db 0 ; Temporary variable for swapping
    msgInput db 10,13,"Enter the elements of array (7 digits): $"
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
        
descendingOrder proc
    mov si,00   
    mov cx,7   ;Number of array elements                           
    sub cx,1      ;n-1 iterations (bubble sort)
BubbleSort1:
        cmp cx,si          
        jz Next1                    
        mov al,array[si]  
        mov bl,array[si+1]  
        cmp al,bl           
        jb Exchange
        add si,1           
        jmp BubbleSort1
    Exchange:
        mov array[si+1],al
        mov array[si],bl
        add si,1
        jmp BubbleSort1        
    Next1:                   
        mov si,0            
        sub cx,1            
        cmp cx,0
        jnz BubbleSort1
    ret
descendingOrder endp
    ; Exit
    mov ah, 4ch ; Function to exit the program
    int 21h 
end main
 ----------------
@pan78mtricks