;Structure Of Assembly language 
ORG 100H
.model small 
.data 

;extra variable declar     
.code
main proc   
 mov bl,10
 mov cl,5 
 ;add
 add bl,cl ;  bl =bl+cl
 
 ;sub
 mov al,bl 
 mov cl,9
 sub al,cl  ;  al=al-cl
main endp

end main

---
;Structure Of Assembly language 
ORG 100H
.model small 
.data 

     
;extra variable declar     

.code

main proc
    
    mov bl,3
    mov al,6
    
    ;mul bl;al=al*bl
    ;mul bl
    div bl;al=al/bl
    
    
    ;5*2=10  
    ;AX*(alada kono reg) 
    ;6/2=3
    ;AX/(alada kono reg)

main endp

end main