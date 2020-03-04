
global  _ft_read

_ft_read:
		mov rax, 0x2000003	; base de macOs mas read (3)
		syscall
        jc err              ; jump if carry flag set
        ret
err:
        mov rax, -1
        ret

;Creo que no esta para nada fino, pero igual esto es lo que se reclama. Creo que complique de más el write