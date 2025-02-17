;Structure Of Assembly language 
ORG 100H
.model small 
.data 

     
;extra variable declar     

.code

main proc
    
  ;user input
  mov ah,1;input take from user
  int 21h ;terminal
  mov bl,al
  ;input store in al reg 
                         
  ;space
  mov ah,2
  mov dl,' '
  int 21h                       
  
  ;print 
  mov ah,2;print
  mov dl,bl
  int 21h
  
main endp

end main
--
TASK COMPLETE: Take a double digit number input from the user.
