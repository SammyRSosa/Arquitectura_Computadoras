%include "io.inc"
section .data
n dw 2
caras dw 6
section .text
global main
main:
    mov ebp, esp ; for correct debugging
    mov ecx,0
    mov cx, word[n]
    mov eax,1
    mov bx, [caras]
    .while:
        cmp ecx, 0
        je .end
        mul bx
        dec ecx
        jmp .while
        
    .end :
    PRINT_DEC 4, eax ; print result
    NEWLINE ; print newline
    ret ; return