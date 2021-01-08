
global  _ft_read
extern ___error

_ft_read:
	mov rax, 0x2000003	; base de macOs mas read (3)
	syscall
        jc _error              ; jump if carry flag set
        ret
_error:
	push rax
	call ___error
	mov rdi, rax
	pop rax
	mov [rdi], rax
	mov rax, -1
	ret

;Creo que no esta para nada fino, pero igual esto es lo que se reclama. Creo que complique de más el write