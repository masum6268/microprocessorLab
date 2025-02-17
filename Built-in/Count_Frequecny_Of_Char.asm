include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data
a db 50 dup(?)
len dw ? 
times dw ?
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
      mov len,si
      mov ax,si
      call print_num_uns
      
      ;Find The Frequency of Specific Char
      
      mov cx,len
      lea di,a
      mov si,0
      
      Frequency: 
      cmp [di],'A'
      je Count
      cmp [di],'a'
      je Count
      jmp next
      
      Count:
      inc si
      
      next:
      inc di
      Loop Frequency
      
      
      printn
      print 'Fequecny:'
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