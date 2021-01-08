
global _ft_strcpy

_ft_strcpy:
	xor rdx, rdx
	xor rcx, rcx
	cmp rsi, byte 0x0
	jz _is_null
	_start_loop:
		mov dl, byte [rsi + rcx] ; guardar el char apuntado en dl (dl == 8 bytes == 1 char)
		mov byte [rdi + rcx], dl 
		cmp [rsi + rcx], byte 0x0 
		jz _end_loop ; acabar el loop. Si no, incrementar el apuntador y seguir
		inc rcx
		jmp _start_loop 
	_end_loop:
	mov rax, rdi ; return dst
	ret

_is_null:	;si no hubiera arg valido, hacemos una salida sin operaciones
	mov rax, rsi
	ret
