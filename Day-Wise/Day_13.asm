Write an Assembly Language code that takes an input ARRAY and passes the array values and address
to a MACRO. Using the array, address and one procedure separate out the ODD digits and EVEN digits.
Input:
2 0 4 7 1 9
Output:
ODD Digits: 7 1 9
EVEN Digits: 2 0 4

include 'emu8086.inc'
org 100h
.model small
.data

m db 10 
rem db ?
res db ? 

Array db 10 dup(?) 

double db ?
size db ?
sum db ?


Output macro key
    mov ah,2
    mov dl,key
    add dl,48
    int 21h

endm


Double_Digit_Print macro value
   
    mov ah,0
    mov al,value
    div m
    mov res,al
    mov rem,ah
    output res
    output rem
endm    
    
    
    

input macro
    
    mov ah,1
    int 21h
    sub al,48
    mul m
    mov bl,al

    ;2nd
    mov ah,1
    int 21h
    sub al,'0'
    mov double,al
    add double,bl 
endm    
              
          

printMsg macro msg
    
    mov ah,9
    lea dx,msg
    int 21h
endm    

.code

main proc
    mov ax,@data
    mov ds,ax
    
    printn
    print 'Enter the Size of the Array:'
    input 
    mov bl,double
    mov size,bl 
    
    printn
    
    ;input array element
    mov ch,0
    mov cl,size
    lea si,Array
    
    ArrInput:
    input 
    mov bl,double
    mov [si],bl
    inc si
    print ' '
    Loop ArrInput
    
    
    printn
    print 'Array input element:' 
    mov ch,0
    mov cl,size
    lea si,Array
    ArrPrint:
    mov bl,[si] 
    double_digit_print bl
    inc si
    print ' '
    Loop ArrPrint

    printn 
    print 'Odd Element:'
    mov ch,0
    mov cl,size
    lea si,Array
    
    ArrOdd:
    mov bl,[si]
    and bl,1
    jnz Odd 
    jmp next
    
    Odd: 
    double_digit_print [si]
    print ' ' 
    
    next:
    inc si
    Loop ArrOdd
    
    printn
    print 'Even Element:'
    
    mov ch,0
    mov cl,size
    lea si,Array
    
    ArrEven:
    mov bl,[si]
    and bl,1
    jz Even 
    jmp next1
    
    Even: 
    double_digit_print [si]
    print ' ' 
    
    next1:
    inc si
    Loop ArrEven
    

    
main endp

exit:
    mov ah,4ch
    int 21h
end main    
----
 Lab Exercise (Submit as a report)
• Write an Assembly Language code that takes an input ARRAY and passes the array values and address
to a MACRO. Now produce the summation of odd digits and even digits as output.
Input:
3 1 4 5 1 6 8 7
Output:
ODD Digits: 17
EVEN Digits: 18


include 'emu8086.inc'
org 100h
.model small
.data

m db 10 
rem db ?
res db ? 

Array db 10 dup(?) 

double db ?
size db ?
OddSum db ? 
EvenSum db ?


Output macro key
    mov ah,2
    mov dl,key
    add dl,48
    int 21h

endm


Double_Digit_Print macro value
   
    mov ah,0
    mov al,value
    div m
    mov res,al
    mov rem,ah
    output res
    output rem
endm    
    
    
    

input macro
    
    mov ah,1
    int 21h
    sub al,48
    mul m
    mov bl,al

    ;2nd
    mov ah,1
    int 21h
    sub al,'0'
    mov double,al
    add double,bl 
endm    
              
          

printMsg macro msg
    
    mov ah,9
    lea dx,msg
    int 21h
endm    

.code

main proc
    mov ax,@data
    mov ds,ax
    
    printn
    print 'Enter the Size of the Array:'
    input 
    mov bl,double
    mov size,bl 
    
    printn
    
    ;input array element
    mov ch,0
    mov cl,size
    lea si,Array
    
    ArrInput:
    input 
    mov bl,double
    mov [si],bl
    inc si
    print ' '
    Loop ArrInput  
    
    
    
    printn
    print 'Array input element:' 
    mov ch,0
    mov cl,size
    lea si,Array
    ArrPrint:
    mov bl,[si] 
    double_digit_print bl
    inc si
    print ' '
    Loop ArrPrint

    printn 
    print 'Odd Element:'
    mov ch,0
    mov cl,size
    lea si,Array
    
    ArrOdd:
    mov bl,[si]
    and bl,1
    jnz Odd 
    jmp next
    
    Odd: 
    double_digit_print [si]
    mov bl,[si]
    add OddSum,bl
    print ' ' 
    
    next:
    inc si
    Loop ArrOdd
    
    printn
    print 'Even Element:'
    
    mov ch,0
    mov cl,size
    lea si,Array
    
    ArrEven:
    mov bl,[si]
    and bl,1
    jz Even 
    jmp next1
    
    Even: 
    double_digit_print [si]
    mov bl,[si]
    add EvenSum,bl
    print ' ' 
    
    next1:
    inc si
    Loop ArrEven
    
    printn
    print 'Odd Numbers sum:'
    double_digit_print OddSum
    
    printn
    print 'Even Numnbers sum:'
    double_digit_print EvenSum
    
    printn
    print 'Complete 2 tasks!!!'
    

    
main endp

exit:
    mov ah,4ch
    int 21h
end main    