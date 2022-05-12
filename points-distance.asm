%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points vector
    mov eax, [ebp + 12]     ; distance
    mov edi, eax    ;retin val adresei

    mov dx, word[ebx] ; punctul 1, accesez cu +point.y
    mov cx, word[ebx + 1*4 ]  ; punctul 2

    ;vf daca au x ul egal
    cmp dx, cx
    je X_EQUAL           
    jne Y_EQUAL

X_EQUAL: 
    mov dx, word[ebx + point.y ]
    mov cx, word[ebx + 1*4 + point.y ]
    cmp dx, cx
    jge GREATER
    jl LOW

GREATER:
    mov ax, dx
    sub ax, cx
    jmp CONTINUE

LOW:
    mov ax, cx
    sub ax, dx
    jmp CONTINUE

Y_EQUAL:
    cmp dx, cx
    jge GREATER
    jl LOW


CONTINUE:

    mov word[edi], ax   
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY