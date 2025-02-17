ORG 100H
.DATA
array: db 1,20,5,99,6,12,44,32,5,6

.CODE               
mov si,00   
mov cx,10   ;Number of array elements                           
sub cx,1      ;n-1 iterations (bubble sort)
BubbleSort:
        cmp cx,si          
        jz Next                    
        mov al,array[si]  
        mov bl,array[si+1]  
        cmp al,bl           
        jb Exchange
        add si,1           
        jmp BubbleSort
    Exchange:
        mov array[si+1],al
        mov array[si],bl
        add si,1
        jmp BubbleSort        
    Next:                   
        mov si,0            
        sub cx,1            
        cmp cx,0
        jnz BubbleSort