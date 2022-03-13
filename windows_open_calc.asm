; +-----------------------------------------------------------------------------+
; | Script em Assembly que abre a calculadora do Windows (cmd.exe /c calc.exe)  |
; +-----------------------------------------------------------------------------+

extern system
global _main

section .text

_main:
    ;COMANDO SEPARADO EM GRUPOS DE 4 BYTES
    push 0x00657865 ;"EXE"
    push 0x2e636c61 ;"ALC."
    push 0x6320632f ;"/C C"
    push 0x20657865 ;"EXE "
    push 0x2e646d63 ;"CMD."
    push esp
    pop eax
    push eax
    ;ESPECIFIQUE ABAIXO O ENDEREÇO EM MEMORIA DA FUNCAO "SYSTEM" DA MSVCRT.DLL EM SEU SO
    mov ebx, 0x77534720
    call ebx
    
; +-----------------------------------------------------------------------------+
; |                             ASSEMBLER + LINKER                              |
; | nasm -f win32 windows_open_calc.asm                                         |
; | golink /console /entry _main windows_open_calc.obj msvcrt.dll               |
; +-----------------------------------------------------------------------------+
