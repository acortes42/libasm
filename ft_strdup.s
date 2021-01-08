
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

	global _ft_strdup

_ft_strdup:
	push rdi         ; guardamos rdi, que sera sobrescrito con malloc

	call _ft_strlen  ; len de rdi a rax y le sumamos una para el '\0'
	inc  rax          

	mov  rdi, rax     ; tamaño a hacer malloc a rdi
	call _malloc
	cmp  rax, 0		;	Si ha fallado el malloc
	je   _error

	pop  rsi
	mov  rdi, rax     ; y ese malloc tiene que salir por aqui para hacer la copia y retorno
	call _ft_strcpy
	ret
_error:	
	pop  rdi
	ret
