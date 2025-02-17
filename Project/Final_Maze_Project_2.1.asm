INCLUDE "emu8086.inc"
name "Maze Solver"


map1 macro             ;printing macro for map 1
     
CALL CLEAR_SCREEN

pmaz1:
lea si, m1
lea di, maz1
mov cx, 20             ;moving m1 array to maz1 array
cld 
rep movsb 

lea si, maz1
call print 
 

pmaz2:
lea si,m2 
lea di, maz2           ;loads the address of the source operand m2 into the si
mov cx, 20             ;number of bytes to be transferred
cld                    ;Clearing the direction flag
rep movsb              ;moves a byte from the memory location pointed to by si to di.

lea si, maz2
call print             ;printing the maz2

pmaz3:
lea si,m3
lea di, maz3
mov cx, 20
cld
rep movsb

lea si, maz3
call print 


pmaz4:
lea si,m4  
lea di, maz4
mov cx, 20
cld
rep movsb

lea si, maz4
call print 


pmaz5:
lea si,m5
lea di, maz5
mov cx, 20
cld
rep movsb

lea si, maz5
call print 


pmaz6:
lea si,m6 
lea di, maz6
mov cx, 20
cld
rep movsb

lea si, maz6
call print 


pmaz7:
lea si,m7
lea di, maz7
mov cx, 20
cld
rep movsb

lea si, maz7
call print 


pmaz8:
lea si,m8 
lea di, maz8
mov cx, 20
cld
rep movsb

lea si, maz8
call print 



pmaz9:
lea si,m9
lea di, maz9
mov cx, 20
cld
rep movsb

lea si, maz9
call print 



pmaz10:
lea si,m10 
lea di, maz10
mov cx, 20
cld
rep movsb

lea si, maz10
call print 


pmaz11:
lea si,m11 
lea di, maz11
mov cx, 20
cld
rep movsb

lea si, maz11
call print 


pmaz12:
lea si,m12  
lea di, maz12
mov cx, 20
cld
rep movsb

lea si, maz12
call print 

pmaz13:
lea si,m13 
lea di, maz13
mov cx, 20
cld
rep movsb

lea si, maz13
call print 


pmaz14:
lea si,m14 
lea di, maz14
mov cx, 20
cld
rep movsb

lea si, maz14
call print 


pmaz15:
lea si,m15
lea di, maz15
mov cx, 20
cld
rep movsb

lea si, maz15
call print 


pmaz16:
lea si,m16  
lea di, maz16
mov cx, 20
cld
rep movsb

lea si, maz16
call print 


pmaz17:
lea si,m17 
lea di, maz17
mov cx, 20
cld
rep movsb

lea si, maz17
call print 


pmaz18:
lea si,m18
lea di, maz18
mov cx, 20
cld
rep movsb

lea si, maz18
call print 


pmaz19:
lea si,m19 
lea di, maz19
mov cx, 20
cld
rep movsb

lea si, maz19
call print 


pmaz20:
lea si,m20 
lea di, maz20
mov cx, 20
cld
rep movsb

lea si, maz20
call print 


endd:
             
jmp game_loop 

print:
mov cx, 20

wall1:
     cmp [si], 0 
     je p1           ;if equal then jump to p1 
     
     PUTC    219     ;wall 
     jmp nx1

p1:  PUTC    32      ;printing blank space   

nx1: inc si

loop wall1

PRINTN
ret
    
endm

map2 macro                      ;map2
 CALL CLEAR_SCREEN

pn1:
lea si,n1 
lea di, maz1
mov cx, 20
cld
rep movsb

lea si,maz1
call print1 

pn2:
lea si,n2 
lea di, maz2
mov cx, 20
cld
rep movsb

lea si,maz2
call print1

pn3:
lea si,n3  
lea di, maz3
mov cx, 20
cld
rep movsb

lea si,maz3
call print1

pn4:
lea si,n4  
lea di, maz4
mov cx, 20
cld
rep movsb

