; +----------------------------------------------------------+
; | Script em Assembly que grava valor e zera registradores  |
; +----------------------------------------------------------+

global _main            ;PADRAO NO INICIO DE SCRIPT ASSEMBLY PARA O LINKER
section .text

_main:
    NOP                 ;O NOP NAO FAZ NADA DO CODIGO
    MOV EAX, 41424344h  ;MOVE PARA O EAX O VALOR "ABCD" EM HEXADECIMAL (4 BYTES)
    MOV BX, 4141h       ;MOVE PARA O BX O VALOR  "AA"   EM HEXADECIMAL (2 BYTES)
    MOV CH, 41h         ;MOVE PARA O CH O VALOR  "A"    EM HEXADECIMAL (1 BYTE )
    MOV DL, 41h         ;MOVE PARA O DL O VALOR  "A"    EM HEXADECIMAL (1 BYTE )
    XOR EAX, EAX        ;ZERA O REGISTRADOR EAX
    XOR EBX, EBX        ;ZERA O REGISTRADOR EBX
    XOR ECX, ECX        ;ZERA O REGISTRADOR ECX
    XOR EDX, EDX        ;ZERA O REGISTRADOR EDX
    
; +----------------------------------------------------------+
; |                    ASSEMBLER + LINKER                    |
; | nasm -f win32 manipula_registradores.asm                 |
; | golink /console /entry _main manipula_registradores.obj  |
; +----------------------------------------------------------+
