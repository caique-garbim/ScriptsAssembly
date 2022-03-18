; +-------------------------------------------------------------------------------+
; | Script em Assembly que utiliza a SYSCALL Write do Linux para exibir uma frase |
; +-------------------------------------------------------------------------------+
;
; +-------------------------------------------------------------------------------+
; | Consulta de SYSCALL de Linux x86                                              |
; | https://syscalls.w3challs.com/?arch=x86                                       |
; +-------------------------------------------------------------------------------+

global _main

section .data ;VARIAVEIS
	frase: db 'HELLO WORLD',0xa ; 11 CARACTERES DA FRASE + 1 DA QUEBRA DE LINHA
	
section .text

_main:
	mov eax, 4      ;MOVE A SYSCALL DO WRITE (4) PARA EAX
	mov ebx, 1      ;STDIN=0, STDOUT=1, STDERR=2
	mov ecx, frase  ;MOVE PARA O ECX A VARIÁVEL "frase"
	mov edx, 12     ;TAMANHO DO BUFFER
	int 0x80        ;EXECUTA O STDOUT
	
	mov eax, 1      ;MOVE A SYSCALL DO EXIT (1) PARA EAX
	mov ebx, 0      ;O EXIT NÃO PRECISA DE ARGUMENTO, LOGO PODE SER ZERO
	int 0x80        ;EXECUTA O EXIT
  
; +-------------------------------------------------------------------------------+
; |                             ASSEMBLER + LINKER                                |
; | nasm -f elf32 linux_x86_write.asm                                             |
; | ld --entry _main -m elf_i386 linux_x86_write.o -o linux_x86_write             |
; +-------------------------------------------------------------------------------+