lea si,maz4
call print1

pn5:
lea si,n5     
lea di, maz5
mov cx, 20
cld
rep movsb

lea si,maz5
call print1

pn6:
lea si,n6    
lea di, maz6
mov cx, 20
cld
rep movsb

lea si,maz6
call print1

pn7:
lea si,n7    
lea di, maz7
mov cx, 20
cld
rep movsb

lea si,maz7
call print1

pn8:
lea si,n8 
lea di, maz8
mov cx, 20
cld
rep movsb

lea si,maz8
call print1

pn9:
lea si,n9  
lea di, maz9
mov cx, 20
cld
rep movsb

lea si,maz9
call print1

pn10:
lea si,n10  
lea di, maz10
mov cx, 20
cld
rep movsb

lea si,maz10
call print1 

pn11:
lea si,n11   
lea di, maz11
mov cx, 20
cld
rep movsb

lea si,maz11
call print1

pn12:
lea si,n12   
lea di, maz12
mov cx, 20
cld
rep movsb

lea si,maz12
call print1

pn13:
lea si,n13 
lea di, maz13
mov cx, 20
cld
rep movsb

lea si,maz13
call print1

pn14:
lea si,n14  
lea di, maz14
mov cx, 20
cld
rep movsb

lea si,maz14
call print1

pn15:
lea si,n15  
lea di, maz15
mov cx, 20
cld
rep movsb

lea si,maz15
call print1

pn16:
lea si,n16 
lea di, maz16
mov cx, 20
cld
rep movsb

lea si,maz16
call print1

pn17:
lea si,n17  
lea di, maz17
mov cx, 20
cld
rep movsb

lea si,maz17
call print1

pn18:
lea si,n18   
lea di, maz18
mov cx, 20
cld
rep movsb

lea si,maz18
call print1

pn19:
lea si,n19    
lea di, maz19
mov cx, 20
cld
rep movsb

lea si,maz19
call print1

pn20:
lea si,n20   
lea di, maz20
mov cx, 20
cld
rep movsb

lea si,maz20
call print1

endd1:
             
jmp game_loop 

print1:
mov cx, 20

wall11:
     cmp [si], 0 
     je s2           
     
     PUTC    219     
     jmp ny2

s2:  PUTC    32        

ny2: inc si

loop wall11

PRINTN
ret
   
    
endm 


org     100h
.data
  a dw 0                         ;down
  b dw 0                         ;right
  aal dw 0 
  c dw 0
  d dw 0

s_size  equ     2

maze dw s_size dup(0)

star    dw      ?

left    equ     4bh
right   equ     4dh            ;arrow key codes in hexadecimal
up      equ     48h
down    equ     50h

cur_dir db      right          ;store the current direction

wait_time dw    0 
keypress dw 0

