Take two characters(number) as inputs 
and perform addition & subtraction 
and print the output below the inputs.
Sample 1: 
Input:1 1
Output:2
Sample 2:
Input:1 1
Output:0
where the first line indicate two inputs and the last line indicates the output after performing certain operations.

------------
;Structure Of Assembly language 
ORG 100H
.model small 
.data 

     
;extra variable declar     

.code

main proc
    
  ; Take a double digit number input from the user.  
    
  ;user input
  mov ah,1;input take from user
  int 21h ;terminal
  mov bl,al
  ;input store in al reg
  
   ;space
  mov ah,2
  mov dl,' '
  int 21h                       
  
  ;2nd input
  MOV AH,1
  INT 21H
  MOV BH,AL 
  
 
  mov ah,2
  mov dl,10
  int 21h
  
  mov ah,2
  mov dl,13
  int 21h
                         
 
  ;print
  ;addition
  mov al,bl
  add al,bh 
  mov ah,2;print
  mov dl,al
  SUB DL,48              
  int 21h
  ;ADDITION 4 2 
  ;52+50=102-48=54 
  
  mov ah,2
  mov dl,' '
  int 21h
  
  ;print
  ;sub
  mov al,bl
  sub al,bh  
  mov ah,2;print
  mov dl,al
  ADD DL,48
  int 21h  
  
main endp

end main  
