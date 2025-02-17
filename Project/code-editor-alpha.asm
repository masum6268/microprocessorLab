org 100h
.model small
.stack 100h

.data
    pos_x      db 1 dup(0)        ; dh = pos_x -> controls row
    pos_y      db 1 dup(0)        ; dl = pos_y -> controls column
    matrix    db 80*25 dup(' ')  ; 25 lines of 80 chars each.
    current_line dw ?
    current_char dw ?
    ; text-background * 16 + text-color

    ;Black         =  0
    ;Blue          =  1
    ;Green         =  2
    ;Cyan          =  3
    ;Red           =  4
    ;Magenta       =  5
    ;Brown         =  6
    ;LightGray     =  7
    ;DarkGray      =  8
    ;LightBlue     =  9
    ;LightGreen    = 10
    ;LightCyan     = 11
    ;LightRed      = 12
    ;LightMagenta  = 13
    ;Yellow        = 14
    ;White         = 15
    
    color db 0*16+15
    ; keyword color
    keyword_color db 1*16+14
    ; token color (for example: +, -, *, /, =, etc.)
    token_color db 6*16+11

    ; keywords
    keywords db 'auto', 'break', 'case', 'char', 'const', 'continue', 'default', 'do', 'double', 'else', 'enum', 'extern', 'float', 'for', 'goto', 'if', 'int', 'long', 'register', 'return', 'short', 'signed', 'sizeof', 'static', 'struct', 'switch', 'typedef', 'union', 'unsigned', 'void', 'volatile', 'while', 0

    ; tokens
    tokens db '+', '-', '*', '/', '=', '>', '<', '!', '&', '|', '^', '~', '%', 0

    filename db 'D:\test.txt', 0
    handler dw ?               ; file handler
    length dw dup(0) ; length of the string

; String for the start menu
start_menu_str dw '  ',0ah,0dh

dw ' ',0ah,0dh
dw ' ',0ah,0dh
dw ' ',0ah,0dh
dw '          +----------------------------------------------------+',0ah,0dh
dw '          ¦                                                    ¦',0ah,0dh                                        
dw '          ¦             *      Code Editor      *              ¦',0ah,0dh
dw '          ¦                                                    ¦',0ah,0dh
dw '          ¦                                                    ¦',0ah,0dh          
dw '          ¦       Press enter to start writing C code!         ¦',0ah,0dh
dw '          ¦              To exit the program.                  ¦',0ah,0dh
dw '          ¦                                                    ¦',0ah,0dh
dw '          ¦            213902018  -  213902021                 ¦',0ah,0dh 
dw '          ¦                                                    ¦',0ah,0dh
dw '          ¦                                                    ¦',0ah,0dh
dw '          +----------------------------------------------------+',0ah,0dh
dw '$',0ah,0dh
; ref: https://gist.github.com/dsample/79a97f38bf956f37a0f99ace9df367b9


.code
; Initialize the data segment
    mov  ax,@data
    mov  ds,ax
  
  ; Display the start menu
    call main_menu
    
; Start the program after the user press enter
start_prog:
    call clear_screen
    jmp program

; Initialize the variables
program:
    mov  current_line, offset matrix
    mov  current_char, 0

; Start listening for keys
start:
call read_char
    
; Here we have defined all the functions for each key press event

; Any characters
any_char:
    ; Display the character
    mov  ah, 9
    mov  bh, 0
    mov  bl, color                            
    mov  cx, 1           ; Number of times to display char.
    int  10h             ; Display the char in al.

    ; Update our data matrix
    mov  si, current_line   ; si points to the beginning of the line.
    add  si, current_char   ; si points to the char in the line.
    mov  [ si ], al      ; the char is in the matrix.
    inc  length          ; count the number of chars
    


; Update the cursor position to the right
move_right:
    inc  current_char       ; Increment the current char
    mov  dl, pos_x
    mov  dh, pos_y
    inc  dl              ; Increment the column
    mov  pos_x, dl
    jmp  print_cursor

; Update the cursor position to the left
move_left:
    dec  current_char       ; Decrement the current char
    mov  dl, pos_x
    mov  dh, pos_y
    dec  dl              ; Decrement the column
    mov  pos_x, dl
    jmp  print_cursor

; Update the cursor position to the up
move_up: 
    sub  current_line, 80   ; Subtract 80 from current line to go up. (as each line has 80 chars)
    mov  dl, pos_x
    mov  dh, pos_y
    dec  dh              ; Decrement the row
    mov  pos_y, dh
    jmp  print_cursor

; Update the cursor position to the down
move_down:   
    ; if the
    add  current_line, 80   ; Add 80 to current line to go down. (as each line has 80 chars)
    mov  dl, pos_x
    mov  dh, pos_y
    inc  dh              ; Increment the row
    mov  pos_y, dh
    jmp  print_cursor

; New line (ENTER)
move_new_line:        
    mov si, current_line
    add si, 79
    mov [si], 0dh
    add current_line, 80
    mov current_char, 0
    mov pos_x, 0
    mov dl, pos_x
    mov dh, pos_y
    inc dh
    mov pos_y, dh
    add length, 80
    jmp print_cursor

; Move to the beginning of the line (HOME)
move_to_beginning:
    mov current_char, 0
    mov pos_x, 0
    mov dl, pos_x
    jmp print_cursor
    