msg db "WELCOME TO THE AMAZING MAZE ADVENTURE!", 0dh,0ah
    db "NAVIGATE THROUGH THE MAZE TO FIND THE EXIT!", 0dh,0ah
    db "GAME RULES:", 0dh,0ah
    db "1. USE ARROW KEYS TO MOVE AROUND THE MAZE.", 0dh,0ah, 0ah
    
    db "2. YOU ARE REPRESENTED BY A SMILEY FACE. TRY TO ESCAPE THE TRAP USING THE ARROW KEYS.", 0dh,0ah
    
    db "LET THE MAZE ADVENTURE BEGIN! :D  ", 0dh,0ah
    db "MAP 1 : EASY ", 0dh,0ah  
    db "MAP 2 : DIFICULT ", 0dh,0ah   

    db "CHOOSE A MAP (1/2): $"


   maz1  DB 20 dup(?) 
   maz2  DB 20 dup(?)
   maz3  DB 20 dup(?)
   maz4  DB 20 dup(?)
   maz5  DB 20 dup(?)
   maz6  DB 20 dup(?)
   maz7  DB 20 dup(?)
   maz8  DB 20 dup(?)
   maz9  DB 20 dup(?)
   maz10 DB 20 dup(?)
   maz11 DB 20 dup(?)
   maz12 DB 20 dup(?)
   maz13 DB 20 dup(?)
   maz14 DB 20 dup(?)
   maz15 DB 20 dup(?)
   maz16 DB 20 dup(?)
   maz17 DB 20 dup(?)
   maz18 DB 20 dup(?)
   maz19 DB 20 dup(?)
   maz20 DB 20 dup(?)
     
   ;Easy Maze Map      
   m1  DB  0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
   m2  DB  1,0,0,0,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,1
   m3  DB  1,0,1,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,0,1
   m4  DB  1,0,1,1,1,1,0,1,1,0,1,1,1,1,0,0,0,1,0,1
   m5  DB  1,0,0,0,0,1,0,1,1,0,1,1,0,0,0,1,1,1,0,1
   m6  DB  1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1
   m7  DB  1,1,0,0,0,0,0,1,1,0,1,1,0,1,0,0,0,0,0,1
   m8  DB  1,1,0,1,1,1,0,1,1,0,1,1,0,0,0,1,1,1,1,1
   m9  DB  1,0,0,1,0,1,0,0,0,0,1,1,0,1,0,0,0,0,0,1
   m10 DB  1,0,1,1,0,1,0,1,0,0,1,1,1,1,1,1,1,1,0,1
   m11 DB  1,0,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,1,0,1
   m12 DB  1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,0,1
   m13 DB  1,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1
   m14 DB  1,1,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,1
   m15 DB  1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1
   m16 DB  1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1
   m17 DB  1,1,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1
   m18 DB  1,1,0,1,1,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0
   m19 DB  1,1,0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,1,3,1
   m20 DB  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 
   
   
   ; Hard Maze Map
   n1  DB  0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
   n2  DB  1,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1
   n3  DB  1,0,1,0,0,0,0,1,1,0,0,0,1,1,0,1,0,1,0,1
   n4  DB  1,0,1,1,1,1,0,1,1,0,1,1,1,1,0,0,0,1,0,1
   n5  DB  1,0,0,0,0,1,0,1,1,0,1,1,0,0,0,1,1,1,0,1
   n6  DB  1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1
   n7  DB  1,1,0,0,0,1,1,1,1,0,1,1,0,1,0,0,0,0,0,1
   n8  DB  1,1,0,1,0,1,0,1,1,0,1,1,0,1,0,1,1,1,1,1
   n9  DB  1,0,0,1,0,1,0,0,0,0,1,1,0,1,0,0,0,0,0,1
   n10 DB  1,0,1,1,0,1,0,1,0,0,1,1,0,1,1,1,1,1,0,0
   n11 DB  1,0,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,1,0,1
   n12 DB  1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,0,1
   n13 DB  1,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1
   n14 DB  1,1,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,1
   n15 DB  1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1
   n16 DB  1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1
   n17 DB  1,1,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1
   n18 DB  1,1,0,1,1,1,0,0,0,1,0,0,0,1,0,1,0,0,0,1
   n19 DB  1,1,0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,1,3,1
   n20 DB  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1



  DEFINE_SCAN_NUM
  DEFINE_PRINT_STRING
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS 
  DEFINE_PTHIS
  DEFINE_CLEAR_SCREEN           
  
.code
start:
  
mov dx, offset msg
mov ah, 9                        ;Printing The Welcome massage
int 21h

mov ah,1
int 21h
sub al,48                        ;Input of choosing the map

cmp al,1
je callmap1
jg callmap2

callmap1:                        ;printing map1 using macro
map1

callmap2:
map2                             ;printing map2 using macro


start1:           

mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h                          ;to set the video mode

game_loop:                  

mov al, 0  
mov ah, 05h
int 10h

mov dx, maze[0]
                                ;initialize the cursor at the begining
mov ah, 02h
int 10h

