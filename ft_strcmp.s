global _ft_strcmp

_ft_strcmp:

	xor rax, rax
	xor rdx, rdx
	xor rcx, rcx

_loop:

	mov r8b, BYTE[rdi + rcx]
	mov r9b, BYTE[rsi + rcx]
	cmp r8b, r9b
	jne _end
	cmp r8b, 0
	je _end
	cmp r9b, 0
	je _end
	inc rcx
	jmp _loop

_end:

	movzx rax, r8b
	movzx rdx, r9b
	sub rax, rdx
	ret
