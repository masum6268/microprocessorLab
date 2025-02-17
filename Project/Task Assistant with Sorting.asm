ORG 100H
.MODEL SMALL
.STACK 100H
.DATA
    buffer DB 100 dup('$')

    todo_text1 DB 100 dup('$')
    todo_text2 DB 100 dup('$')
    
    todo_date1 DB 100 dup('$')
    todo_date2 DB 100 dup('$')
    
    taskAdded DB 0
    
    msg_header DB "*************************************************",0DH, 0AH
               DB "*                                                 *", 0DH, 0AH
               DB "*            Welcome to,  Task Assistant          *", 0DH, 0AH
               DB "*                                                 *", 0DH, 0AH
               DB "*************************************************", 0DH, 0AH 
               DB "", 0DH, 0AH
               DB "      [1] Show all tasks", 0DH, 0AH
               DB "      [2] Add new task", 0DH, 0AH
               DB "      [3] Update a task", 0DH, 0AH
               DB "      [4] Delete a task", 0DH, 0AH
               DB "      [0] Exit", 0DH, 0AH
               DB "", 0DH, 0AH
               DB "Press any of the given digit to continue...$"
    
    msg_show_all DB "*************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*               All of your TASKS                 *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "*************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
    
    msg_update_header   DB "*************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*                   UPDATE task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "*************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
    
    msg_add_header   DB "*************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*                  ADD NEW task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "*************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
    msg_delete_header   DB "*************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*                 DELETE A task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "*************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
                 
    msg_updating_header   DB "*************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*               Updating a task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "*************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
                 
    msg_text DB "Enter Task description      : $"
    msg_date DB "Enter Task date(DD/MM/YYYY): $"
    msg_added DB "Task added successfully...$"
    
    msg_delete DB "        DELETE functionality goes here        $"
    msg_empty DB "No task found$"
    
    msg_update DB "Enter the SL No of the task you want to UPDATE$"
    msg_option DB "[1] Main Menu        [0] Exit$"
    msg_back DB "OR Press [0] to back$"
    
    newline DB 13, 10, "$"

SHOW MACRO message
    MOV AH, 9
    LEA DX, message
    INT 21H
ENDM   

SHOW_HEADER MACRO
    SHOW msg_header
    SHOW newline
ENDM

GETC MACRO
    MOV AH, 1
    INT 21H
ENDM

GET_STRING MACRO var
    MOV AH, 0Ah      
    LEA DX, buffer   
    INT 21H          
    
    ; Copy the entered string (skip the first byte which is the length)
    MOV SI, OFFSET buffer+2
    LEA DI, var
    MOV CX, 0
    MOV CL, [buffer+1]  ; Load the length of the entered string
    
    REPE MOVSB
ENDM




SHOW_TASK MACRO sl_no, var_text, var_date
    PRINT ' '
    PRINT sl_no
    PRINT '.'
    SHOW var_text
    SHOW newline
    PRINT ' '
    PRINT ' '
    PRINT ' '
    PRINT ' '
    SHOW var_date
ENDM

SHOW_ALL MACRO
        
ENDM


PRINT MACRO character
    MOV AH, 2
    MOV DL, character
    INT 21H
ENDM

CLEAR_SCREEN MACRO
    MOV AH, 00
    MOV AL, 02
    INT 10H 
ENDM

EXIT MACRO
    MOV AX, 4CH
    INT 21H
ENDM

SWAP_STRINGS MACRO string1, string2, temp
    ; Clear the destination strings
    XOR SI, SI
    XOR CX, CX
    MOV DI, OFFSET string1
    REP STOSB

    XOR SI, SI
    XOR CX, CX
    MOV DI, OFFSET string2
    REP STOSB

    ; Copy contents from string1 to temp
    MOV SI, OFFSET string1
    MOV DI, OFFSET temp
    MOV CX, 50
    REPE MOVSB

    ; Copy contents from string2 to string1
    MOV SI, OFFSET string2
    MOV DI, OFFSET string1
    MOV CX, 50
    REPE MOVSB

    ; Copy contents from temp to string2
    MOV SI, OFFSET temp
    MOV DI, OFFSET string2
    MOV CX, 50
    REPE MOVSB
ENDM


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    
    MAINMENU_LOOP:
        CLEAR_SCREEN
        SHOW_HEADER
        
        INPUT_LOOP:
        GETC
        
        CMP AL, '1'
        JE SM1
        
        CMP AL, '2'
        JE SM2
        
        CMP AL, '3'
        JE SM3
        
        CMP AL, '4'
        JE SM4
        
        CMP AL, '0'
        JE END_MAIN
        
        JMP INPUT_LOOP
         
    SM1:
        CALL SHOW_ALL_TASKS
        JMP MAINMENU_LOOP
    
    SM2:
        CALL ADD_NEW_TASK
        JMP MAINMENU_LOOP
    
    SM3:
        CALL UPDATE_TASK
        JMP MAINMENU_LOOP
    
    SM4:
        CALL DELETE_TASK
        JMP MAINMENU_LOOP
    
    END_MAIN:
        EXIT
    
MAIN ENDP

SHOW_ENTERED_TASKS PROC
        
        SHOW newline
        CMP taskAdded, 0
        JE EMPTY
        SHOW_TASK "1", todo_text1, todo_date1
        
        CMP taskAdded, 2
        JGE SECOND_TASK_OUTPUT
            JMP CONT1
            
        EMPTY:
        SHOW msg_empty
        JMP CONT1
    
        SECOND_TASK_OUTPUT:
        SHOW newline
        SHOW newline
        SHOW_TASK "2", todo_text2, todo_date2
        JMP CONT1
        
        
        ; Point From EMPTY block
        CONT1:
        RET
        
        SHOW_ENTERED_TASKS ENDP