mov al, 01
mov ah, 09h                     ;Smilee Char 
mov bl, 0eh                     ;set the color 
mov cx, 1   
int 10h

mov ax, maze[s_size * 2 - 2]
mov star, ax

call check_for_key
call no_key                     ;chacking for movement

gg:
call move_maze

mov dx, star

mov ah, 02h
int 10h

mov al, 04
mov ah, 09h
mov bl, 0eh 
mov cx, 1                     ;character
int 10h

check_for_key:

mov ah, 01h
int 16h                     ;waiting for key press
jz no_key                   ;no key press the jump to no key

mov ah, 00h
int 16h

cmp al, 1bh                 ;check exit from the maze or not
je stop_game  

mov cur_dir, ah             ;store the presed key

jmp gg 

no_key:

mov ah, 00h
int 1ah                      ;if no key press then it checks the wait
cmp dx, wait_time            ;time and handels the condition and call
jb  check_for_key            ;the game loop again
add  dx, 4
mov  wait_time, dx
   
   jmp game_loop

stop_game:

mov ah, 1
mov ch, 0bh                  ;video mode to text mode
mov cl, 0bh
int 10h

ret

move_maze proc near

wait: 
       inc keypress
                               
mov ax, 40h
mov es, ax

mov di, s_size * 2 - 2
mov cx, s_size-1

move_array:

  mov ax, maze[di-2]              ;It takes the element at di-2, stores it in ax, 
                                  ;and then puts it in the current position di.
                                  ;Then, it moves di two positions to the left.
  mov maze[di], ax
  sub di, 2
 loop move_array

cmp b,19                            ;stop the maze
je stop

cmp cur_dir, left
  je move_left
cmp  cur_dir, right
  je move_right                    ;chacking the key pressed
cmp cur_dir, up
  je move_up
cmp cur_dir, down
  je move_down

jmp stop_move     

move_left:
  dec b 
  dec d  
  cmp a,0
  je lmaze1
  
  cmp a,1
  je lmaze2 
  
  cmp a,2
  je lmaze3 
  
  cmp a,3
  je lmaze4
  
  cmp a,4
  je lmaze5
  
  cmp a,5
  je lmaze6
  
  cmp a,6
  je lmaze7
  
  cmp a,7
  je lmaze8
  
  cmp a, 8
  je lmaze9
  
  cmp a, 9
  je lmaze10
  
  cmp a, 10
  je lmaze11
  
  cmp a,11
  je lmaze12
  
  cmp a,12   
  je lmaze13
  
  cmp a, 13              
  je lmaze14
  
  cmp a, 14                
  je lmaze15
  
  cmp a, 15                  
  je lmaze16
  
  cmp a,16                      
  je lmaze17
  
  cmp a,17                         
  je lmaze18
  
  cmp a,18                           
  je lmaze19
  
  cmp a,19
  je lmaze20

  mvlt:
  mov al, b.maze[0]    ;Moves the value at the first element of the array maze (assuming b is a pointer to an array) into the al register.
  dec al
  mov b.maze[0], al
  cmp al, -1
  jne stop_move       
  mov al, es:[4ah]    
  dec al
  mov b.maze[0], al  
  jmp stop_move

move_right:  
  
  inc b    
  
  cmp a,0
  je rmaze1
  
  cmp a,1
  je rmaze2 
  
  cmp a,2
  je rmaze3 
  
  cmp a,3
  je rmaze4
  
  cmp a,4
  je rmaze5
  
  cmp a,5
  je rmaze6
  
  cmp a,6
  je rmaze7
  
  cmp a,7
  je rmaze8
  
  cmp a, 8
  je rmaze9
  
  cmp a, 9
  je rmaze10
  
  cmp a, 10
  je rmaze11
  
  cmp a,11
  je rmaze12
  
  cmp a,12   
  je rmaze13
  
  cmp a, 13              
  je rmaze14
  
  cmp a, 14                
  je rmaze15
  
  cmp a, 15                  
  je rmaze16
  
  cmp a,16                      
  je rmaze17
  
  cmp a,17                         
  je rmaze18
  
  cmp a,18                           
  je rmaze19
  
  cmp a,19
  je rmaze20
  
  
 mvrt: 
  
  mov al, b.maze[0]
  inc al
  mov b.maze[0], al
  cmp al, es:[4ah]       
  jb  stop_move
  mov b.maze[0], 0  
  jmp stop_move

