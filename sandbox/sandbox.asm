section .text               ; code

global  _start              ; tell ld where to start

_start:                     ; func main
    nop                     ; not required helpful for stepping


    nop                     ; not required helpful for stepping
    mov     eax,1           ; system call number (sys_exit)
    mov     ebx,0           ; exit code
    int     0x80            ; call kernel

section .data

section .bss
