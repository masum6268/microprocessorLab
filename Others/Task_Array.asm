.model small
.data
myArray DB 100 DUP(0)    ; Define an array with a maximum of 100 elements
arraySize DB 0            ; Variable to keep track of the array size
maxArraySize DB 100       ; Maximum size for the array

newline DB 10, 13, '$'    ; Newline and carriage return characters for formatting
prompt_size DB 'Enter the size of the array (up to 100): $'
prompt_input DB 'Input your numbers (or 0 to finish): $'
output_msg DB 'Array elements are: $'

.code
main PROC
    mov ax, @data
    mov ds, ax

    ; Prompt for the size of the array
    mov ah, 09h
    lea dx, prompt_size
    int 21h

    ; Read the size of the array from the user
    mov ah, 01h
    int 21h
    sub al, '0'
    mov byte ptr [arraySize], al

    mov si, 0                ; Initialize index for the array
    mov cx, 100              ; Initialize cx to the maximum array size

    ; Print a newline for formatting
    mov ah, 09h
    lea dx, newline
    int 21h

input_loop:
    ; Prompt for input
    mov ah, 09h
    lea dx, prompt_input
    int 21h

    ; Read a character from the user
    mov ah, 01h
    int 21h

    ; Convert the input character to a number
    sub al, '0'

    ; Check if the user wants to finish input
    cmp al, 0
    je print_array

    ; Add the input to the array and increment the size
    mov [myArray + si], al
    inc si

    ; Decrement the remaining array size
    dec cx

    ; Check if the array is full or the maximum size is reached
    jz print_array

    jmp input_loop

print_array:
    ; Prompt for output
    mov ah, 09h
    lea dx, output_msg
    int 21h

    ; Print the elements in the array
    mov si, 0                ; Reset the index for the array

print_loop:
    ; Check if we've reached the end of the array
    cmp byte ptr [myArray + si], 0
    je end_program

    ; Print the array element
    mov ah, 02h
    mov dl, [myArray + si]
    add dl, '0'               ; Convert to ASCII character
    int 21h

    ; Move to the next element
    inc si

    ; Print a newline for formatting
    mov ah, 09h
    lea dx, newline
    int 21h

    jmp print_loop

end_program:
    ; Exit the program
    mov ah, 4Ch
    int 21h

main ENDP
end main