move_up:
  dec a
  dec c  
  
  cmp a,0
  je umaze1
  
  cmp a,1
  je umaze2 
  
  cmp a,2
  je umaze3 
  
  cmp a,3
  je umaze4
  
  cmp a,4
  je umaze5
  
  cmp a,5
  je umaze6
  
  cmp a,6
  je umaze7
  
  cmp a,7
  je umaze8
  
  cmp a, 8
  je umaze9
  
  cmp a, 9
  je umaze10
  
  cmp a, 10
  je umaze11
  
  cmp a,11
  je umaze12
  
  cmp a,12   
  je umaze13
  
  cmp a, 13              
  je umaze14
  
  cmp a, 14                
  je umaze15
  
  cmp a, 15                  
  je umaze16
  
  cmp a,16                      
  je umaze17
  
  cmp a,17                         
  je umaze18
  
  cmp a,18                           
  je umaze19
  
  cmp a,19
  je umaze20

  
  mvup:  
  mov al, b.maze[1]
  dec al
  mov b.maze[1], al
  cmp al, -1
  jne stop_move
  mov al, es:[84h]    
  mov b.maze[1], al  
  jmp stop_move

move_down:
  inc a
  inc c
  
    cmp a,0
  je dmaze1
  
  cmp a,1
  je dmaze2 
  
  cmp a,2
  je dmaze3 
  
  cmp a,3
  je dmaze4
  
  cmp a,4
  je dmaze5
  
  cmp a,5
  je dmaze6
  
  cmp a,6
  je dmaze7
  
  cmp a,7
  je dmaze8
  
  cmp a, 8
  je dmaze9
  
  cmp a, 9
  je dmaze10
  
  cmp a, 10
  je dmaze11
  
  cmp a,11
  je dmaze12
  
  cmp a,12   
  je dmaze13
  
  cmp a, 13              
  je dmaze14
  
  cmp a, 14                
  je dmaze15
  
  cmp a, 15                  
  je dmaze16
  
  cmp a,16                      
  je dmaze17
  
  cmp a,17                         
  je dmaze18
  
  cmp a,18                           
  je dmaze19
  
  cmp a,19
  je dmaze20

  
  mvdw:
  mov   al, b.maze[1]
  inc   al
  mov   b.maze[1], al
  cmp   al, es:[84h]   
  jbe   stop_move
  mov   b.maze[1], 0   
  jmp   stop_move

stop_move:
  ret 

lmaze1: 
lea si,maz1
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze2: 
lea si,maz2
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze3: 
lea si,maz3
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze4: 
lea si,maz4
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze5: 
lea si,maz5
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze6: 
lea si,maz6
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze7: 
lea si,maz7
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze8: 
lea si,maz8
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze9: 
lea si,maz9
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze10: 
lea si,maz10
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze11: 
lea si,maz11
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze12: 
lea si,maz12
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze13: 
lea si,maz13
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze14: 
lea si,maz14
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze15: 
lea si,maz15
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze16: 
lea si,maz16
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze17: 
lea si,maz17
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze18: 
lea si,maz18
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze19: 
lea si,maz19
add si,b
cmp [si],1h
je beepl
jmp mvlt 

lmaze20: 
lea si,maz20
add si,b
cmp [si],1h
je beepl
jmp mvlt


