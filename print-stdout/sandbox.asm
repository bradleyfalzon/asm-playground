section .text               ; code

global  _start              ; tell ld where to start

_start:                     ; func main
    nop                     ; not required helpful for stepping

    mov     edx,len         ; message length
    mov     ecx,msg         ; message to write
    mov     ebx,1           ; file descriptor (stdout)
    mov     eax,4           ; system call number (sys_write)
    int     0x80            ; call kernel

    nop                     ; not required helpful for stepping
    mov     eax,1           ; system call number (sys_exit)
    mov     ebx,0           ; exit code
    int     0x80            ; call kernel

section .data

msg     db  'Hello, world!',0xa     ; string and newline
len     equ $-msg                   ; length of string

section .bss
