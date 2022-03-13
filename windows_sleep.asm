; +----------------------------------------------------------------+
; | Script em Assembly que realiza um Sleep de 5 (cinco) segundos  |
; +----------------------------------------------------------------+

global _main

section .text

_main:
    xor eax, eax        ;ZERA O REGISTRADOR EAX
    mov eax, 5000       ;MOVE 5K MILISEGUNDOS PARA DENTRO DE EAX
    push eax            ;MANDAR O EAX PARA O TOPO DA STACK
    ;ESPECIFIQUE ABAIXO O ENDEREÇO EM MEMORIA DA FUNÇÃO "SLEEP" DA KERNEL32.DLL EM SEU SO
    mov ebx, 0x766a8990 ;MOVE O ENDEREÇO DA FUNÇÃO SLEEP PARA DENTRO DO EBX
    call ebx            ;CHAMA A FUNÇÃO
    
; +----------------------------------------------------------------+
; |                       ASSEMBLER + LINKER                       |
; | nasm -f win32 windows_sleep.asm                                |
; | golink /console /entry _main windows_sleep.obj Kernel32.dll    |
; +----------------------------------------------------------------+
