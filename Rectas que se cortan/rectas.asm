%include "io.inc"

section .data
; Datos de entrada
R1 db 0, 0 ; Primer y segundo elemento de R1
R2 db 2, 5 ; Primer y segundo elemento de R2
P1 db 1, 2 ; Primer y segundo elemento de P1
P2 db 0,20  ; Primer y segundo elemento de P2

section .text
global main

main:
    mov ebp, esp; for correct debugging
    ; Calculamos (r1.1 - r2.1)
    mov al, byte [R1 + 1] ; Cargamos el segundo elemento de R1 en AL
    sub al, byte [R2 + 1] ; Restamos el segundo elemento de R2 a AL

    ; Calculamos (p1.2 - p2.2)
    mov cl, byte [P1 + 1] ; Cargamos el segundo elemento de P1 en CL
    sub cl, byte [P2 + 1]  ; Restamos el segundo elemento de P2 a CL

    ; Multiplicamos los dos resultados (ahora en registros de 8 bits)
    imul cl ;Multiplica por el valor en cly almacena el resultado en ax
    mov bx,ax ;guarda en bx
    
    ; Calculamos (r1.2 - r2.2)
    mov al, byte [R1 + 1] ; Cargamos el segundo elemento de R1 en AL (lo reutilizamos)
    sub al, byte [R2 + 1]  ; Restamos el segundo elemento de R2 a AL

    ; Calculamos (p1.1 - p2.1)
    mov cl, byte [P1] ; Cargamos el primer elemento de P1 en CL
    sub cl, byte [P2]  ; Restamos el primer elemento de P2 a CL

    ; Multiplicamos los dos resultados (ahora en registros de 8 bits)
    imul cl ; Multiplica por el valor en cl y almacena el resultado en ax

    ; Comparación de los dos productos
    cmp ax, bx

    ; Impresión del resultado 
    je .igual
    PRINT_STRING "Se cortan"
    jmp .fin

.igual:
    PRINT_STRING "No se cortan"

.fin:
    ret