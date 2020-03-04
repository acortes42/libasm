
global _ft_strcmp

_ft_strcmp:
	push r8
	push r9
	push rcx
	mov  r8, rdi  
	mov  r9, rsi  
	mov  rcx, -1   
_loop:
	inc  rcx
	cmp  byte [r8 + rcx], 0   ; si no hay más s1
	je   _finish
	mov  dl, byte [r8 + rcx]
	cmp  dl, byte [r9 + rcx]  ; comparamos los dos valores para ver si son iguales (y bucle igual si lo son)
	je   _loop
_end_loop:

	xor  rax, rax
	mov  al, byte [r8 + rcx]
	sub  al, byte [r9 + rcx]
	jnc  _finish  ; hacer testeo de que no se me haya ido la mano con estas tres lineas

	neg  al   ; si no se cumpliera la condicion de salto, *(-1)
	neg  eax  

_finish:
	pop  rcx
	pop  r9
	pop  r8
	ret