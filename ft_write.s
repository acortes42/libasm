
global _ft_write

_ft_write:
	push r8
	push r9
	cmp rsi, byte 0x0 ; Si no hay buffer, error
	je _error
	mov r8, rsi ; guardar parametros antes del fstat
	mov r9, rdx
	xor rsi, rsi ; fstat getting buf as second parameter
	mov rax, 0x20000BD ; 0x2000000 (MacOS ?)+ 0xBD (fstat syscall). 
	syscall						;fstat funciona de forma muy especifica, por eso necesitaba hacer todo esto.
	cmp rax, 9 ; si ftat es 9, es un tipo de error(errno) según he leido
	je _error
	mov rsi, r8 ; devolvemos el valor original de rsi y rdx
	mov rdx, r9 
	mov rax, 0x2000004 ; 0x2000000 es arbitrario de macOs y 0x4 el la llamada a sistema write
	syscall ; int 0x80 para 64 bits
	pop r8
	pop r9
	ret

_error:
	mov rax, -1 ; Retornar -1 si falla
	pop r8
	pop r9
	ret