rmaze1: 
lea si,maz1
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze2: 
lea si,maz2
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze3: 
lea si,maz3
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze4: 
lea si,maz4
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze5: 
lea si,maz5
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze6: 
lea si,maz6
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze7: 
lea si,maz7
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze8: 
lea si,maz8
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze9: 
lea si,maz9
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze10: 
lea si,maz10
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze11: 
lea si,maz11
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze12: 
lea si,maz12
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze13: 
lea si,maz13
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze14: 
lea si,maz14
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze15: 
lea si,maz15
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze16: 
lea si,maz16
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze17: 
lea si,maz17
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze18: 
lea si,maz18
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze19: 
lea si,maz19
add si,b
cmp [si],1h
je beep
jmp mvrt 

rmaze20: 
lea si,maz20
add si,b
cmp [si],1h
je beep
jmp mvrt

  
umaze1: 
lea si,maz1
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze2: 
lea si,maz2
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze3: 
lea si,maz3
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze4: 
lea si,maz4
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze5: 
lea si,maz5
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze6: 
lea si,maz6
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze7: 
lea si,maz7
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze8: 
lea si,maz8
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze9: 
lea si,maz9
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze10: 
lea si,maz10
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze11: 
lea si,maz11
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze12: 
lea si,maz12
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze13: 
lea si,maz13
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze14: 
lea si,maz14
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze15: 
lea si,maz15
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze16: 
lea si,maz16
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze17: 
lea si,maz17
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze18: 
lea si,maz18
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze19: 
lea si,maz19
add si,b
cmp [si],1h
je beepu
jmp mvup 

umaze20: 
lea si,maz20
add si,b
cmp [si],1h
je beepu
jmp mvup


dmaze1: 
lea si,maz1
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze2: 
lea si,maz2
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze3: 
lea si,maz3
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze4: 
lea si,maz4
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze5: 
lea si,maz5
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze6: 
lea si,maz6
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze7: 
lea si,maz7
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze8: 
lea si,maz8
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze9: 
lea si,maz9
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze10: 
lea si,maz10
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze11: 
lea si,maz11
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze12: 
lea si,maz12
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze13: 
lea si,maz13
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze14: 
lea si,maz14
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze15: 
lea si,maz15
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze16: 
lea si,maz16
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze17: 
lea si,maz17
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze18: 
lea si,maz18
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze19: 
lea si,maz19
add si,b
cmp [si],1h
je beepd
jmp mvdw 

dmaze20: 
lea si,maz20
add si,b
cmp [si],1h
je beepd
jmp mvdw
  
beepl:

mov ah,02
mov dl,07h
int 21h
inc b
jmp game_loop

beep:

mov ah,02
mov dl,07h
int 21h
dec b
jmp game_loop

beepu:

mov ah,02
mov dl,07h
int 21h
inc a
jmp game_loop

beepd:

mov ah,02
mov dl,07h
int 21h
dec a
jmp game_loop
  
stop: 

call clear_screen
mov ax,0

CALL   pthis
DB  13, 10, 'Total number of moves: ',0

mov ax,keypress
call print_num

CALL   pthis
DB  13, 10, ' ',0

mov dx, offset msg1
mov ah, 9 
int 21h


msg1 db "****************CONGRATULATIONS****************"  , 0dh,0ah
     DB "**                                           **", 0dh,0ah  
     DB "**                                           **", 0dh,0ah
     DB "**                                           **", 0dh,0ah
     DB "**   ****      **** ********   ***    **     **", 0dh,0ah
     DB "**    **        **     **      ****   **     **", 0dh,0ah
     DB "**    **   **   **     **      ** **  **     **", 0dh,0ah
     DB "**    **  *   * **     **      **  ** **     **", 0dh,0ah
     DB "**    ***       **  ********   **   ****     **", 0dh,0ah
     DB "**                                           **", 0dh,0ah  
     DB "**                                           **", 0dh,0ah
     db "**********YOU SUCCESSFULLY ESCAPED!************$", 0dh,0ah
  


hlt  

move_maze endp