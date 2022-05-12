%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; vector dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; vector rezultat
    mov esi, ecx            ;vect rez copie
    mov ecx, eax            
    ;; DO NOT MODIFY
    ;; Your code starts here
    dec ecx
    
FOR:
    push ebx
    pop ebx
    mov eax, dword[ebx + ecx * 4 ] ;ultimulel
    dec ecx
    PRINTF32 `---------------ELEM MEU %d\n\x0`, eax
    jmp PERFECT_SQUARE

BACK_FOR    
    cmp ecx, 0
    jge FOR
    jmp CONTINUE

PERFECT_SQUARE:
    push ebx
    ;another use for ebx
    ;contor ebx
    mov edx, eax ;slavez val de vf in edx pt ca se modifica PRIN MUUUUUL
    ;contor pt puteri pana in edx care e de fapt eax acum
    mov ebx, 0

FOR_SQUARE:
    push edx
    mov eax, ebx
    mul ebx
    pop edx
    PRINTF32 `--CU CINE COMPAR: %d\n\x0`, edx
    cmp eax, edx
    jl NEXT_POWER
    jg BACK_FOR_SQUARE ;depaseste edx nuamrul de verificat->ma intorc in for

NEXT_POWER:
    ;PRINTF32 `INMULTIRE GEN: %d\n\x0`, eax
    inc ebx
    cmp eax, edx
    jl FOR_SQUARE
    je SQUARE

SQUARE:
    PRINTF32 `ELEM este square %d\n\n\x0`, eax  ;daca e square il pun in vector
    jmp BACK_FOR_SQUARE


BACK_FOR_SQUARE
    pop ebx
    jmp BACK_FOR



    ;; Your code ends here
CONTINUE:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY