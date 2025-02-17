include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data

msg_1 db 10 dup(?)
msg_2 db 10 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax
    
    print 'Enter Your 1st String:'
    mov dx, 10
    lea di, msg_1
    call get_string
    
    printn ' '
    print 'Enter Your 2nd String:'
    mov dx, 10
    lea di, msg_2
    call get_string
    printn ' '

    ; How to compare two strings
    print 'out1:'
    lea si, msg_1
    call print_string
    printn ' '
    print 'out2:'
    lea si, msg_2
    call print_string
    printn

    ; Call check_equal_strings
    call StrMatch

    exit:
    mov ah, 4ch
    int 21h
main endp

StrMatch proc
    mov cx, 10
    lea si, msg_1
    lea di, msg_2
    
    check_strings_loop:
    mov al, [si]
    cmp al, [di]
    jne not_equal

    inc si
    inc di
    loop check_strings_loop

    jmp equal

not_equal:
    printn
    print 'Strings do not matched:Access Denied'
    jmp exit

equal:
    print 'Strings Match:Access Granted'
    jmp exit

    ret
    
StrMatch endp

; All built-in functions defined here
define_get_string
define_print_string
end main
