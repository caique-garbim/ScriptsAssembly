; +-----------------------------------------------------------------------------------------+
; | Script em Assembly que utiliza a API Shell Execute do Windows para executar um comando  |
; +-----------------------------------------------------------------------------------------+
;
; +-----------------------------------------------------------------------------------------+
; | Documentacao:                                                                           |
; | https://docs.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecutea   |
; +-----------------------------------------------------------------------------------------+

extern _ShellExecuteA ;API
global _main

section .data ;VARIAVEIS
    tipo db "open",0 ;TIPO "ABRIR"
    programa db "cmd",0 ;PROGRAMA PARA ABRIR
    ;O COMANDO ABAIXO FAZ UM WGET DO PUTTY, SALVA EM C:\WINDOWS\TEMP\ E EXECUTA
    comando db "/c powershell -Command wget 'https://the.earth.li/~sgtatham/putty/0.76/w64/putty.exe' -OutFile C:\Windows\Temp\putty.exe; C:\Windows\Temp\putty.exe"

section .text

_main:
    push 0 ;Janela oculta
    push 0
    push comando ;Comando definido na variavel
    push programa ;Programa definido na variavel, no caso, o CMD
    push tipo ;Abrir
    push 0
    call _ShellExecuteA

; +-----------------------------------------------------------------------------------------+
; |                                   ASSEMBLER + LINKER                                    |
; | nasm -f win32 windows_api_shellexecute.asm                                              |
; | golink /entry _main windows_api_shellexecute.obj Shell32.dll /mix                       |
; +-----------------------------------------------------------------------------------------+
