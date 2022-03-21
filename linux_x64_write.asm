; +-------------------------------------------------------------------------------+
; | Script em Assembly que utiliza a SYSCALL Write do Linux para exibir uma frase |
; +-------------------------------------------------------------------------------+
;
; +-------------------------------------------------------------------------------+
; | Consulta de SYSCALL de Linux x64                                              |
; | https://syscalls.w3challs.com/?arch=x86_64                                    |
; +-------------------------------------------------------------------------------+

global _main

section .data ;VARIAVEIS
	frase: db 'HELLO WORLD',0xa ; 11 CARACTERES DA FRASE + 1 DA QUEBRA DE LINHA
	
section .text

_main:
	mov rax, 1      ;MOVE A SYSCALL DO WRITE (1) PARA RAX
	mov rdi, 1      ;STDIN=0, STDOUT=1, STDERR=2
	mov rsi, frase  ;MOVE PARA O RSI A VARIÁVEL "frase"
	mov rdx, 12     ;TAMANHO DO BUFFER
	syscall         ;EXECUTA O STDOUT
	
	mov rax, 60     ;MOVE A SYSCALL DO EXIT (60) PARA RAX
	mov rdi, 0      ;O EXIT NÃO PRECISA DE ARGUMENTO, LOGO PODE SER ZERO
	syscall         ;EXECUTA O EXIT
  
; +-------------------------------------------------------------------------------+
; |                             ASSEMBLER + LINKER                                |
; | nasm -f elf64 linux_x64_write.asm                                             |
; | ld --entry _main linux_x64_write.o -o linux_x64_write                         |
; +-------------------------------------------------------------------------------+
