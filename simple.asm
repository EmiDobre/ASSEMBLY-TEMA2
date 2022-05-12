%include "../include/io.mac"

section .text
    global simple
    extern printf


simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha
    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step
    
caesar:
    xor ebx, ebx
    mov bl, byte[esi + ecx - 1]
    add bl, dl
    cmp bl, 90
    jg depasit
    
    mov byte[edi + ecx - 1], bl
    dec ecx
    cmp ecx, 0
    jg caesar
    jmp continua

depasit:
    sub bl, 26
    mov byte[edi + ecx - 1], bl
    dec ecx;
    cmp ecx, 0
    jg caesar

continua:   
    popa
    leave
    ret

