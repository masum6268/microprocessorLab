include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data   

    input db ?  
    
CheckVowelCon macro
         
         
         cmp input, 'A'
         je vw
         cmp input, 'E'
         je vw
         cmp input, 'I'
         je vw
         cmp input, 'O'
         je vw
         cmp input, 'U'
         je vw
         cmp input, 'a'
         je vw
         cmp input, 'e'
         je vw
         cmp input, 'i'
         je vw
         cmp input, 'o'
         je vw
         cmp input, 'u'
         je vw
         
         
         conso:
         printn
         print 'Character Type:Consonant'
         jmp exit
         
         vw:
         printn
         print 'Character Type:Vowel'
         jmp exit 

endm            
   
     
.code
    MAIN PROC    
        MOV AX,@DATA
        MOV DS,AX
        
        printn
        print 'Enter the encrypted character:' 
        
        MOV AH ,1            
        INT 21H 
        INC AL
        MOV input,AL
        
        printn
        print 'Decrypted Character:'
        
        MOV AH,2
        MOV DL,input
        INT 21H
        
        checkVowelCon 
    
    exit:
    mov ah,4ch
    int 21h    
                
    
    MAIN ENDP
 END MAIN