ORG 100H
.MODEL SMALL
.STACK 100H
.DATA
    buffer DB 50 dup('$')

    todo_text1 DB 50 dup('$')
    todo_text2 DB 50 dup('$')
    
    todo_date1 DB 50 dup('$')
    todo_date2 DB 50 dup('$')
    
    taskAdded DB 0
    
    msg_header DB "***************************************************",0DH, 0AH
               DB "*                                                 *", 0DH, 0AH
               DB "*            Welcome to,  Task Assistant          *", 0DH, 0AH
               DB "*                                                 *", 0DH, 0AH
               DB "***************************************************", 0DH, 0AH 
               DB "", 0DH, 0AH
               DB "      [1] Show all tasks", 0DH, 0AH
               DB "      [2] Add new task", 0DH, 0AH
               DB "      [3] Update a task", 0DH, 0AH
               DB "      [4] Delete a task", 0DH, 0AH
               DB "      [0] Exit", 0DH, 0AH
               DB "", 0DH, 0AH
               DB "Press any of the given digit to continue...$"
    
    msg_show_all DB "***************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*               All of your TASKS                 *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "***************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
    
    msg_update_header   DB "***************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*                   UPDATE task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "***************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
    
    msg_add_header   DB "***************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*                  ADD NEW task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "***************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
    msg_delete_header   DB "***************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*                 DELETE A task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "***************************************************", 0DH, 0AH 
                 DB "", 0DH, 0AH
                 DB "$"
                 
    msg_updating_header   DB "***************************************************", 0DH, 0AH 
                 DB "*                                                 *", 0DH, 0AH
                 DB "*               Updating a task                   *", 0DH, 0AH
                 DB "*                                                 *", 0DH, 0AH
                 DB "***************************************************", 0DH, 0AH 
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
    
    newline DB 10, 13, "$"

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
    MOV AH, 10
    LEA DX, buffer
    INT 21H
    
    MOV SI, OFFSET buffer+2
    LEA DI, var
    MOV CX, 50
    
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
END MAIN