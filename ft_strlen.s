
global _ft_strlen

_ft_strlen:
    push ebp
    mov ebp, esp        ; setup the stack frame

    mov ecx, [ebp+8]

    xor eax, eax        ; iniciar eax a 0


init_loop:
    xor dx, dx
    mov dl, byte [ecx+eax]
    inc eax

    cmp dl, 0x0
    jne init_loop
end:
    pop ebp

    ret