; +------------------------------------------------------------------------------------+
; | Script em Assembly que utiliza a API Message Box do Windows para exibir um pop-up  |
; +------------------------------------------------------------------------------------+
;
; +------------------------------------------------------------------------------------+
; | Documentacao:                                                                      |
; | https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messagebox   |
; +------------------------------------------------------------------------------------+

extern _MessageBoxA ;API
global _main

section .data ;VARIAVEIS
    texto db "Hello World!",0
    titulo db "API Message Box",0

section .text

_main:
    push 0 ;Parametro do tipo da Message Box
    push titulo
    push texto
    push 0
    call _MessageBoxA
