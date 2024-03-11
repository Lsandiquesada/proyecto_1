%include "linux64.inc"

section .data
	filename db "Reg_Notas.txt",0


section .bss
	text resb 400000

section .text
	global _start

_start:
	mov rax, SYS_OPEN
	mov rdi, filename
	mov rsi, O_RDONLY
	mov rdx, 0
	syscall

_lectura:
	push rax
	mov rdi, rax
	mov rax, SYS_READ
	mov rsi, text
	mov rdx, 400000
	syscall

_finLectura:
	mov rax, SYS_CLOSE
	pop rdi
	syscall

;	print text

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;Previo a esta parte se encuentra la lectura del documento.
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


	or r8, text ;se guarda en puntero donde inicia el string

	mov rsi, text
	mov r9, [rsi]
	jmp .buscar

	.buscar:
	cld
	mov rsi, text
	mov rdi, 10
	cmpsb
	print rsi
	inc rsi
	jne .buscar
	je .salir

	.salir:

	exit
 
