%include "io.inc"

section .data
; Datos de entrada
R1 db 0, 0 ; Primer y segundo elemento de R1
R2 db 2, 2 ; Primer y segundo elemento de R2
P1 db 0, 0 ; Primer y segundo elemento de P1
P2 db 1, 2 ; Primer y segundo elemento de P2

section .text
global main

main:
    mov ebp, esp; for correct debugging
    ; Calculamos (r1.1 - r2.1)
    mov al, byte [R1 + 1] ; Cargamos el segundo elemento de R1 en BL
    sub al, byte [R2 + 1] ; Restamos el segundo elemento de R2 a BL

    ; Calculamos (p1.2 - p2.2)
    mov cl, byte [P1 + 1] ; Cargamos el segundo elemento de P1 en CL
    sub cl, byte [P2 + 1]  ; Restamos el segundo elemento de P2 a CL

    ; Multiplicamos los dos resultados (ahora en registros de 8 bits)
    imul cl ; Multiplica el valor en EAX (acumulador de 32 bits) por el valor en CL y almacena el resultado en EAX
    mov bx,ax
    
    ; Calculamos (r1.2 - r2.2)
    mov al, byte [R1 + 1] ; Cargamos el segundo elemento de R1 en DL (lo reutilizamos)
    sub al, byte [R2 + 1]  ; Restamos el segundo elemento de R2 a DL

    ; Calculamos (p1.1 - p2.1)
    mov cl, byte [P1] ; Cargamos el primer elemento de P1 en AL
    sub cl, byte [P2]  ; Restamos el primer elemento de P2 a AL

    ; Multiplicamos los dos resultados (ahora en registros de 8 bits)
    imul cl ; Multiplica el valor en ECX (otro registro de 32 bits) por el valor en EAX y almacena el resultado en ECX

    ; Comparación de los dos productos
    cmp ax, bx

    ; Impresión del resultado (ajustar la sintaxis para su ensamblador)
    je .igual
    PRINT_STRING "Se cortan"
    jmp .fin

.igual:
    PRINT_STRING "No se cortan"

.fin:
    ret