SHOW_ALL_TASKS PROC
    
    ALL_TASKS_LOOP:
        CLEAR_SCREEN
        SHOW msg_show_all
        
        ;showing all the entered tasks
        CALL SHOW_ENTERED_TASKS
        
        SHOW newline
        SHOW newline
        SHOW msg_option
        SHOW newline
        
        GETC
        
        CMP AL, '1'
        JE END_SHOW_ALL_TASKS
        
        CMP AL, '0'
        JE ATL2
        JMP ALL_TASKS_LOOP
    
        
    
        
    ATL2:
        EXIT
        
    END_SHOW_ALL_TASKS:
        RET
    SHOW_ALL_TASKS ENDP
ADD_NEW_TASK PROC
    
    CLEAR_SCREEN
    SHOW msg_add_header
    SHOW newline
    
    SHOW msg_text
    
    MOV BL, taskAdded
    
    CMP BL, 1
    JE SECOND_TASK
        
        GET_STRING todo_text1
        SHOW newline
    
        SHOW msg_date
        GET_STRING todo_date1
        
        JMP CONT
    
    
    SECOND_TASK:
        GET_STRING todo_text2
        SHOW newline
    
        SHOW msg_date
        GET_STRING todo_date2
        
        CALL SORT
    
    CONT:
    INC taskAdded
    
    
    SHOW newline
    SHOW newline
    SHOW msg_added
    
    
    
    SHOW newline
    SHOW newline
    SHOW msg_option
    SHOW newline
        
    GETC
    RET    
    
    ADD_NEW_TASK ENDP


UPDATE_TASK PROC
    
    UPDATE_TASK_LOOP:
        ; clearing screen
        CLEAR_SCREEN
        
        ; showing header for update
        SHOW msg_update_header
        SHOW newline
        SHOW msg_update
        SHOW newline
        
        ; Showing all tasks
        CALL SHOW_ENTERED_TASKS
        
        
        SHOW newline
        SHOW newline
        SHOW msg_back
        SHOW newline
        
        
        GETC
        
        CMP AL, '1'
        JE UPDATE_FIRST
        
        CMP AL, '2'
        JE UPDATE_SECOND
        
        
        CMP AL, '0'
        JE END_UPDATE_TASK
        JMP UPDATE_TASK_LOOP
        
        UPDATE_FIRST:
                CLEAR_SCREEN
                
                SHOW msg_updating_header
                SHOW newline
                SHOW msg_text
                GET_STRING todo_text1
                SHOW newline
            
                SHOW msg_date
                GET_STRING todo_date1
                
                CALL SORT
                
                JMP UPDATE_TASK_LOOP
                
         UPDATE_SECOND:
                CLEAR_SCREEN
                
                SHOW msg_updating_header
                SHOW newline
                SHOW msg_text
                GET_STRING todo_text2
                SHOW newline
            
                SHOW msg_date
                GET_STRING todo_date2
                
                CALL SORT
             JMP UPDATE_TASK_LOOP

    
    END_UPDATE_TASK:
           RET
    
    UPDATE_TASK ENDP
DELETE_TASK PROC
    
    DELETE_TASK_LOOP:
        CLEAR_SCREEN
        
        SHOW msg_delete_header
        SHOW newline
        SHOW newline
        ; Showing all tasks
        CALL SHOW_ENTERED_TASKS
        
        SHOW newline
        SHOW newline
        SHOW msg_back
        SHOW newline
        
        
        GETC   

        CMP AL, '0'
        JE END_DELETE_TASK
        
        CMP AL, '2'
        JE DELETE_SECOND
        
        CMP AL, '1'
        JE DELETE_FIRST
        JMP DELETE_TASK_LOOP
        
        CMP taskAdded, 0
        JE DELETE_TASK_LOOP
        
        DEC taskAdded
        
        JMP DELETE_TASK_LOOP
        
        DELETE_FIRST:
        DEC taskAdded
        JMP DELETE_TASK_LOOP
        
        DELETE_SECOND:
        DEC taskAdded
        JMP DELETE_TASK_LOOP
             
        
        

        
    END_DELETE_TASK:
        RET
        
    DELETE_TASK ENDP

SORT PROC
        LEA SI, todo_date1
        LEA DI, todo_date2
    
        ; Compare dates character by character
        MOV CX, 10 ; Assuming dates have 10 characters
        MOV AL, 0 ; Initialize result
    
    L1:
        MOV AH, [SI]
        MOV BH, [DI]
    
        CMP AH, BH
        JE NextChar  ; If characters are equal, go to the next character
    
        ; If characters are not equal, set result based on the comparison
        JA Date1IsLater
    
    Date1IsEarlier:
        MOV AL, 1 ;  is earlier
        JMP EndComparison
    
    Date1IsLater:
        MOV AL, 2 ; is later
        JMP EndComparison
    
    NextChar:
        INC SI
        INC DI
        LOOP L1
    
    EndComparison:
        
        CMP AL, 1
        JE OCC_EARLIER
    
        CMP AL, 2
        JE OCC_LATER
    
        RET
    
    OCC_EARLIER:
        RET
    
    OCC_LATER:
        CALL SWAP_TODO
        RET
    SORT ENDP

SWAP_TODO PROC
    LEA SI, todo_text1
    LEA DI, todo_text2
    LEA BX, buffer
    SWAP_STRINGS todo_text1, todo_text2, buffer

    LEA SI, todo_date1
    LEA DI, todo_date2
    SWAP_STRINGS todo_date1, todo_date2, buffer

    RET
SWAP_TODO ENDP

END MAIN