back_space:
    ; If the current char is 0, then we can't go back
    cmp current_char, 0
    je  prevent_back_space

    ; Update the data matrix and the length
    dec current_char
    mov si, current_line   ; The si points to the beginning of the line.
    add si, current_char   ; The si points to the char in the line.
    mov [ si ], ' '     ; The char is in the matrix.
    dec length          ; Count the number of chars
    dec pos_x
    mov dl, pos_x
    ; Move the cursor to the left
    mov  ah, 2h
    int  10h
    ; Update the screen
    mov  al,' '
    mov  ah, 9
    mov  bh, 0
    mov  bl, 0000
    mov  cx, 1           ; Number of times to display char.
    int  10h             ; Display the char in al.
    jmp print_cursor
; Print the cursor in the screen
print_cursor:
    mov  ah, 2h
    int  10h
    jmp  start ; Loop back to start listening for keys

; Highlight syntax (keywords and tokens)
syntax_highlight:
    ; Save the return address
    pop si

    call clear_screen

    mov si, offset matrix  ; Point to the beginning of the matrix
    mov cx, 80*25         ; Total number of characters in the matrix

    highlight_loop:
        ; Check for end of matrix
        cmp cx, 0
        je  syntax_exit

        ; Check for non-space character
        mov al, [si]
        cmp al, ' '
        je  not_highlight

        ; Highlight keywords
        mov di, offset keywords
        call highlight_subroutine

        ; Highlight tokens
        mov di, offset tokens
        call highlight_subroutine

        ; Highlight comments (lines starting with ';')
        cmp al, ';'
        je  highlight_comment
        jmp not_highlight

highlight_comment:
    ; Highlight the entire line as a comment
    mov ah, 9
    mov bh, 0
    mov bl, 8*16+7    ; LightGray on Black background
    mov cx, 80
    int 10h

    ; Move to the next line
    add si, 80
    sub cx, 80
    cmp cx, 0  ; Add this comparison to check for the end of the matrix
    je  syntax_exit  ; If end of matrix, exit the syntax highlighting loop
    jmp highlight_loop  ; Continue the syntax highlighting loop

    not_highlight:
        ; Move to the next character
        inc si
        dec cx
        jmp highlight_loop

    highlight_subroutine:
        ; Check each keyword/token
        mov bx, 0

    check_highlight:
        ; Load the current keyword/token
        mov ah, [di]
        cmp ah, 0
        je  not_highlight_subroutine  ; End of keywords/tokens

        ; Clear upper bits of ah for proper comparison
        mov ah, ah

        ; Compare the current character with the keyword/token
        cmp al, ah
        jne not_matched

        ; Highlight the keyword/token
        mov ah, 9
        mov bh, 0
        mov bl, keyword_color
        mov cx, 1
        int 10h

        ; Move to the next character
        inc si
        dec cx
        jmp check_highlight


    not_matched:
        cmp byte ptr [si], 0dh
        je not_highlight_subroutine
        ; Move to the next keyword/token
        inc di
        jmp check_highlight

    not_highlight_subroutine:
        ; Move to the next character
        inc si
        dec cx

    syntax_highlight_return:
    ; Restore the return address
    pop si 
    ret

    syntax_exit:
        ret


; Exit the program
esc:
    int  20h
    
; Create a file and save the data
save_to_file:
  mov  ah, 3ch
  mov  cx, 0
  mov  dx, offset filename
  int  21h

; Save the file handler.
  mov  handler, ax

; Write the data to the file.
  mov  ah, 40h
  mov  bx, handler
  mov  cx, length  ; Number of bytes to write.
  mov  dx, offset matrix
  int  21h

; Close the file to save the data.
  mov  ah, 3eh
  mov  bx, handler
  int  21h
  jmp esc
  
; Don't allow the user to go back
prevent_back_space:
    call read_char


; Procedure to clear the screen
clear_screen proc near
        mov ah,0
        mov al,3
        int 10h        
        ret
clear_screen endp

; Procedure to display the start menu
main_menu proc
    mov ah,09h
    mov dh,0
    mov dx, offset start_menu_str
    int 21h
    
    input:      ;wait for ENTER KEY.
        mov  ah, 0
        int  16h
        cmp  al, 27          ; ESC
        je   esc
        cmp  ax, 1C0Dh       ; ENTER.
        je   start_prog
        jmp input
    
main_menu endp

; Procedure to read the key pressed by the user and call the appropriate function (Event handler)
read_char proc
    ; Read the key pressed by the user
    mov  ah, 0
    int  16h  

    ; Check which key is pressed (Similar to a switch statement)
    cmp  al, 27          ; esc
    je   esc
    cmp  ax, 4800h       ; up arrow
    je   move_up
    cmp  ax, 4B00h       ; left arrow
    je   move_left
    cmp  ax, 4D00H       ; right arrow
    je   move_right
    cmp  ax, 5000h       ; down arrow
    je   move_down
    cmp  ax, 1C0Dh       ; enter key
    je   move_new_line
    cmp  ax, 4700h       ; home key
    je   move_to_beginning
    cmp  ax, 3F00h       ; F5 key (save)
    je   save_to_file
    cmp  ax, 4000h       ; F6 key (syntax highlight)
    je   syntax_highlight
    cmp  ax, 0E08h       ; backspace key (delete)
    je   back_space
    cmp  al, 32
    jae  any_char
    jmp  start
read_char endp

end start