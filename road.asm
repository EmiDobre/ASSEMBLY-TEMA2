%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    mov esi, ebx ;distante copie

    dec ecx
    
FOR:
    push eax
    mov bx, word[eax + ecx * 4 ] ;arg2
    dec ecx
    mov dx, word[eax + ecx * 4 ]  ;arg1
    
    ;calculeaza distanta dintre ebx si edx
    jmp points_distance

CONTINUE_FOR:
    jmp DISTANCE_VECTOR

AFTER_DISTANCE:
    pop eax
    cmp ecx, 0
    jg FOR
    jmp CONTINUE

points_distance:
    ;vf daca au x ul egal
    cmp dx, bx
    je X_EQUAL           
    jne Y_EQUAL

X_EQUAL: 
    mov dx, word[eax + ecx * 4 + point.y]
    mov bx, word[eax + ecx * 4 + 4 + point.y]
    cmp dx, bx
    jge GREATER
    jl LOW

GREATER:
    mov ax, dx
    sub ax, bx
    jmp CONTINUE_FOR

LOW:
    mov ax, bx
    sub ax, dx
    jmp CONTINUE_FOR

Y_EQUAL:
    cmp dx, bx
    jge GREATER
    jl LOW

DISTANCE_VECTOR
    mov ebx, esi
    mov word[ebx + ecx*4 ], ax
    mov esi, ebx
    jmp AFTER_DISTANCE


CONTINUE
    popa
    leave
    ret