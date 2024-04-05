%include "io.inc"
section .data
; Define the array and its size
array dw 10, 5, 15, 2, 8, 4
size dd 6
pertenece db 'T', 0   
no_pertenece db 'F', 0

; Define a variable to store the number
number dd 5

; Reserve space for the new arrays 
section .bss
multiples resb 6
non_multiples resb 6

section .text
global main

main:
    mov ebp, esp  
    
    ; Push size and number onto the stack for calculate_arrays
    
    
    push dword [size]
    push dword [number]
    
    call calculate_arrays
    add esp, 8      ; Restore stack
    

    mov eax, multiples  
    PRINT_STRING "Multiples: "
    
    mov ecx,0
    
    .while1:
    cmp ecx,ebx
    je .go
    NEWLINE
    PRINT_UDEC 1, [multiples + ecx];
    inc ecx
    jmp .while1
    
    .go:
    mov ecx,0
    NEWLINE
    PRINT_STRING "Non Multiples: "
    jmp .while2
    
    .while2:
    cmp ecx,esi
    je .end
    NEWLINE
    PRINT_UDEC 1, [non_multiples + ecx];
    inc ecx
    jmp .while2
    
      
            
    .end:
    ret

    ret

; Function to calculate multiples and non-multiples
calculate_arrays:
    mov ebp, esp  ; Set up stack frame
    mov ecx, 0      ; Initialize index for loop
    mov ebx,0
    mov esi,0

.loop:
    cmp ecx, [size]  ; Compare index with array size (passed as argument)
    je .end      ; If equal, finish loop
    
    ; Load current element
    
    mov edi,ecx
    imul edi,2
    mov ax, word [array + edi]
  
    
    ; Check for divisibility:
    movzx eax, ax  ; Zero-extend to 32-bit for division
    cdq            ; Extend sign for signed division (adjust if unsigned)
    idiv dword [ebp + 4]  ; Divide by number
    cmp edx, 0      ; Check remainder
    
    
    je .multiple  ; If zero, it's a multiple

.not_multiple:
    ; Store in non-multiples array
    mov ax, word [array + edi]
    mov [non_multiples + esi], ax  
    inc esi
    jmp .next      ; Continue loop

.multiple:
    ; Store in multiples array
    mov ax, word [array + edi]
    mov [multiples + ebx], ax   
    
    inc ebx
    
    
.next:
    inc ecx      ; Increment index
    jmp .loop

.end:
    ret

