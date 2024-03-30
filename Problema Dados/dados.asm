%include "io.inc"
section .data
n dw 6
section .text
global main
main:
    mov ebp, esp ; for correct debugging
    GET_DEC 4, ecx ; read first number
    mov eax,1
    mov bx, [n]
    .while:
        cmp ecx, 0
        je .end
        mul bx
        dec ecx
        jmp .while
        
    .end :
    PRINT_DEC 4, eax ; print result
    NEWLINE ; print newline
    xor eax, eax ; set eax to 0
    ret ; return