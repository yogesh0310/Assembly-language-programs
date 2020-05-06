%macro write 02

        push rax

push rbx

push rcx

push rdx

        mov rax,01

        mov rdi,01

        mov rsi,%1

        mov rdx,%2

syscall

pop rdx

pop rcx

pop rbx

pop rax

%endmacro

section .bss

cnt resb 1

b resb 1

char resb 1

section .data

msg db "enter BCD number",10

len equ $-msg

num dw 0ffffh

section .text

global _start

_start:

mov byte[cnt],00

mov ax,word[num]

mov bx,000Ah

up: mov dx, 0000H

div  bx

push dx

inc  byte[cnt]

cmp ax,00h

jne up

up1: pop dx

add dl,30h

mov byte[char],dl

write char,01

dec byte[cnt]

jnz up1

mov rax,60

mov rdi,0

syscall

jnz up1
